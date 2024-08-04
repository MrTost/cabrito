with categories as (select 'all' as "id",
                           'All' as "name"
                    union all
                    select ct.category_id   as "id",
                           ct.category_name as "name"
                    from cabrito.live_stream_category ct
                    where exists(select 1
                                 from cabrito.live_stream_channel_category cc
                                          join cabrito.live_stream_channel ch on ch.channel_id = cc.channel_id
                                          join cabrito.live_stream_source so on so.channel_id = ch.channel_id
                                 where ch.country_id in ('US', 'CA', 'BR', 'GB')
                                   and cc.category_id = ct.category_id))
select array_to_json(array_agg(row_to_json(c)))
from categories c;