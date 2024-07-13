package live_stream

import (
	"io"
	"log"
	"net/http"
)

func (api *LiveStreamApi) Segment(w http.ResponseWriter, r *http.Request) {
	log.Printf("")

	channelId := r.PathValue("channelId")
	sourceId := r.PathValue("sourceId")
	filename := r.PathValue("filename")

	log.Printf("Openning segment stream: %s - %s - %s", channelId, sourceId, filename)

	if channelId == "" {
		http.Error(w, "Must have channel id", http.StatusInternalServerError)
		return
	}
	if sourceId == "" {
		http.Error(w, "Must have source id", http.StatusInternalServerError)
		return
	}
	if filename == "" {
		http.Error(w, "Must have filemane", http.StatusInternalServerError)
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
		http.Error(w, "Error creating request", http.StatusInternalServerError)
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

	log.Printf("Segment Response: %d - %s", resp.StatusCode, resp.Request.URL.String())

	// Set Content-Type header to "application/vnd.apple.mpegurl"
	w.Header().Set("Content-Type", "application/vnd.apple.mpegurl")

	// Write the response body to the client
	_, err = io.Copy(w, resp.Body)
	if err != nil {
		log.Print("Error copying body to response", err)
		http.Error(w, "Failed to write response", http.StatusInternalServerError)
		return
	}
}
