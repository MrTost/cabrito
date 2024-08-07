select a.aranha_id,
       a.provider_id,
       a.base_url,
       a.entrypoint,
       a.headers,
       a.query,
       a.stream_key,
       a.steps,
       a.mapping
from cabrito.aranha a
where a.aranha_id = $1