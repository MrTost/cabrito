with channels as (select ch.channel_id                                  as "channelId",
                         coalesce(ch.channel_name_alt, ch.channel_name) as "channelName",
                         ch.country_id                                  as "countryId",
                         c.flag_emoji                                   as "countryFlag",
                         (select array_to_json(array_agg(ca.category_name))
                          from cabrito.live_stream_channel_category cc
                                   join cabrito.live_stream_category ca on ca.category_id = cc.category_id
                          where cc.channel_id = ch.channel_id)          as "categories",
                         (select count(0)
                          from cabrito.live_stream_source cs
                          where cs.channel_id = ch.channel_id)          as "sources",
                         'A'                                            as "status"
                  from cabrito.live_stream_channel ch
                           join cabrito.country c on ch.country_id = c.country_id
                  order by ch.channel_id)
select array_to_json(array_agg(row_to_json(ch)))
from channels ch