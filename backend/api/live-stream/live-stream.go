package live_stream

import (
	"cabrito/cache"
	"cabrito/database"
)

type LiveStreamApi struct {
	db    *database.Persist
	cache *cache.Cache
}

func Create(db *database.Persist) *LiveStreamApi {
	return &LiveStreamApi{
		db:    db,
		cache: cache.NewCache(),
	}
}
