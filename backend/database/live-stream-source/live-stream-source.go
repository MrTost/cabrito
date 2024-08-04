package live_stream_source

import (
	"cabrito/types"
	"context"
	_ "embed"
	"encoding/json"
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

//go:embed sql/getBySourceId.sql
var getBySourceIdSql string

func (db *Persist) GetBySourceId(sourceId string) (types.LiveStreamSource, error) {
	ctx := context.Background()

	var source types.LiveStreamSource

	err := db.pool.QueryRow(ctx, getBySourceIdSql, sourceId).Scan(
		&source.SourceId,
		&source.ProviderId,
		&source.LangId,
		&source.ChannelId,
		&source.ChannelName,
		&source.ChannelNum,
		&source.SourceUrl,
		&source.SourceFile,
		&source.SourceHeaders,
		&source.SourceQuery,
		&source.SourceStreamKey,
		&source.Resolution,
	)

	return source, err
}

//go:embed sql/searchJson.sql
var sqlSearchJson string

func (db *Persist) SearchJson() ([]byte, error) {
	ctx := context.Background()

	var jsonData []byte

	err := db.pool.QueryRow(ctx, sqlSearchJson).Scan(&jsonData)

	return jsonData, err
}

//go:embed sql/getByChannelId.sql
var getByChannelIdSql string

func (db *Persist) GetByChannelId(channelId string) ([]types.LiveStreamSource, error) {
	ctx := context.Background()

	rows, err := db.pool.Query(ctx, getByChannelIdSql, channelId)

	if err != nil {
		log.Fatalf("Error querying database: %v\n", err)
		return nil, err
	}
	defer rows.Close()

	var sources []types.LiveStreamSource

	for rows.Next() {
		var source types.LiveStreamSource

		err := rows.Scan(
			&source.SourceId,
			&source.ProviderId,
			&source.LangId,
			&source.ChannelId,
			&source.ChannelName,
			&source.ChannelNum,
			&source.SourceUrl,
			&source.SourceFile,
			&source.SourceHeaders,
			&source.SourceQuery,
			&source.SourceStreamKey,
			&source.Resolution,
		)
		if err != nil {
			log.Fatalf("Error scanning row: %v\n", err)
			return nil, err
		}

		// Append the user to the slice
		sources = append(sources, source)
	}

	// Check for errors from iterating over rows
	if err := rows.Err(); err != nil {
		log.Fatalf("Error iterating rows: %v\n", err)
		return nil, err
	}

	return sources, err
}

//go:embed sql/scan-start.sql
var sqlScanStart string

func (db *Persist) ScanStart(providerId string) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		sqlScanStart,
		providerId)
	if err != nil {
		log.Printf("Error saving scan start: %s", err)
		return err
	}

	return nil
}

//go:embed sql/scan_save_channel.sql
var sqlScanSaveChannel string

func (db *Persist) ScanSaveChannel(providerId string, channel *types.LiveStreamSource) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		sqlScanSaveChannel,
		channel.SourceId,
		providerId,
		channel.ChannelName,
		channel.ChannelNum,
		channel.ChannelUrl,
		channel.ChannelCountry,
		channel.ChannelLang)
	if err != nil {
		log.Printf("Error saving the channel: %s", err)
		return err
	}

	return nil
}

//go:embed sql/scan_get_channel.sql
var sqlScanGetChannel string

func (db *Persist) ScanGetChannel(providerId string) (*types.LiveStreamSource, error) {
	var channel types.LiveStreamSource

	ctx := context.Background()

	err := db.pool.QueryRow(ctx, sqlScanGetChannel, providerId).Scan(
		&channel.SourceId,
		&channel.ProviderId,
		&channel.ChannelNum,
		&channel.ChannelName,
		&channel.ChannelUrl)

	return &channel, err
}

//go:embed sql/scan_save_source.sql
var sqlScanSaveSource string

func (db *Persist) ScanSaveSource(channel *types.LiveStreamSource, channelSourceErr error) error {
	ctx := context.Background()

	headersJson, err := json.Marshal(channel.SourceHeaders)
	if err != nil {
		log.Fatal(err)
	}

	queryParamsJson, err := json.Marshal(channel.SourceQuery)
	if err != nil {
		log.Fatal(err)
	}

	scanStatus := "COMPLETED"
	if channelSourceErr != nil {
		scanStatus = "ERROR: " + channelSourceErr.Error()
	}

	_, err = db.pool.Exec(
		ctx,
		sqlScanSaveSource,
		channel.SourceId,
		channel.SourceUrl,
		channel.SourceFile,
		headersJson,
		queryParamsJson,
		channel.SourceStreamKey,
		scanStatus)
	if err != nil {
		log.Printf("Error saving the channel source: %s", err)
		return err
	}

	return nil
}

//go:embed sql/scan_end.sql
var sqlScanEnd string

func (db *Persist) ScanEnd(providerId string) error {
	ctx := context.Background()

	_, err := db.pool.Exec(
		ctx,
		sqlScanEnd,
		providerId)
	if err != nil {
		log.Printf("Error saving scan end: %s", err)
		return err
	}

	return nil
}
