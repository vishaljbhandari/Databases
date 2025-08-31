spool nikira-DML-internal-user-exec-fp.log
set feedback off ;
set serveroutput off ;

-- Record View for Fingerprint Elements - Internal User --
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,
	is_cell_specific, is_primary_view) values(92, 'Internal User eFingerprint Elements', 45, 'ENTITY_ID=221','', 1, 0, 0, 1) ;

-- Finger print --
insert into fp_entities(id, description, record_view_config_id, display_record_view_id, field_id,record_config_id,instance_key,ONDEMAND_INDEX_CATEGORY_ID,REFERENCE_CATEGORY_ID) values(221, 'Internal User', 83, 92, 5, 70,'INUSERINST',214,221) ;

-- Fingerprint Configuration Rule For Entity Internal User --

insert into rules (id, parent_id, key, name, version, aggregation_type, accumulation_field, accumulation_function, 
				  pseudo_function_id, is_enabled, created_time, modification_time, severity, user_id, description, 
				  processor_type, category, is_active) 
values (rules_seq.nextval, '0', rules_key_seq.nextval, 'InternalUser_FP_configuration_v0', '0', '213', '0', '0', '0', '1', 
 TO_DATE('2008-04-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2008-04-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1', 
 'radmin', NULL, '1', 'FINGERPRINT', '1') ;
insert into fp_configurations(id, entity_id, time_window, version, rule_key) values(2, 221, 1, 0, rules_key_seq.currval);
insert into record_configs_rules (rule_id, record_config_id) values (rules_seq.currval, 70) ;
----------------------------

--Entries for alarm of reference type Internal User and status = FRD & NFR 
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(32, 2, 36, 6) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(33, 4, 36, 6) ;


insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('eFingerprint Profile Generation For Internal User', 'generatefingerprintprofileforinternaluser.rb,GenerateFingerprintProfileForInternalUserPID',0,0, 1) ;

commit ;

