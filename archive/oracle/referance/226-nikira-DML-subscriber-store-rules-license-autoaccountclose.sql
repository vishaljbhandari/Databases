spool nikira-DML-subscriber-store-rules-license-autoaccountclose.log
set feedback off ;
set serveroutput off ;

insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Auto Close Account Action'), 59) ;
commit ;

