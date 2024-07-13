alter table cabrito.aranha
    add column stream_key jsonb;
alter table cabrito.live_stream_source
    add column source_stream_key jsonb;
alter table cabrito.country
    add column other_names TEXT[];

update cabrito.country
set other_names = 'Brasil'::text || other_names
where country_id = 'BR';

update cabrito.country
set other_names = 'UK'::text || other_names
where country_id = 'GB';

update cabrito.country
set other_names = 'Russia'::text || other_names
where country_id = 'RU';

update cabrito.country
set other_names = 'UAE'::text || other_names
where country_id = 'AE';

INSERT INTO cabrito.country
(country_id,
 country_id3,
 country_name,
 country_code,
 iso_3166_2,
 region,
 sub_region,
 intermediate_region,
 region_code,
 sub_region_code,
 intermediate_region_code,
 flag_emoji)
VALUES ('XK',
        'XKX',
        'Kosovo',
        'KV',
        'XK',
        'Europe',
        'Southern Europe',
        NULL,
        '150',
        '039',
        NULL,
        '🇽🇰');