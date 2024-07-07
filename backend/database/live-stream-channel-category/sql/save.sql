insert into cabrito.live_stream_channel_category (channel_id, category_id)
values ($1, $2)
ON CONFLICT(channel_id, category_id)
    DO UPDATE SET channel_id  = EXCLUDED.channel_id,
                  category_id = EXCLUDED.category_id