spool nikira-DML-agg-type-recharge-phno.log
set feedback off ;
set serveroutput off ;

update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',2'  where description = 'PHONE NUMBER' and id = 2 ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 2) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 2, 2) ;

commit ;

