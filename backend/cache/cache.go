package cache

import (
	"sync"
	"time"
)

type Cache struct {
	data map[string]cacheItem
	mu   sync.Mutex
}

type cacheItem struct {
	value      []byte
	expiration time.Time
}

func NewCache() *Cache {
	return &Cache{
		data: make(map[string]cacheItem),
	}
}

func (c *Cache) Get(key string) ([]byte, bool) {
	c.mu.Lock()
	defer c.mu.Unlock()
	item, found := c.data[key]
	if !found || item.expired() {
		return nil, false
	}
	return item.value, true
}

func (c *Cache) Set(key string, value []byte, ttl time.Duration) {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.data[key] = cacheItem{
		value:      value,
		expiration: time.Now().Add(ttl),
	}
}

func (item cacheItem) expired() bool {
	return item.expiration.Before(time.Now())
}
