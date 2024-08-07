insert into cabrito.aranha (aranha_id,
                            provider_id,
                            base_url,
                            entrypoint,
                            headers,
                            query,
                            stream_key,
                            steps,
                            mapping)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9)
ON CONFLICT(aranha_id)
    DO UPDATE SET provider_id = EXCLUDED.provider_id,
                  base_url    = EXCLUDED.base_url,
                  entrypoint  = EXCLUDED.entrypoint,
                  headers     = EXCLUDED.headers,
                  query       = EXCLUDED.query,
                  stream_key  = EXCLUDED.stream_key,
                  steps       = EXCLUDED.steps,
                  mapping     = EXCLUDED.mapping