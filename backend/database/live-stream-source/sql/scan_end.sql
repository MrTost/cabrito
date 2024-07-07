update cabrito.live_stream_source
set scan_status = 'DELETED'
where provider_id = $1
  and scan_status = ''