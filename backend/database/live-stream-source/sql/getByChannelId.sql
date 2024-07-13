select source_id,
       provider_id,
       COALESCE(lang_id, '')      as lang_id,
       COALESCE(channel_id, '')   as channel_id,
       COALESCE(channel_name, '') as channel_name,
       COALESCE(channel_num, '')  as channel_num,
       COALESCE(source_url, '')   as source_url,
       COALESCE(source_file, '')  as source_file,
       source_headers,
       source_query,
       source_stream_key,
       COALESCE(resolution, '')   as resolution
from cabrito.live_stream_source
where channel_id = $1