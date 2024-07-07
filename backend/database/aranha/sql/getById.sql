select a.aranha_id,
       a.provider_id,
       a.base_url,
       a.entrypoint,
       a.headers,
       a.query,
       a.step0,
       a.step1,
       a.step2,
       a.step3
from cabrito.aranha a
where a.aranha_id = $1