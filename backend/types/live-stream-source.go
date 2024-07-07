package types

import (
	"net/http"
	"net/url"
)

type LiveStreamSource struct {
	SourceId       string
	ChannelId      string
	CountryId      string
	LangId         string
	ProviderId     string
	ChannelName    string
	ChannelNum     string
	ChannelUrl     string
	ChannelCountry string
	ChannelLang    string
	SourceUrl      string
	SourceFile     string
	SourceHeaders  http.Header
	SourceQuery    url.Values
	Resolution     string
	ScanStatus     string
}
