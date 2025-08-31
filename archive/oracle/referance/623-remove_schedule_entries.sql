spool remove_schedule_entries.log

delete networks_schedulers where scheduler_id in (select scheduler_id from rules_schedulers where rule_id in (select id from rules where category='STATISTICAL_RULE'));
delete rules_schedulers where  rule_id in (select id from rules where category='STATISTICAL_RULE');
delete schedulers where category='STATISTICAL_RULE';
 
