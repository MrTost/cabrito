package types

import (
	"net/http"
	"net/url"
)

type LiveStreamProxy struct {
	Url       string            `json:"url"`
	Headers   http.Header       `json:"headers"`
	Query     url.Values        `json:"query"`
	StreamKey map[string]string `json:"streamKey"`
}
