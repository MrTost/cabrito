package live

import "net/http"

func (api *Api) Epg(w http.ResponseWriter, r *http.Request) {
	categoryId := r.URL.Query().Get("categoryId")
	if categoryId == "" {
		categoryId = "all"
	}

	jsonData, err := api.db.LiveStreamChannel.SearchJson(categoryId)
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

func (api *Api) EpgCategories(w http.ResponseWriter, r *http.Request) {
	jsonData, err := api.db.LiveStreamCategory.SearchJson()
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
