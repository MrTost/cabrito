alter table cabrito.live_stream_channel add column launched varchar(26);
alter table cabrito.live_stream_channel add column closed varchar(26);
alter table cabrito.live_stream_channel add column replaced_by varchar(96);
alter table cabrito.live_stream_channel add column custom_name varchar(128);