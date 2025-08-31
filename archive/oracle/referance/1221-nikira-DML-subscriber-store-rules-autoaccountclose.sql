spool nikira-DML-subscriber-store-rules-autoaccountclose.log
set feedback off ;
set serveroutput off ;

insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Auto Close Account Action'), 14) ;
insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Auto Close Account Action'), 34) ;
insert into rule_action_parameters (rule_id, parameter_1, parameter_2, parameter_3) values ((select id from rules where name = 'Auto Close Account Action'), 2, 0, 0) ;
commit ;

