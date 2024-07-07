package live_stream_channel_category

import (
	"context"
	_ "embed"
	"github.com/jackc/pgx/v5/pgxpool"
	"log"
)

type Persist struct {
	pool *pgxpool.Pool
}

func Create(pool *pgxpool.Pool) *Persist {
	return &Persist{
		pool: pool,
	}
}

//go:embed sql/save.sql
var saveSql string

func (db *Persist) Save(channelId string, categoryId string) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		saveSql,
		channelId,
		categoryId)
	if err != nil {
		log.Printf("Error saving the channel category: %s - %s: %s", channelId, categoryId, err)
		return err
	}

	return nil
}
