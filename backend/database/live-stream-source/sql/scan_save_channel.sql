INSERT INTO cabrito.live_stream_source (source_id,
                                        provider_id,
                                        channel_name,
                                        channel_num,
                                        channel_url,
                                        channel_country,
                                        channel_lang,
                                        scan_status)
VALUES ($1, $2, $3, $4, $5, $6, $7, 'SCANNING: NEW')
ON CONFLICT(source_id)
    DO UPDATE SET provider_id     = EXCLUDED.provider_id,
                  channel_name    = EXCLUDED.channel_name,
                  channel_num     = EXCLUDED.channel_num,
                  channel_url     = EXCLUDED.channel_url,
                  channel_country = EXCLUDED.channel_country,
                  channel_lang    = EXCLUDED.channel_lang,
                  scan_status     = 'SCANNING: UPDATE'