
spool nikira-DML-rule-call-collision.log
set feedback off ;
set serveroutput off ;
--- Call Collision Rule -----------------------------
DECLARE
	is_gsm_selected number(20);
	is_cdma_selected number(20);
	BEGIN
		select value into is_gsm_selected from configurations where config_key = 'INSTALLATION.GSM' ; 
		select value into is_cdma_selected from configurations where config_key = 'INSTALLATION.CDMA' ; 
		if (is_gsm_selected = 1 or is_cdma_selected = 1) then
			INSERT INTO rules(ID,PARENT_ID,KEY,NAME,VERSION,AGGREGATION_TYPE,ACCUMULATION_FIELD,ACCUMULATION_FUNCTION,PSEUDO_FUNCTION_ID,IS_ENABLED,CREATED_TIME,MODIFICATION_TIME,SEVERITY,USER_ID,DESCRIPTION,PROCESSOR_TYPE,CATEGORY,IS_ACTIVE) VALUES (rules_seq.nextval,'999',rules_key_seq.nextval,'Call Collision','0','2','12','7','15','0',TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2007-01-04 11:07:39','YYYY-MM-DD HH24:MI:SS'),'100','system',NULL,'1',null,'1') ;
			
			INSERT INTO rule_priority_maps (id, rule_id, priority) VALUES (rule_priority_maps_seq.nextval, rules_seq.currval, 100) ;
			insert into fraud_types_rules (rule_id, fraud_type_id) values(rules_seq.currval, 15) ;
			
			INSERT INTO thresholds(id, threshold_id, aggregation_type, rule_key, rule_version, value, version, duration, effective_time, effective_day, effective_week_day, changed_status) VALUES (thresholds_seq.nextval, 0, 2, rules_key_seq.currval, 0, 1, 0, 86400, 1, 1, 1, 0) ;
			
			insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 1) ;
			insert into actions_rules (rule_id, action_id) values (rules_seq.currval, 1) ;
			
					INSERT INTO networks_rules (rule_id, network_id)
														(select rules_seq.currval, id from networks 
														 where 
														 id = 999 and (select count(*) from networks) = 1 
														 or 
														 id != 999 and (select count(*) from networks) > 1
														 );
				
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='Phone Number' and category='AGGREGATION_TYPE'));
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='CDR' and category='DATA_STREAMS'));
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='Call Collision' and category='FUNCTIONS'));
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='Normal Rule' and category='RULE_TYPE'));
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='Dynamic' and category='DURATION_TYPE'));
			insert into rules_tags(rule_id, tag_id) values(rules_seq.currval, (select id from tags where name='SIM Cloning / Duplication' and category='FRAUD_TYPES'));
			
			insert into analyst_actions_rules(rule_id, analyst_action_id)
			(select rules_seq.currval, a.id from analyst_actions a where a.category like '%RECOMMENDED_ACTION%') ;
		end if ;
END ;
/		

commit ;
