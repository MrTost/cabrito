with source as (select source_id                     as "sourceId",
                       COALESCE(channel_id, '')      as "channelId",
                       COALESCE(country_id, '')      as "countryId",
                       COALESCE(lang_id, '')         as "langId",
                       provider_id                   as "providerId",
                       COALESCE(channel_name, '')    as "channelName",
                       COALESCE(channel_num, '')     as "channelNum",
                       channel_url                   as "channelUrl",
                       COALESCE(channel_country, '') as "channelCountry",
                       COALESCE(channel_lang, '')    as "channelLang",
                       COALESCE(source_url, '')      as "sourceUrl",
                       COALESCE(source_file, '')     as "sourceFile",
                       source_headers                as "sourceHeaders",
                       source_query                  as "sourceQuery",
                       COALESCE(resolution, '')      as "resolution",
                       COALESCE(scan_status, '')     as "scanStatus",
                       updated_at                    as "updatedAt",
                       source_stream_key             as "sourceStreamKey"
                from cabrito.live_stream_source
                order by channel_name, source_id
                /*WHERE source_id > '00452a0d495d032e84d3ba655086b049'
                order by source_id
                limit 2*/)
select json_build_object(
               'prev', '-1',
               'next', '+1',
               'items', array_to_json(array_agg(row_to_json(a)))
       )
from source a
