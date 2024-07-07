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
    step0       TEXT[],
    step1       TEXT[],
    step2       TEXT[],
    step3       TEXT[]
);
