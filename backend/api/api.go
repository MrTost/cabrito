package api

import (
	"cabrito/api/aranha"
	"cabrito/api/live"
	live_stream "cabrito/api/live-stream"
	"cabrito/database"
	"net/http"
)

func Create(db *database.Persist) *http.ServeMux {
	mux := http.NewServeMux()

	apiAranha := aranha.Create(db)
	mux.HandleFunc("GET /api/aranha", apiAranha.Search)
	mux.HandleFunc("POST /api/aranha", apiAranha.Save)
	mux.HandleFunc("GET /api/aranha/1", apiAranha.A1status)
	mux.HandleFunc("POST /api/aranha/1", apiAranha.A1start)

	apiLive := live.Create(db)
	mux.HandleFunc("POST /api/live/iptv-org", apiLive.IptvOrg)
	mux.HandleFunc("GET /api/live/epg", apiLive.Epg)
	mux.HandleFunc("GET /api/live/epg/category", apiLive.EpgCategories)

	apiLiveStream := live_stream.Create(db)
	mux.HandleFunc("GET /api/live/stream/source", apiLiveStream.SearchSource)
	mux.HandleFunc("POST /api/live/stream/proxy", apiLiveStream.ProxyEncoder)
	mux.HandleFunc("GET /api/live/stream/{channelId}/index.m3u8", apiLiveStream.Master)
	mux.HandleFunc("GET /api/live/stream/{channelId}/{sourceId}/index.m3u8", apiLiveStream.Secondary)
	mux.HandleFunc("GET /api/live/stream/{channelId}/{sourceId}/auth", apiLiveStream.Auth)
	mux.HandleFunc("GET /api/live/stream/{channelId}/{sourceId}/{filename}", apiLiveStream.Segment)

	return mux
}
