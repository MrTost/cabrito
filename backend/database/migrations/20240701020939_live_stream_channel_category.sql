create table cabrito.live_stream_channel_category
(
    channel_id  varchar(96) not null
        constraint live_stream_channel_category_fk1
            references cabrito.live_stream_channel,
    category_id varchar(96) not null
        constraint live_stream_channel_category_fk2
            references cabrito.live_stream_category,
    constraint live_stream_channel_category_pk
        primary key (channel_id, category_id)
);

