update actions_rules set priority = 1 where rule_id in ( select id from rules where name in ('Phone Number And Account Blacklisted','Account Blacklisted')) and action_id in ( select id from actions where action_name='Break Rule Processing') ;

commit ;
