spool nikira-DML-subscriber-store-rules-AI.log
set feedback off ;
set serveroutput off ;

insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Blacklist Info Load Action'), 52) ;
commit ;

