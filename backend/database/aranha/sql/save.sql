insert into cabrito.aranha (aranha_id,
                            provider_id,
                            base_url,
                            entrypoint,
                            headers,
                            query,
                            stream_key,
                            step0,
                            step1,
                            step2,
                            step3)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
ON CONFLICT(aranha_id)
    DO UPDATE SET provider_id = EXCLUDED.provider_id,
                  base_url    = EXCLUDED.base_url,
                  entrypoint  = EXCLUDED.entrypoint,
                  headers     = EXCLUDED.headers,
                  query       = EXCLUDED.query,
                  stream_key  = EXCLUDED.stream_key,
                  step0       = EXCLUDED.step0,
                  step1       = EXCLUDED.step1,
                  step2       = EXCLUDED.step2,
                  step3       = EXCLUDED.step3