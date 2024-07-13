with channels as (select ch.channel_id                                  as "channelId",
                         coalesce(ch.channel_name_alt, ch.channel_name) as "channelName",
                         ch.country_id                                  as "countryId",
                         c.flag_emoji                                   as "countryFlag",
                         (select array_to_json(array_agg(ca.category_name))
                          from cabrito.live_stream_channel_category cc
                                   join cabrito.live_stream_category ca on ca.category_id = cc.category_id
                          where cc.channel_id = ch.channel_id)          as "categories",
                         count(distinct so.source_id)                   as "sources",
                         'A'                                            as "status"
                  from cabrito.live_stream_channel ch
                           join cabrito.country c on ch.country_id = c.country_id
                           join cabrito.live_stream_source so on so.channel_id = ch.channel_id
                  where c.country_id in ('US','CA','BR','GB')
                  group by ch.channel_id,
                           coalesce(ch.channel_name_alt, ch.channel_name),
                           ch.country_id,
                           c.flag_emoji
                  order by ch.channel_id)
select array_to_json(array_agg(row_to_json(ch)))
from channels ch