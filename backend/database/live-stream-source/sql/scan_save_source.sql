update cabrito.live_stream_source
set source_url     = $2,
    source_file    = $3,
    source_headers = $4,
    source_query   = $5,
    scan_status    = $6,
    updated_at     = current_timestamp
where source_id = $1
