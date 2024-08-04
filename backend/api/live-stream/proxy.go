package live_stream

import (
	"cabrito/types"
	"encoding/json"
	"net/http"
)

func (api *LiveStreamApi) ProxyEncoder(w http.ResponseWriter, r *http.Request) {
	var liveStreamProxy types.LiveStreamProxy
	err := json.NewDecoder(r.Body).Decode(&liveStreamProxy)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	streamProxy, err := encodeLiveStreamProxy(&liveStreamProxy)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "text/plain; charset=UTF-8")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(streamProxy))
}
