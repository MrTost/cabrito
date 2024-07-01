package database

import (
	"ariga.io/atlas-go-sdk/atlasexec"
	"cabrito/config"
	"context"
	"embed"
	"fmt"
	"io/fs"
	"log"
)

//go:embed migrations/*
var migrations embed.FS

func RunMigration() {
	cfg := config.GetConfig()

	migrationsDir, _ := fs.Sub(migrations, "migrations")

	// Define the execution context, supplying a migration directory
	// and potentially an `atlas.hcl` configuration file using `atlasexec.WithHCL`.
	workdir, err := atlasexec.NewWorkingDir(
		atlasexec.WithMigrations(
			migrationsDir,
		),
	)
	if err != nil {
		log.Fatalf("failed to load working directory: %v", err)
	}
	// atlasexec works on a temporary directory, so we need to close it
	defer workdir.Close()

	// Initialize the client.
	client, err := atlasexec.NewClient(workdir.Path(), "atlas")
	if err != nil {
		log.Fatalf("failed to initialize client: %v", err)
	}
	// Run `atlas migrate apply` on a SQLite database under /tmp.
	res, err := client.MigrateApply(context.Background(), &atlasexec.MigrateApplyParams{
		URL: cfg.DatabaseURL,
	})
	if err != nil {
		log.Fatalf("failed to apply migrations: %v", err)
	}
	fmt.Printf("Applied %d migrations\n", len(res.Applied))
}
