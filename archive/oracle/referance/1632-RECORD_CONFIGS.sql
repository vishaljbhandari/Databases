spool RECORD_CONFIGS.log



update RECORD_CONFIGS  set category = 'NAMED_FILTERS RULE_TAGS STATS_RULE_ENTITY_TYPE INLINE_RULES TEST_RULE FINGERPRINT_RULE_ENTITY_TYPE' where  ID = '4' and DESCRIPTION = 'Account' and tname = 'ACCOUNT' ;

update RECORD_CONFIGS  set is_dynamic_query = '1' where  ID = '21' and DESCRIPTION = 'Alarms' and tname = 'ALARM_VIEWS' ;
update RECORD_CONFIGS  set is_dynamic_query = '1' where  ID = '24' and DESCRIPTION = 'Assigned Alarms' and tname = 'ALARM_VIEWS' ;
update RECORD_CONFIGS  set is_dynamic_query = '1' where  ID = '23' and DESCRIPTION = 'Closed Alarms' and tname = 'ALARM_VIEWS' ;
update RECORD_CONFIGS  set is_dynamic_query = '1' where  ID = '22' and DESCRIPTION = 'Open Alarms' and tname = 'ALARM_VIEWS' ;

spool off ;
