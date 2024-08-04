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

//go:embed sql/searchJson.sql
var sqlSearchJson string

func (db *Persist) SearchJson() ([]byte, error) {
	ctx := context.Background()

	var jsonData []byte

	// todo: implement profile feature and replace hard-coded id
	err := db.pool.QueryRow(ctx, sqlSearchJson).Scan(&jsonData)

	return jsonData, err
}
