update cabrito.live_stream_source
set channel_id        = $2,
    country_id        = $3,
    lang_id           = $4,
    source_url        = $5,
    source_file       = $6,
    source_headers    = $7,
    source_query      = $8,
    source_stream_key = $9,
    scan_status       = $10,
    updated_at        = current_timestamp
where source_id = $1
