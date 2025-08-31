spool nikira-DML-rtf-internal_user_exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules(rule_id, record_config_id) values(200, 71) ;
insert into record_configs_rules(rule_id, record_config_id) values(200, 72) ;


insert into rtf_xdr_maps (record_config_id, rtf_tname, lookup_table_name) values (71,'RTF_AR_ADJUSTMENT_LOGS', 'RTF_ALARM_ADJUSTMENT_LOGS') ;
insert into rtf_xdr_maps (record_config_id, rtf_tname, lookup_table_name) values (72,'RTF_AR_CRM_LOGS', 'RTF_ALARM_CRM_LOGS') ;
commit ;

