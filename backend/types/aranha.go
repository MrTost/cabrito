package types

import (
	"net/http"
	"net/url"
)

type Aranha struct {
	AranhaId   string            `json:"aranhaId"`
	ProviderId string            `json:"providerId"`
	BaseUrl    string            `json:"baseUrl"`
	Entrypoint string            `json:"entrypoint"`
	Headers    http.Header       `json:"headers"`
	Query      url.Values        `json:"query"`
	Step0      []string          `json:"step0"`
	Step1      []string          `json:"step1"`
	Step2      []string          `json:"step2"`
	Step3      []string          `json:"step3"`
	StreamKey  map[string]string `json:"streamKey"`
}
