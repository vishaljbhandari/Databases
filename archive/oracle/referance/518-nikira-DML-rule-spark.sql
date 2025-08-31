INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval ,'999' ,rules_key_seq.nextval ,'Update CurrentPartitionInfo','1','2','0','0',NULL,'1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','DISPATCHER','1');
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval, 2) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (62,'Update Current Partition Info',0);
insert into actions_rules(rule_id, action_id) values(rules_seq.currval,62) ;
