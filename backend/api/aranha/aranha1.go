package aranha

import (
	"cabrito/types"
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/etherlabsio/go-m3u8/m3u8"
	"io"
	"log"
	"net/http"
	"net/url"
	"path"
	"regexp"
	"slices"
	"time"
)

func (api *Api) A1status(w http.ResponseWriter, r *http.Request) {
	api.jobs.a1.Mu.Lock()
	defer api.jobs.a1.Mu.Unlock()

	if api.jobs.a1.Running {
		http.Error(w, "Job is already running", http.StatusOK)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Job not running"))
}

func (api *Api) A1start(w http.ResponseWriter, r *http.Request) {
	api.jobs.a1.Mu.Lock()
	defer api.jobs.a1.Mu.Unlock()

	if api.jobs.a1.Running {
		http.Error(w, "Job is already running", http.StatusConflict)
		return
	}

	aranha, err := api.db.Aranha.GetById("aranha1")
	if err != nil {
		http.Error(w, "Error getting aranha settings", http.StatusConflict)
		return
	}

	var filter types.AranhaStart

	if r.Body != nil {
		err = json.NewDecoder(r.Body).Decode(&filter)
		if err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
	}

	api.jobs.a1.Running = true
	go api.a1Job(aranha, &filter)

	w.WriteHeader(http.StatusAccepted)
	w.Write([]byte("Job started"))
}

func (api *Api) a1Job(aranha *types.Aranha, filter *types.AranhaStart) {
	var channelList []types.LiveStreamSource

	channelListUrl := aranha.BaseUrl + aranha.Entrypoint

	header, _, body, _ := doRequest(&aranha.Headers, channelListUrl, false)

	step0ParseResponse(aranha, &channelList, body)

	if filter != nil && len(filter.ChannelNum) > 0 {
		channelList = slices.DeleteFunc(channelList, func(ch types.LiveStreamSource) bool {
			return !slices.Contains(filter.ChannelNum, ch.ChannelNum)
		})
	}

	channelsTotal := len(channelList)

	err := api.db.LiveStreamSource.ScanStart(aranha.ProviderId)
	if err != nil {
		log.Printf("Error running aranha 1: %v", err)

		api.jobs.a1.Mu.Lock()
		api.jobs.a1.Running = false
		api.jobs.a1.Mu.Unlock()
		return
	}

	for i := range channelList {
		channel := &(channelList)[i]

		log.Printf("Channel: %d/%d %s - %s - %s", i, channelsTotal, channel.ChannelNum, channel.ChannelName, channel.ChannelUrl)

		err := api.db.LiveStreamSource.ScanSaveChannel(aranha.ProviderId, channel)
		if err != nil {
			log.Printf("Error saving the channel: %v", err)
		}
	}

	log.Println("")

	channel, err := api.db.LiveStreamSource.ScanGetChannel(aranha.ProviderId)
	if err != nil {
		log.Printf("Error running aranha 1: %v", err)

		api.jobs.a1.Mu.Lock()
		api.jobs.a1.Running = false
		api.jobs.a1.Mu.Unlock()
		return
	}

	for channel != nil {
		channel, err = api.db.LiveStreamSource.ScanGetChannel(aranha.ProviderId)
		if err != nil {
			api.jobs.a1.Mu.Lock()
			api.jobs.a1.Running = false
			api.jobs.a1.Mu.Unlock()
			return
		}

		sourceHeader := header.Clone()

		channel, err = getChannelSource(aranha, channel, &sourceHeader, channelListUrl)
		if err != nil {
			log.Println("Error getting channel source")
		}

		channel.SourceStreamKey = aranha.StreamKey

		err = api.db.LiveStreamSource.ScanSaveSource(channel, err)
		if err != nil {
			log.Println("Error saving the channel source")
		}

		log.Println("")

		time.Sleep(5 * time.Second)
	}

	err = api.db.LiveStreamSource.ScanEnd(aranha.ProviderId)
	if err != nil {
		log.Printf("Error running aranha 1: %v", err)

		api.jobs.a1.Mu.Lock()
		api.jobs.a1.Running = false
		api.jobs.a1.Mu.Unlock()
		return
	}

	log.Println("All channels refreshed")

	api.jobs.a1.Mu.Lock()
	api.jobs.a1.Running = false
	api.jobs.a1.Mu.Unlock()
	return
}

func getSourceUrl(channel *types.LiveStreamSource) string {
	// Parse the base URL
	u, err := url.Parse(channel.SourceUrl)
	if err != nil {
		log.Println("Error parsing base URL:", err)
		return ""
	}

	// Resolve the path relative to the base URL
	u.Path, err = url.JoinPath(u.Path, channel.SourceFile)
	if err != nil {
		log.Println("Error joining URL:", err)
		return ""
	}

	// Add query parameters
	u.RawQuery = channel.SourceQuery.Encode()

	return u.String()
}

func getChannelSource(aranha *types.Aranha, channel *types.LiveStreamSource, header *http.Header, prevUrl string) (*types.LiveStreamSource, error) {
	log.Printf("Channel: %s - %s", channel.ChannelNum, channel.ChannelName)

	// STEP 1

	currUrl := channel.ChannelUrl
	log.Printf("Step 1: %s => %s", prevUrl, currUrl)

	header, currUrl, body, err := doRequest(header, currUrl, false)
	if err != nil {
		log.Printf("Error executing step1GetChannelPage: %s", err)
		return channel, err
	}

	err = step1ParseResponse(aranha, channel, body)
	if err != nil {
		log.Printf("Error executing step1ParseResponse: %s", err)
		return channel, err
	}

	// STEP 2

	prevUrl = currUrl
	currUrl = getSourceUrl(channel)
	log.Printf("Step 2: %s => %s", prevUrl, currUrl)

	header, currUrl, body, err = doRequest(header, currUrl, false)
	if err != nil {
		log.Printf("Error executing step2GetPlaylistSrc: %s", err)
		return channel, err
	}

	err = step2ParseResponse(aranha, channel, body)
	if err != nil {
		log.Printf("Error executing step2ParseResponse: %s", err)
		return channel, err
	}

	// STEP 3

	prevUrl = currUrl
	currUrl = getSourceUrl(channel)
	log.Printf("Step 3: %s => %s", prevUrl, currUrl)

	sourceUrl, header, err := searchPlayableUrl(header, currUrl)
	if err != nil {
		log.Printf("Error executing searchPlayableUrl: %s", err)
		return channel, err
	}

	channel.SourceHeaders = header.Clone()
	err = setSourceUrl(channel, sourceUrl)
	if err != nil {
		log.Printf("error at setSourceUrl: %s", err)
		return channel, err
	}

	log.Printf("Done: %s - %s - %s%s", channel.ChannelNum, channel.ChannelName, channel.SourceUrl, channel.SourceFile)

	return channel, err
}

func setSourceUrl(channel *types.LiveStreamSource, urlString string) error {
	parsedURL, err := url.Parse(urlString)
	if err != nil {
		errM := fmt.Sprintf("error parsing URL: %v", err)
		return errors.New(errM)
	}

	channel.SourceUrl = parsedURL.Scheme + "://" + parsedURL.Host + path.Dir(parsedURL.Path) + "/"
	channel.SourceFile = path.Base(parsedURL.Path)
	channel.SourceQuery = parsedURL.Query()
	return nil
}

func doRequest(header *http.Header, currUrl string, keepAlive bool) (*http.Header, string, *[]byte, error) {
	client := &http.Client{}

	req, err := http.NewRequest("GET", currUrl, nil)
	if err != nil {
		log.Println("ERROR: creating request:", err)
		return header, "", nil, err
	}

	if keepAlive {
		req.Header.Set("Keep-Alive", "true")
	}

	req.Header = header.Clone()

	resp, err := client.Do(req)
	if err != nil {
		log.Println("ERROR: performing request:", err)
		return header, "", nil, err
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Println("ERROR: reading response body:", err)
		return header, "", nil, err
	}

	finalURL := resp.Request.URL

	// header propagation
	header.Set("Origin", finalURL.Scheme+"://"+finalURL.Hostname())
	header.Set("Referer", finalURL.Scheme+"://"+finalURL.Hostname()+"/")

	return header, finalURL.String(), &body, nil
}

func step0ParseResponse(aranha *types.Aranha, channels *[]types.LiveStreamSource, body *[]byte) {
	log.Printf("Parsing channels list")

	// Find matching blocks using regular expressions
	chBlockRegex := regexp.MustCompile(aranha.Step0[0])
	chBlockMatches := chBlockRegex.FindAllString(string(*body), -1)
	if len(chBlockMatches) == 0 {
		fmt.Println("No matching blocks found")
		return
	}

	// Find channel data within the matching block
	chanDataRegex := regexp.MustCompile(aranha.Step0[1])
	chanDataMatches := chanDataRegex.FindAllStringSubmatch(chBlockMatches[0], -1)

	channelNumRegex := regexp.MustCompile(aranha.Step0[2])

	for _, match := range chanDataMatches {
		if len(match) < 2 {
			log.Printf("ERROR: could not extract href and name")
			continue
		}

		href := match[1]
		name := match[2]

		if !(href != "" && name != "") {
			log.Printf("ERROR: href: %s, or name: %s are empty", href, name)
			continue
		}

		channelUrl, err := url.JoinPath(aranha.BaseUrl, href)
		if err != nil {
			log.Printf("ERROR: joining path: %s and %s", aranha.BaseUrl, href)
			continue
		}

		binHash := md5.Sum([]byte(channelUrl))
		channelId := hex.EncodeToString(binHash[:])

		channel := types.LiveStreamSource{
			SourceId:    channelId,
			ChannelUrl:  channelUrl,
			ChannelName: name,
		}

		channelNumMatches := channelNumRegex.FindStringSubmatch(href)
		if len(channelNumMatches) > 1 {
			channel.ChannelNum = channelNumMatches[1]
		}

		*channels = append(*channels, channel)
	}
}

func step1ParseResponse(aranha *types.Aranha, channel *types.LiveStreamSource, body *[]byte) error {
	urlRegex := regexp.MustCompile(aranha.Step1[0])
	urlMatches := urlRegex.FindStringSubmatch(string(*body))
	if len(urlMatches) < 2 {
		return errors.New("URL not found in response")
	}

	return setSourceUrl(channel, urlMatches[1])
}

func step2ParseResponse(aranha *types.Aranha, channel *types.LiveStreamSource, body *[]byte) error {
	urlRegex := regexp.MustCompile(aranha.Step2[0])
	urlMatches := urlRegex.FindStringSubmatch(string(*body))

	if len(urlMatches) < 2 {
		return errors.New("URL not found in response")
	}

	decodedBytes, err := base64.StdEncoding.DecodeString(urlMatches[1])
	if err != nil {
		errM := fmt.Sprintf("failed to decode base64 string: %v", err)
		return errors.New(errM)
	}

	return setSourceUrl(channel, string(decodedBytes))
}

func searchPlayableUrl(header *http.Header, currUrl string) (string, *http.Header, error) {
	client := &http.Client{}

	req, err := http.NewRequest("GET", currUrl, nil)
	if err != nil {
		log.Println("Error creating request:", err)
		return "", nil, err
	}

	header.Set("Keep-Alive", "true")

	req.Header = header.Clone()

	resp, err := client.Do(req)
	if err != nil {
		log.Println("Error performing request:", err)
		return "", nil, err
	}
	defer resp.Body.Close()

	playlist, err := m3u8.Read(resp.Body)
	if err != nil {
		return "", nil, err
	}

	// TODO - test master playlist by fetching video segments

	if !playlist.IsMaster() {
		return "", nil, errors.New("invalid playlist")
	}

	finalURL := resp.Request.URL

	return finalURL.String(), header, nil
}
