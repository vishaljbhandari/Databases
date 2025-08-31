spool nikira-DML-agg-type-gprs-phno.log
set feedback off ;
set serveroutput on ;

update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',7'  where description = 'PHONE NUMBER' and id =2 ;


insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 5, 2, 7) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 2, 7) ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (3, 8, 2, 7) ;

commit ;
