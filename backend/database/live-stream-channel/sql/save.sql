insert into cabrito.live_stream_channel (channel_id,
                                         channel_name,
                                         channel_name_alt,
                                         country_id,
                                         city,
                                         subdivision,
                                         launched,
                                         closed,
                                         replaced_by)
values ($1, $2, $3, $4, $5, $6, $7, $8, $9)
ON CONFLICT(channel_id)
    DO UPDATE SET channel_name     = EXCLUDED.channel_name,
                  channel_name_alt = EXCLUDED.channel_name_alt,
                  country_id       = EXCLUDED.country_id,
                  city             = EXCLUDED.city,
                  subdivision      = EXCLUDED.subdivision,
                  launched         = EXCLUDED.launched,
                  closed           = EXCLUDED.closed,
                  replaced_by      = EXCLUDED.replaced_by
