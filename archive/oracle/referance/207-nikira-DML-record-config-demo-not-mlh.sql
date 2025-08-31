spool nikira-DML-record-config-demo-not-mlh.log
set feedback off ;
set serveroutput off ;

--insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (7, 'Account Name', '3,1,7,2', '-1,-2,-3,-4,901') ;
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (7, 'Account Name', '3', '-1,-2,-3,-4,-5,901') ;
commit ;

