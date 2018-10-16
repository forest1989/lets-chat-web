
delete from act_ge_property;
insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('schema.version', '5.21.0.0', 2);

insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('schema.history', 'create(5.15.1) upgrade(5.15.1->5.21.0.0)', 2);

insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('next.dbid', '1', 1);

commit;