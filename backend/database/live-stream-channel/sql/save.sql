insert into cabrito.live_stream_channel (channel_id,
                                         channel_name,
                                         country_id,
                                         city,
                                         subdivision)
values ($1, $2, $3, $4, $5)
ON CONFLICT(channel_id)
    DO UPDATE SET channel_name = EXCLUDED.channel_name,
                  country_id   = EXCLUDED.country_id,
                  city         = EXCLUDED.city,
                  subdivision  = EXCLUDED.subdivision