package config

import (
	"encoding/json"
	"log"
	"os"
	"sync"
)

type Config struct {
	DatabaseURL string `json:"database_url"`
}

var configOnce sync.Once
var cfg *Config

func initConfig() {
	file, err := os.ReadFile("config.json")
	if err != nil {
		log.Fatalf("Error reading config file: %v", err)
	}

	// Parse JSON into Config struct
	cfg = &Config{}
	if err := json.Unmarshal(file, cfg); err != nil {
		log.Fatalf("Error parsing config file: %v", err)
	}
}

func GetConfig() *Config {
	configOnce.Do(initConfig)
	return cfg
}
