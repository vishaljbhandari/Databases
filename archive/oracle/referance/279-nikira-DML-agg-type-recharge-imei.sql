spool nikira-DML-agg-type-recharge-imei.log
set feedback off ;
set serveroutput off ;

DECLARE
        rec_conf_ids varchar(10);
BEGIN
        select RECORD_CONFIG_IDS into rec_conf_ids from aggregation_types where description = 'IMEI NUMBER' and id = 3;
        if rec_conf_ids is NULL
        then
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || '2' where description = 'IMEI NUMBER' and id = 3;
        else
            update aggregation_types set RECORD_CONFIG_IDS = RECORD_CONFIG_IDS || ',2' where description = 'IMEI NUMBER' and id = 3;
        end if ;
		commit ;

END ;
/

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 3, 2) ;
commit ;

