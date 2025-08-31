spool nikira-DML-fingerprint.log
set feedback off ;
set serveroutput off ;

insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible, controller_name) values (36, 'Move to Profile Match list','ALARM_CLOSER_ACTION','move_to_profile_match_list_action','',1,1, '') ;
DECLARE
    network_count number(20) ;
	BEGIN
	 select count(*) into network_count from networks;
	 if (network_count > 1) then
		insert into analyst_actions_networks(analyst_action_id, network_id)
		(select a.id, n.id from  analyst_actions a, networks n where n.id != 999 and a.name='Move to Profile Match list') ;
	else 
	 if (network_count = 1) then
		insert into analyst_actions_networks(analyst_action_id, network_id)
		 (select a.id, n.id from  analyst_actions a, networks n where a.name='Move to Profile Match list') ;
	end if ;
end if ;
END ;
/

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based, is_mandatory) values ('eFingerprint Profile Generation For Subscriber', 'generatefingerprintprofileforsubscriber.rb,GenerateFingerprintProfileForSubscriberPID',0,0, 1) ;

-- fp Element Types 
insert into fp_element_types(id, name) values(1, 'Summary') ;
insert into fp_element_types(id, name) values(2, 'Match') ;

-- Configuration for FP Generation
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'FP_INSTANCES','1',0);

--Configurations for FingerprintExecutor
insert into configurations(id,config_key,value,is_visible) values(configurations_seq.nextval,'FPG_INSTANCES','1',0);


--************************FP_PROFILES cleanup configuration**********************
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_LAST_RUN_IDENTIFIER_16', 9999) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_LAST_RUN_IDENTIFIER_221', 9999) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_CURRENT_RUN_IDENTIFIER', 9999) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_PROFILES_NUM_PARTITIONS', 10) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'ONDEMAND_PROFILE_STORAGE_DAYS', 2) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_GENERATOR_LAST_RUN_TIME_16','01/03/2009 00:00:00' ) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'FP_GENERATOR_LAST_RUN_TIME_221','01/03/2009 00:00:00' ) ;
insert into configurations (id, config_key, value) values (configurations_seq.nextval, 'PROFILE_COUNTER_STORAGE_DAYS','5' ) ;

------ Source Entries for FP --
insert into source (id, description) values (40,'eFingerprint Configuration');
insert into source (id, description) values (41,'eFingerprint Element');
insert into source (id, description) values (50,'eFingerprint Rule');

---------Source FMS LOG Entries for FP --
insert into source_fms_log (id,event_name,source_id) values (151, 'eFingerprint Configuration Added',40) ;
insert into source_fms_log (id,event_name,source_id) values (152, 'eFingerprint Configuration Updated',40) ;

insert into source_fms_log (id,event_name,source_id) values (153, 'eFingerprint Element Added',41) ;
insert into source_fms_log (id,event_name,source_id) values (154, 'eFingerprint Element Updated',41) ;
insert into source_fms_log (id,event_name,source_id) values (155, 'eFingerprint Element Deleted',41) ;

insert into source_fms_log (id,event_name,source_id) values (156, 'eFingerprint Rule Added',50) ;
insert into source_fms_log (id,event_name,source_id) values (157, 'eFingerprint Rule Updated',50) ;
insert into source_fms_log (id,event_name,source_id) values (158, 'eFingerprint Rule Deleted',50) ;

-------- Audit Log Event Codes for FP --
insert into audit_log_event_codes values (652,'eFingerprint Configuration Updated', 'eFingerprint Configuration is updated for the entity $1', 40) ;
insert into audit_log_event_codes values (661,'eFingerprint Element Added', 'eFingerprint Element ''$1'' was added', 41) ;
insert into audit_log_event_codes values (662,'eFingerprint Element Updated', 'eFingerprint Element ''$1'' was updated', 41) ;
insert into audit_log_event_codes values (663,'eFingerprint Element Deleted', 'eFingerprint Element ''$1'' was deleted', 41) ;
insert into audit_log_event_codes values (673,'eFingerprint Rule Added',   'eFingerprint Rule ''$1'' was added', 50) ;
insert into audit_log_event_codes values (674,'eFingerprint Rule Deleted', 'eFingerprint Rule ''$1'' was deleted', 50) ;
insert into audit_log_event_codes values (675,'eFingerprint Rule Updated', 'eFingerprint Rule ''$1'' was updated', 50) ;

-----Entity Types Entries for FP --------
insert into entity_types(id, entity_description) values (9022, 'eFingerprint Configuration') ;
insert into entity_types(id, entity_description) values (9024, 'eFingerprint Element') ;
insert into entity_types(id, entity_description) values (9032, 'eFingerprint Rule') ;

commit ;

