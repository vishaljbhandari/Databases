spool nikira-DML-subscriber-store-rules-not-autoaccountclose.log
set feedback off ;
set serveroutput off ;

insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Auto Close Account Action'), 18) ;
insert into actions_rules (rule_id, action_id) values ((select id from rules where name = 'Auto Close Account Action'), 17) ;
insert into record_rejection_reasons values ((select id from rules where name = 'Auto Close Account Action'), 'Phone Number Active for a different Account') ;
commit ;

