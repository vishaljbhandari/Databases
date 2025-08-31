spool nikira-DML-rtf-recharge_exec.log
set feedback off ;
set serveroutput off ;

insert into rtf_xdr_maps (record_config_id, rtf_tname, lookup_table_name) values (2,'RTF_AR_RECHARGE_LOG', 'RTF_ALARM_RECHARGE_LOG') ;


insert into record_configs_rules(rule_id, record_config_id) values(200, 2) ;
commit ;

