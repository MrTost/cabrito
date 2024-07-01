create table cabrito.live_stream_source
(
    source_id      varchar(64)  not null
        constraint live_stream_source_pk
            primary key,
    provider_id    varchar(64)  not null,
    lang_id        varchar(3)   not null
        constraint live_stream_source_fk2
            references cabrito.language,
    channel_id     varchar(96)
        constraint live_stream_source_fk1
            references cabrito.live_stream_channel,
    channel_name   varchar(128),
    channel_num    varchar(32),
    channel_url    varchar(255),
    source_url     varchar(255) not null,
    source_file    varchar(128) not null,
    source_headers jsonb,
    source_query   jsonb,
    resolution     varchar(32)
);
