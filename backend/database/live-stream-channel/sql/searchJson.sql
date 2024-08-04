with channel as (select ch.channel_id as "channelId",
                        case
                            when ch.custom_name is not null and ch.custom_name != '' then ch.channel_name
                            when ch.channel_name_alt is not null and ch.channel_name_alt != '' then ch.channel_name_alt
                            else ch.channel_name
                            end       as "channelName",
                        ch.country_id as "countryId",
                        c.flag_emoji  as "countryFlag",
                        case
                            when (ch.closed is not null and ch.closed != '') or
                                 (ch.replaced_by is not null and ch.replaced_by != '') then true
                            else false
                            end       as "isClosed",
                        cc.category_id,
                        so.scan_status
                 from cabrito.live_stream_channel ch
                          join cabrito.country c on ch.country_id = c.country_id
                          join cabrito.live_stream_channel_category cc on cc.channel_id = ch.channel_id
                          join cabrito.live_stream_source so on so.channel_id = ch.channel_id
                 where c.country_id in ('US', 'CA', 'BR', 'GB')
                   and (cc.category_id = $1 or 'all' = $1)),
     channels as (select "channelId",
                         "channelName",
                         "countryId",
                         "countryFlag",
                         "isClosed",
                         array_to_json(array_agg(distinct category_id)) as "categories",
                         array_to_json(array_agg(distinct scan_status)) as "scanStatus"
                  from channel
                  group by "channelId",
                           "channelName",
                           "countryId",
                           "countryFlag",
                           "isClosed"
                  order by "channelId")
select array_to_json(array_agg(row_to_json(ch)))
from channels ch