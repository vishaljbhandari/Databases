spool nikira-DML-rule-gprs-reject-future-records-recharge-exec.log
set feedback off ;
set serveroutput off ;

---------------------------Rule For Future Record Rejection------------------------

insert into record_configs_rules(rule_id, record_config_id) values((select id from rules where name = 'Rule For Future Record Rejection'), 2) ;


commit ;

