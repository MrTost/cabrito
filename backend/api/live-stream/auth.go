package live_stream

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"time"
)

func (api *LiveStreamApi) Auth(w http.ResponseWriter, r *http.Request) {
	log.Printf("")

	channelId := r.PathValue("channelId")
	sourceId := r.PathValue("sourceId")

	log.Printf("Openning auth stream: %s - %s", channelId, sourceId)

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

	// Check cache
	cachedValue, found := api.cache.Get(sourceId)

	if !found {
		log.Printf("live stream auth: cache miss")

		client := &http.Client{}

		log.Printf("URL: %s", liveStreamProxy.Url)

		req, err := http.NewRequest("GET", liveStreamProxy.Url, nil)
		if err != nil {
			fmt.Println("Error creating request:", err)
			return
		}

		req.Header = liveStreamProxy.Headers

		resp, err := client.Do(req)
		if err != nil {
			http.Error(w, "Failed to get auth token", http.StatusInternalServerError)
			return
		}
		defer resp.Body.Close()

		log.Printf("Auth Response: %d", resp.StatusCode)

		// Read the response body
		body, err := io.ReadAll(resp.Body)
		if err != nil {
			http.Error(w, "Failed to read HLS file", http.StatusInternalServerError)
			return
		}

		// Cache the value
		api.cache.Set(sourceId, body, 1*time.Hour)

		cachedValue = body
	} else {
		log.Printf("live stream auth: cache hit")
	}

	// Write the response body to the client
	_, err = w.Write(cachedValue)
	if err != nil {
		http.Error(w, "Failed to write response", http.StatusInternalServerError)
		return
	}
}
