create table cabrito.live_stream_source
(
    source_id       varchar(64)  not null
        constraint live_stream_source_pk
            primary key,
    channel_id      varchar(96)
        constraint live_stream_source_fk1
            references cabrito.live_stream_channel,
    country_id         varchar(2)
        constraint live_stream_source_fk2
            references cabrito.country,
    lang_id         varchar(3)
        constraint live_stream_source_fk3
            references cabrito.language,
    provider_id     varchar(64)  not null,
    channel_name    varchar(128),
    channel_num     varchar(32),
    channel_url     varchar(255) not null,
    channel_country varchar(32),
    channel_lang    varchar(32),
    source_url      varchar(255),
    source_file     varchar(128),
    source_headers  jsonb,
    source_query    jsonb,
    resolution      varchar(32),
    scan_status     varchar(128),
    updated_at      timestamp default CURRENT_TIMESTAMP
);
