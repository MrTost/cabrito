package types

import (
	"net/http"
	"net/url"
)

type Aranha struct {
	AranhaId   string                   `json:"aranhaId"`
	ProviderId string                   `json:"providerId"`
	BaseUrl    string                   `json:"baseUrl"`
	Entrypoint string                   `json:"entrypoint"`
	Headers    http.Header              `json:"headers"`
	Query      url.Values               `json:"query"`
	Steps      []AranhaStep             `json:"steps"`
	StreamKey  map[string]string        `json:"streamKey"`
	Mapping    map[string]AranhaMapping `json:"mapping"`
}
