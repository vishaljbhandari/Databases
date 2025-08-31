spool nikira-DML-rtf-gsm_exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules(rule_id, record_config_id) values(200, 1) ;


insert into rtf_xdr_maps (record_config_id, rtf_tname, lookup_table_name) values (1,'RTF_AR_CDR', 'RTF_ALARM_CDR') ;

commit ;

