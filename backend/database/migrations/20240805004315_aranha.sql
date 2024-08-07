drop table cabrito.aranha;

create table cabrito.aranha
(
    aranha_id   varchar(64)  not null
        constraint aranha_pk
            primary key,
    provider_id varchar(64)  not null,
    base_url    varchar(255) not null,
    entrypoint  varchar(128) not null,
    headers     jsonb,
    query       jsonb,
    steps       jsonb,
    stream_key  jsonb,
    mapping     jsonb
);