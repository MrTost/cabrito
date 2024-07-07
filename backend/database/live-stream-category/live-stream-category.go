package live_stream_category

import (
	"cabrito/types"
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

func (db *Persist) Save(category *types.IptvOrgCategory) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		saveSql,
		category.Id,
		category.Name)
	if err != nil {
		log.Printf("Error saving the channel: %s", err)
		return err
	}

	return nil
}
