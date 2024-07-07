select source_id,
       provider_id,
       lang_id,
       channel_id,
       channel_name,
       channel_num,
       channel_url,
       source_url,
       source_file,
       source_headers,
       source_query,
       COALESCE(resolution, '') as resolution
  from cabrito.live_stream_source
 where channel_id = $1