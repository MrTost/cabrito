create table cabrito.live_stream_channel_language
(
    channel_id varchar(96) not null
        constraint live_stream_channel_language_fk1
            references cabrito.live_stream_channel,
    lang_id    varchar(3)  not null
        constraint live_stream_channel_language_fk2
            references cabrito.language,
    constraint live_stream_channel_language_pk
        primary key (channel_id, lang_id)
);


