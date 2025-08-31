spool nikira-DML-rule-reject-future-records-exec.log
set feedback off ;
set serveroutput off ;

---------------------------Rule For Future Record Rejection------------------------

INSERT INTO rules (ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) values
(rules_seq.nextval, '999', rules_key_seq.nextval , 'Rule For Future Record Rejection','0','2','0','0',NULL,'1',sysdate,sysdate,'1','radmin',NULL,'1','DISPATCHER','1');
insert into rule_priority_maps (id, rule_id, priority) values (rule_priority_maps_seq.nextval, rules_seq.currval , 2) ;

insert into actions_rules(rule_id, action_id, priority) values(rules_seq.currval,63,0) ;
insert into actions_rules(rule_id, action_id, priority) values(rules_seq.currval,17,1) ; 
commit ;

