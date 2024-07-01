create table cabrito.live_stream_channel
(
    channel_id       varchar(96)  not null
        constraint live_stream_channel_pk
            primary key,
    channel_name     varchar(128) not null,
    channel_name_alt varchar(128) not null,
    country_id       varchar(2),
    city             varchar(128),
    subdivision      varchar(128)
);

