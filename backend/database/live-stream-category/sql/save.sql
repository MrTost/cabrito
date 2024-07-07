insert into cabrito.live_stream_category (category_id,
                                          category_name)
values ($1, $2)
ON CONFLICT(category_id)
    DO UPDATE SET category_name = EXCLUDED.category_name