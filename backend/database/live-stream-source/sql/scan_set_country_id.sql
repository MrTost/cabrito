WITH channel_words AS (SELECT source_id,
                              channel_name,
                              regexp_split_to_table(channel_name, '\s+') AS word
                       FROM cabrito.live_stream_source
                       where provider_id = $1),
     matches as (SELECT source_id,
                        channel_name,
                        channel_words.word,
                        country_id,
                        country_id3,
                        country_name
                 FROM cabrito.country c
                          JOIN channel_words ON (
                     upper(c.country_id) = upper(channel_words.word)
                         OR upper(c.country_id3) = upper(channel_words.word)
                         OR upper(c.country_name) = upper(channel_words.word)
                     )
                 where word not in ('TV')),
     duplicates as (select source_id
                    from matches
                    group by source_id
                    having count(0) > 1),
     final as (select *
               from matches a
               where not exists(select 1
                                from duplicates b
                                where a.source_id = b.source_id))
update cabrito.live_stream_source s
set country_id = f.country_id
from final f
where s.source_id = f.source_id