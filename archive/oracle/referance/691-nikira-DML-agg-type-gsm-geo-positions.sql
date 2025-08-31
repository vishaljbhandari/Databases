spool nikira-DML-agg-type-gsm-geo-positions.log
set feedback off ;
set serveroutput off ;
DECLARE
        rec_conf_ids varchar(10);
BEGIN
        select RECORD_CONFIG_IDS into rec_conf_ids from aggregation_types where description = 'Geographic Position' and id = 14;
        if rec_conf_ids is NULL
        then
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || '1'  where description = 'Geographic Position' and id = 14;
        else
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',1'  where description = 'Geographic Position' and id = 14;
        end if ;
		commit ;

END ;
/


insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 4, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (7, 5, 14, 1) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 7, 14, 1) ;

commit ;

