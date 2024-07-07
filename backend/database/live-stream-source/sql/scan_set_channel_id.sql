with channels as (select a.source_id,
                         a.country_id,
                         a.channel_name,
                         regexp_replace(trim(replace(replace(replace(upper(a.channel_name),
                                                                     upper(b.country_name), ''),
                                                             upper(b.country_id3), ''),
                                                     upper(b.country_id), '')
                                        ), '\s+', ' ', 'g') AS updated_name
                  from cabrito.live_stream_source a,
                       cabrito.country b
                  where a.country_id = b.country_id
                    and a.provider_id = $1),
     matches as (select a.source_id,
                        a.country_id,
                        a.channel_name,
                        a.updated_name,
                        b.channel_id,
                        b.channel_name,
                        b.channel_name_alt
                 from channels a,
                      cabrito.live_stream_channel b
                 where a.country_id = b.country_id
                   and a.updated_name = upper(b.channel_name)),
     duplicates as (select source_id
                    from matches
                    group by source_id
                    having count(0) > 1),
     final as (select a.source_id,
                      a.channel_id
               from matches a
               where not exists (select 1
                                 from duplicates b
                                 where a.source_id = b.source_id))
update cabrito.live_stream_source s
set channel_id = f.channel_id
from final f
where s.source_id = f.source_id
