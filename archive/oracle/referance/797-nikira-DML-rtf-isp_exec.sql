spool nikira-DML-rtf-isp_exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules(rule_id, record_config_id) values(200, 83) ;
insert into rtf_ds_info(record_config_id, show_date_component) values(83, 1) ;

insert into rtf_xdr_maps (record_config_id, rtf_tname, lookup_table_name) values (83,'RTF_AR_IPDR', 'RTF_ALARM_IPDR') ;

INSERT INTO counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20, 1, 225, 83,1) ;
INSERT INTO counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22, 1, 225, 83,2) ;
INSERT INTO counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1, 1, 225, 83,3) ;


commit ;

