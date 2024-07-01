package database

import (
	"cabrito/config"
	"context"
	"github.com/jackc/pgx/v5/pgxpool"
	"log"
	"os"
)

func GetDatabasePool() *pgxpool.Pool {
	cfg := config.GetConfig()

	dbConfig, _ := pgxpool.ParseConfig(cfg.DatabaseURL)

	dbConfig.MinConns = 2
	dbConfig.MaxConns = 10

	dbPool, err := pgxpool.NewWithConfig(context.Background(), dbConfig)
	if err != nil {
		log.Printf("Unable to create connection pool: %v\n", err)
		os.Exit(1)
	}
	defer dbPool.Close()

	return dbPool
}
