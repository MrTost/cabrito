package types

import "net/http"

type LiveStreamProxy struct {
	Url     string            `json:"url"`
	Headers http.Header       `json:"headers"`
	Query   map[string]string `json:"query"`
}
