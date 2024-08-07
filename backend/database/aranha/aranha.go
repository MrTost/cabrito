package aranha

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

//go:embed sql/searchJson.sql
var sqlSearchJson string

func (db *Persist) SearchJson() ([]byte, error) {
	ctx := context.Background()

	var jsonData []byte

	err := db.pool.QueryRow(ctx, sqlSearchJson).Scan(&jsonData)

	return jsonData, err
}

//go:embed sql/save.sql
var saveSql string

func (db *Persist) Save(aranha *types.Aranha) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		saveSql,
		aranha.AranhaId,
		aranha.ProviderId,
		aranha.BaseUrl,
		aranha.Entrypoint,
		aranha.Headers,
		aranha.Query,
		aranha.StreamKey,
		aranha.Steps,
		aranha.Mapping,
	)
	if err != nil {
		log.Printf("Error saving the live: %s", err)
		return err
	}

	return nil
}

//go:embed sql/getById.sql
var sqlGetById string

func (db *Persist) GetById(aranhaId string) (*types.Aranha, error) {
	ctx := context.Background()

	rows := db.pool.QueryRow(ctx, sqlGetById, aranhaId)

	var aranha types.Aranha

	err := rows.Scan(
		&aranha.AranhaId,
		&aranha.ProviderId,
		&aranha.BaseUrl,
		&aranha.Entrypoint,
		&aranha.Headers,
		&aranha.Query,
		&aranha.StreamKey,
		&aranha.Steps,
		&aranha.Mapping,
	)
	if err != nil {
		log.Printf("Error scanning row: %v\n", err)
		return nil, err
	}

	return &aranha, err
}
