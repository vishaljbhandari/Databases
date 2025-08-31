spool nikira-DML-isp.log
set feedback off ;
set serveroutput off ;
-- ***************** configurations for cleaning up alarm with status as HOLD *****************************

insert into configurations (id, config_key, value) values (configurations_seq.nextval,'IPDR_SUMMARY_LAST_UPDATED_WEEK', to_char(sysdate-1,'IW')|| ','|| to_char(sysdate - 1, 'dd/mm/yyyy'));                                                                                                                      


-- RecordLoader configurations Details
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'IPDRLOADER.KEY', '000_0');

-- Entry for Subscriber Groups --
insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, max_wait_time, reserved_subpartitions, offline_tname) values (7, 83, 1, 2, '0:0:0', 0, 1, '2', 'OFFLINE_IPDR') ;

insert into record_loader_configurations(id, record_config_id) values (4, 83 ) ;

--- Entries For IPDR View -------

insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 83, 104, 4, 0, 1, 0) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory) values(BASIC_FILTER_SEQ.nextval, 83, 104, 12, 0, 2, 0 ) ;
insert into basic_filter_configs(id, record_config_id, record_view_config_id, field_id, operator_id, position, is_mandatory, min, max) values(BASIC_FILTER_SEQ.nextval, 83, 104, 2, 10, 3, 0, '01-01-1970', '31-12-9999') ;

insert into modulo_dispatcher_categories  (record_config_id, field_category_id, enabled) values (83,2,0) ;

--Fp Elements Pseudo Field Functions and Record Config map
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 30)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 31)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 32)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 33)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 34)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 83 from pseudo_functions where id = 35)  ;

--CHANGES WHILE RUNNING PROGRAM MANAGER
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'IPDRIDIncrement','1') ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'IPDRNumberOfPartitions','1');

----Cleanup Package Configurations---
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'CLEANUP.RECORDS.IPDR.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'CLEANUP.RECORDS.ALARM_IPDR.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_IPDR_DAY_TRUNCED','1970/01/01');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_ALARM_IPDR_DAY_TRUNCED','1970/01/01');


--Granularity for Data Streams
insert into ds_granularity_maps(id, record_config_id, threshold_in_seconds, granularity_in_seconds) values (7,  83, 7 * 86400, 6 * 3600) ;

--Schedulling summary scripts
insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values ('Session Summary', 'sessionsummary.rb,SessionSummaryPID', 0, (select decode(count(*), 1,0,1) from networks)) ;

commit ;

