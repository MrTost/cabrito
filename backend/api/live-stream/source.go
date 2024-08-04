package live_stream

import "net/http"

func (api *LiveStreamApi) SearchSource(w http.ResponseWriter, r *http.Request) {
	jsonData, err := api.db.LiveStreamSource.SearchJson()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	// Set the Content-Type header to application/json
	w.Header().Set("Content-Type", "application/json")

	// Write the JSON data to the response
	_, err = w.Write(jsonData)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}
}
