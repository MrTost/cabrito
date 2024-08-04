package live_stream

import (
	"bytes"
	"cabrito/types"
	"compress/gzip"
	"encoding/base64"
	"encoding/json"
	"fmt"
	"github.com/etherlabsio/go-m3u8/m3u8"
	"log"
	"net/http"
	"net/url"
)

func (api *LiveStreamApi) Master(w http.ResponseWriter, r *http.Request) {
	log.Printf("")

	sourceId := r.URL.Query().Get("sourceId")

	channelId := r.PathValue("channelId")

	log.Printf("Openning master stream: %s", channelId)

	if channelId == "" {
		http.Error(w, "Must have channel id", http.StatusInternalServerError)
		return
	}

	var err error
	var sources []types.LiveStreamSource

	if sourceId != "" {
		source, err := api.db.LiveStreamSource.GetBySourceId(sourceId)
		if err != nil {
			http.Error(w, "Failed to fetch channel sources", http.StatusInternalServerError)
			return
		}
		sources = append(sources, source)
	} else {
		sources, err = api.db.LiveStreamSource.GetByChannelId(channelId)
		if err != nil {
			http.Error(w, "Failed to fetch channel sources", http.StatusInternalServerError)
			return
		}
	}

	masterPlaylist := m3u8.NewPlaylist()

	client := &http.Client{}

	for _, source := range sources {
		masterUrl, err := url.JoinPath(source.SourceUrl, source.SourceFile)
		if err != nil {
			log.Println("Error creating master url", err)
			continue
		}

		log.Printf("URL: %s", masterUrl)

		req, err := http.NewRequest("GET", masterUrl, nil)
		if err != nil {
			log.Println("Error creating request to get master playlist", err)
			continue
		}

		req.Header = source.SourceHeaders

		// Make a GET request to the HLS endpoint
		resp, err := client.Do(req)
		if err != nil {
			log.Println("Failed to fetch HLS file", err)
			continue
		}
		defer resp.Body.Close()

		log.Printf("Master Response: %d", resp.StatusCode)

		playlist, err := m3u8.Read(resp.Body)
		if err != nil {
			log.Println("Failed to read HLS file", err)
			continue
		}

		log.Println("Is playlist master: ", playlist.IsMaster())

		if playlist.IsMaster() {
			for _, item := range playlist.Items {
				switch item := item.(type) {
				case *m3u8.PlaylistItem:
					// Modify the EXT-X-STREAM-INF URI
					playlistUrl, err := getStreamInfUrl(&source, item.URI)
					if err != nil {
						log.Println("Error parsing playlist uri", err)
						continue
					}

					item.URI = playlistUrl

					masterPlaylist.AppendItem(item)
				}
			}
		} else {
			playlistUrl, err := getStreamInfUrl(&source, masterUrl)
			if err != nil {
				log.Println("Error parsing playlist uri", err)
				continue
			}

			item := &m3u8.PlaylistItem{URI: playlistUrl}

			masterPlaylist.AppendItem(item)
		}

	}

	// Set Content-Type header to "application/vnd.apple.mpegurl"
	w.Header().Set("Content-Type", "application/vnd.apple.mpegurl")

	// Write the response body to the client
	_, err = w.Write([]byte(masterPlaylist.String()))
	if err != nil {
		http.Error(w, "Failed to write response", http.StatusInternalServerError)
		return
	}
}

func getStreamInfUrl(source *types.LiveStreamSource, playlistUri string) (string, error) {
	var uri, err = url.Parse(playlistUri)
	if err != nil {
		log.Println("Error parsing playlist uri", err)
		return "", err
	}

	sourceUrl := playlistUri

	if uri.Host == "" {
		sourceUrl, err = url.JoinPath(source.SourceUrl, playlistUri)
		if err != nil {
			log.Println("Error parsing joining playlist uri", err)
			return "", err
		}
		log.Println("sourceUrl: ", sourceUrl)
	}

	liveStreamProxy := types.LiveStreamProxy{
		Url:       sourceUrl,
		Headers:   source.SourceHeaders,
		Query:     source.SourceQuery,
		StreamKey: source.SourceStreamKey,
	}

	streamProxy, err := encodeLiveStreamProxy(&liveStreamProxy)
	if err != nil {
		log.Println("Error getting stream proxy", err)
		return "", err
	}

	filename := source.SourceId + "/index.m3u8"
	playlistUrl := fmt.Sprintf("%s?proxy=%s", filename, streamProxy)

	return playlistUrl, nil
}

func encodeLiveStreamProxy(streamProxy *types.LiveStreamProxy) (string, error) {
	proxyBytes, err := json.Marshal(streamProxy)
	if err != nil {
		return "", err
	}

	jsonString := string(proxyBytes)

	compressed, err := compressString(jsonString)
	if err != nil {
		return "", err
	}

	base64Encoded := base64.URLEncoding.EncodeToString(compressed)

	queryEscaped := url.QueryEscape(base64Encoded)

	return queryEscaped, nil
}

func compressString(input string) ([]byte, error) {
	var buf bytes.Buffer
	gz := gzip.NewWriter(&buf)
	if _, err := gz.Write([]byte(input)); err != nil {
		return nil, err
	}
	if err := gz.Close(); err != nil {
		return nil, err
	}
	return buf.Bytes(), nil
}
