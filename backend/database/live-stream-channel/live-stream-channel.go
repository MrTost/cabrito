package live_stream_channel

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

func (db *Persist) Save(channel *types.IptvOrgChannel) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		saveSql,
		channel.Id,
		channel.Name,
		channel.AltNames,
		channel.Country,
		channel.City,
		channel.Subdivision,
		channel.Launched,
		channel.Closed,
		channel.Replaced_by)
	if err != nil {
		log.Printf("Error saving the channel: %s", err)
		return err
	}

	return nil
}

//go:embed sql/searchJson.sql
var sqlSearchJson string

func (db *Persist) SearchJson(categoryId string) ([]byte, error) {
	ctx := context.Background()

	var jsonData []byte

	// todo: implement profile feature and replace hard-coded id
	err := db.pool.QueryRow(ctx, sqlSearchJson, categoryId).Scan(&jsonData)

	return jsonData, err
}
