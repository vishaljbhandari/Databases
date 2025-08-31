insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'MIGRATION_BUFFER_DAYS', '10'); 
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'DATA_LOAD_STEP_SIZE', '3');
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'INDEX_BUILD_STEP_SIZE', '3');
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'INDEX_PARALLELISM','4');
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'ESTIMATED_PERCENTAGE_FOR_GATHERING_STATISTICS', '0.01');
insert into query_framework_configs(id, config_key, value) values (query_framework_configs_seq.nextval,	'INSTALLATION_DATE','2010-09-27');

insert into DBWRITER_CONFIG_MIGRATION (ID, RECORD_CONFIG_ID, OFFLINE_TNAME) values (1, 1, 'OFFLINE_CDR');
insert into DBWRITER_CONFIG_MIGRATION (ID, RECORD_CONFIG_ID, OFFLINE_TNAME) values (2, 2, 'OFFLINE_RECHARGE_LOG');
insert into DBWRITER_CONFIG_MIGRATION (ID, RECORD_CONFIG_ID, OFFLINE_TNAME) values (3, 7, 'OFFLINE_GPRS_CDR');

