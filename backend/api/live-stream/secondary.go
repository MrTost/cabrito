package live_stream

import (
	"bytes"
	"cabrito/types"
	"compress/gzip"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"github.com/etherlabsio/go-m3u8/m3u8"
	"log"
	"net/http"
	"net/url"
	"path"
	"strings"
)

func (api *LiveStreamApi) Secondary(w http.ResponseWriter, r *http.Request) {
	log.Printf("")

	channelId := r.PathValue("channelId")
	sourceId := r.PathValue("sourceId")

	log.Printf("Openning secondary stream: %s - %s", channelId, sourceId)

	if channelId == "" {
		http.Error(w, "Must have channel id", http.StatusInternalServerError)
		return
	}
	if sourceId == "" {
		http.Error(w, "Must have source id", http.StatusInternalServerError)
		return
	}

	liveStreamProxy, err := decodeLiveStreamProxy(r.URL.Query().Get("proxy"))
	if err != nil {
		http.Error(w, "Must have proxy query param", http.StatusInternalServerError)
		return
	}

	client := &http.Client{}

	log.Printf("URL: %s", liveStreamProxy.Url)

	req, err := http.NewRequest("GET", liveStreamProxy.Url, nil)
	if err != nil {
		fmt.Println("Error creating request:", err)
		return
	}

	req.Header = liveStreamProxy.Headers

	// Make a GET request to the HLS endpoint
	resp, err := client.Do(req)
	if err != nil {
		http.Error(w, "Failed to fetch HLS file", http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	log.Printf("Secondary Response: %d", resp.StatusCode)

	playlist, err := m3u8.Read(resp.Body)
	if err != nil {
		http.Error(w, "Failed to read HLS file", http.StatusInternalServerError)
		return
	}

	log.Printf("Parsed playlist %v\n", playlist)

	for _, item := range playlist.Items {
		switch item := item.(type) {
		case *m3u8.KeyItem:
			// Modify the EXT-X-KEY URI
			var keyUrl = strings.Clone(*item.Encryptable.URI)

			for key, value := range liveStreamProxy.StreamKey {
				keyUrl = strings.ReplaceAll(keyUrl, key, value)
			}

			authProxy := types.LiveStreamProxy{
				Url:     keyUrl,
				Headers: liveStreamProxy.Headers,
			}

			proxyEncoded, err := encodeLiveStreamProxy(&authProxy)
			if err != nil {
				http.Error(w, "Error encoding segment proxy", http.StatusInternalServerError)
				return
			}

			authUri := fmt.Sprintf("/api/live/stream/%s/%s/auth?proxy=%s", channelId, sourceId, proxyEncoded)

			item.Encryptable.URI = &authUri
		case *m3u8.SegmentItem:
			segmentUrl, err := url.Parse(item.Segment)
			if err != nil {
				http.Error(w, "Error parsing segment url", http.StatusInternalServerError)
				return
			}

			segmentProxy := types.LiveStreamProxy{
				Url:     "",
				Headers: liveStreamProxy.Headers,
			}

			if segmentUrl.Host == "" {
				sourceUrl, err := url.Parse(liveStreamProxy.Url)
				if err != nil {
					http.Error(w, "Error parsing source url", http.StatusInternalServerError)
					return
				}

				segments := strings.Split(sourceUrl.Path, "/")
				segments[len(segments)-1] = segmentUrl.Path
				sourceUrl.Path = strings.Join(segments, "/")

				segmentProxy.Url = sourceUrl.String()
			} else {
				segmentProxy.Url = segmentUrl.String()
			}

			proxyEncoded, err := encodeLiveStreamProxy(&segmentProxy)
			if err != nil {
				http.Error(w, "Error encoding segment proxy", http.StatusInternalServerError)
				return
			}

			filename := path.Base(segmentUrl.Path)

			item.Segment = fmt.Sprintf("%s?proxy=%s", filename, proxyEncoded)
		}
	}

	playlistString, err := m3u8.Write(playlist)
	if err != nil {
		http.Error(w, "Failed to generate HLS file", http.StatusInternalServerError)
		return
	}

	// Set Content-Type header to "application/vnd.apple.mpegurl"
	w.Header().Set("Content-Type", "application/vnd.apple.mpegurl")

	// Write the response body to the client
	_, err = w.Write([]byte(playlistString))
	if err != nil {
		http.Error(w, "Failed to write response", http.StatusInternalServerError)
		return
	}
}

func decodeLiveStreamProxy(proxyEncoded string) (*types.LiveStreamProxy, error) {
	if proxyEncoded == "" {
		log.Printf("Proxy query param is empty")
		return nil, errors.New("proxy query param is empty")
	}

	proxyUnescaped, err := url.QueryUnescape(proxyEncoded)
	if err != nil {
		log.Printf("Error unescaping proxy query param: %s", err)
		return nil, err
	}

	proxyBytes, err := base64.URLEncoding.DecodeString(proxyUnescaped)
	if err != nil {
		log.Printf("Error decoding proxy query param: %s", err)
		return nil, err
	}

	decompressed, err := decompressString(proxyBytes)
	if err != nil {
		log.Printf("Error decompressing proxy query param: %s", err)
		return nil, err
	}

	proxy := &types.LiveStreamProxy{}

	err = json.Unmarshal(decompressed, proxy)
	if err != nil {
		log.Printf("Error parsing proxy query param: %s", err)
		return nil, err
	}

	return proxy, nil
}

func decompressString(input []byte) ([]byte, error) {
	r, err := gzip.NewReader(bytes.NewReader(input))
	if err != nil {
		return nil, err
	}
	defer r.Close()

	var buf bytes.Buffer
	if _, err := buf.ReadFrom(r); err != nil {
		return nil, err
	}
	return buf.Bytes(), nil
}
