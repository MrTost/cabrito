select source_id,
       provider_id,
       channel_num,
       channel_name,
       channel_url
from cabrito.live_stream_source
where provider_id = $1
  and scan_status like 'SCANNING: %'
order by channel_name
limit 1