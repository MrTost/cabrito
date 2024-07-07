update cabrito.live_stream_source
set scan_status = ''
where provider_id = $1
--   and updated_at <= current_timestamp - INTERVAL '1 DAY'