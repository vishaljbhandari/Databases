spool nikira-DML-rule-fp-exec.log
set feedback off ;
set serveroutput off ;

insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - nadmin' and category = 'COLORING_RULES'), 45);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - radmin' and category = 'COLORING_RULES'), 45);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - default' and category = 'COLORING_RULES'), 45);


-- Fingerprint Configuration Rule For Entity Subscriber--

INSERT INTO rules(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'0',rules_key_seq.nextval,'Subscriber_FP_configuration_v0','0','16','0','0','0','1',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'1','radmin',NULL,'1','FINGERPRINT','1') ;
insert into fp_configurations(id, entity_id, time_window, version, rule_key) values(1, 16, 1, 0, rules_key_seq.currval);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 3) ;
commit ;

