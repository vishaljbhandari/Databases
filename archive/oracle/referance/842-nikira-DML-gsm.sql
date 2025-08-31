spool nikira-DML-gsm.log
set feedback off ;
set serveroutput off ;
--Granularity for Data Streams
insert into ds_granularity_maps(id, record_config_id, threshold_in_seconds, granularity_in_seconds) values (1,  1, 7 * 86400, 6 * 3600) ;

-- pseudo_functns_record_configs
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 1)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 2)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 6)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 7)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 8)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 9)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 10)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 11)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 15)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 16)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 17)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 21)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 22)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 23)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 36)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 46)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 105)  ;

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 39)  ;

--Fp Elements Pseudo Field Functions and Record Config map
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 30)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 31)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 35)  ;

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 49)  ;

-- Distinct Count/Duration on Other Party Number
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 104)  ;


--DBWriter configuration for GSM
insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions,	current_partition_info, records_processed, max_wait_time, reserved_subpartitions, offline_tname) values (1, 1, 1, 2, '0:0:0', 0, 1, '2', 'OFFLINE_CDR') ;

----Record Loder configuration for GSM
insert into record_loader_configurations(id, record_config_id) values (1, 1 ) ;

-- ***************** FMSLog Messages  ******************
insert into source_fms_log (id,event_name,source_id) values (41,'Hotlist Cell Site Added',7);
insert into source_fms_log (id,event_name,source_id) values (42,'Hotlist Cell Site Modified',7);
insert into source_fms_log (id,event_name,source_id) values (43,'Hotlist Cell Site deleted',7);
insert into source_fms_log (id,event_name,source_id) values (44,'Hotlist IMEI Added',7);
insert into source_fms_log (id,event_name,source_id) values (45,'Hotlist IMEI Modified',7);
insert into source_fms_log (id,event_name,source_id) values (46,'Hotlist IMEI deleted',7);


commit ;

