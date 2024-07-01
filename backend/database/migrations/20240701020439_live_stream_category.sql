create table cabrito.live_stream_category
(
    category_id       varchar(96)  not null
        constraint live_stream_category_pk
            primary key,
    category_name     varchar(128) not null,
    category_name_alt varchar(128)
);

