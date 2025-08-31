spool nikira-DML-agg-type-recharge-account-name.log
set feedback off ;
set serveroutput off ;

update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',2' where DESCRIPTION = 'Account Name' and id = 7 ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 7, 2) ;

commit ;

