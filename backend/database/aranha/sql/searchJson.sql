with aranhas as (select a.aranha_id   as "aranhaId",
                        a.provider_id as "providerId",
                        a.base_url    as "baseUrl",
                        a.entrypoint  as "entrypoint",
                        a.headers     as "headers",
                        a.query       as "query"
                 from cabrito.aranha a
                 order by a.aranha_id)
select array_to_json(array_agg(row_to_json(ar)))
from aranhas ar