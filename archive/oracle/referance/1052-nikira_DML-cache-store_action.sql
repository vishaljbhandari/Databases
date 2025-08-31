spool nikira-DML-cache-store-action.log
set feedback off ;
set serveroutput off ;

delete from configurations where config_key = 'STORE_ACTION_ISPN_CACHE_IMMD_SYNC';
delete from configurations where config_key = 'DEFAULT_WHERE_CLAUSE_ACCOUNT';
delete from configurations where config_key = 'DEFAULT_WHERE_CLAUSE_SUBSCRIBER';
delete from configurations where config_key = 'ISPN_CACHE_MAX_RETRY';
delete from configurations where config_key = 'ISPN_CACHE_MAX_RETRY_FM_CLIENT';
delete from configurations where config_key = 'ISPN_CACHE_MAX_FALLBACK_ATTEMPTS_FOR_QUERY';
delete from configurations where config_key = 'ISPN_CACHE_MAX_DB_LOOKUP_ATTEMPTS_FOR_QUERY';
delete from configurations where config_key = 'ISPN_CACHE_FALLBACK_ON_STORE_ACTION_FAILURE';
delete from configurations where config_key = 'ISPN_CACHE_MAX_ATTEMPTS_IGNORE_RETRY_ON_UPSERT';


insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'STORE_ACTION_ISPN_CACHE_IMMD_SYNC',1);
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_WHERE_CLAUSE_SUBSCRIBER','STATUS in (1,2) and SUBSCRIBER_TYPE = 0');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'DEFAULT_WHERE_CLAUSE_ACCOUNT','');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_MAX_RETRY','20');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_MAX_RETRY_FM_CLIENT','5');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_MAX_FALLBACK_ATTEMPTS_FOR_QUERY','20');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_MAX_DB_LOOKUP_ATTEMPTS_FOR_QUERY','20');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_FALLBACK_ON_STORE_ACTION_FAILURE','0');
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'ISPN_CACHE_MAX_ATTEMPTS_IGNORE_RETRY_ON_UPSERT','20');

commit ;
spool off;
