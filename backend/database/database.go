package database

import (
	"cabrito/config"
	"cabrito/database/aranha"
	live_stream_category "cabrito/database/live-stream-category"
	live_stream_channel "cabrito/database/live-stream-channel"
	live_stream_channel_category "cabrito/database/live-stream-channel-category"
	live_stream_source "cabrito/database/live-stream-source"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"log"
	"os"
)

func getDatabasePool() *pgxpool.Pool {
	cfg := config.GetConfig()

	dbConfig, err := pgxpool.ParseConfig(cfg.DatabaseURL)
	if err != nil {
		log.Printf("Unable parse database url: %v\n", err)
		os.Exit(1)
	}

	dbConfig.MinConns = 2
	dbConfig.MaxConns = 10

	dbPool, err := pgxpool.NewWithConfig(context.Background(), dbConfig)
	if err != nil {
		log.Printf("Unable to create connection pool: %v\n", err)
		os.Exit(1)
	}

	return dbPool
}

type Persist struct {
	Aranha                    *aranha.Persist
	LiveStreamCategory        *live_stream_category.Persist
	LiveStreamChannel         *live_stream_channel.Persist
	LiveStreamChannelCategory *live_stream_channel_category.Persist
	LiveStreamSource          *live_stream_source.Persist
}

func Create() (*Persist, *pgxpool.Pool) {
	pool := getDatabasePool()

	return &Persist{
		Aranha:                    aranha.Create(pool),
		LiveStreamCategory:        live_stream_category.Create(pool),
		LiveStreamChannel:         live_stream_channel.Create(pool),
		LiveStreamChannelCategory: live_stream_channel_category.Create(pool),
		LiveStreamSource:          live_stream_source.Create(pool),
	}, pool
}
