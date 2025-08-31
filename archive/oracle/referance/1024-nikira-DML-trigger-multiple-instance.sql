SPOOL nikira-nikira-DML-trigger-multiple-instance.log
SET FEEDBACK OFF ;
set serveroutput off ;

create or replace trigger CounterInstDistributionTrigger
after insert  on IN_MEMORY_COUNTER_DETAILS
for each row
DECLARE
v_entity_type  number(3) ;
v_entity_id    number(3) ;
v_online_counter_id number(10) ;
begin
   	 if (:new.counter_instance_id != 0)
   	 then
   	     if ( :new.counter_category in (5))
   	     then
		 		begin
		   	 		select entity_type,online_counter_id into v_entity_id, v_online_counter_id from profile_manager_entity_configs where offline_counter_id = :new.id ;

		  	 		insert into PM_INSTANCE_CONFIGS(entity_type,instance_id,last_run_ref_time) values (v_entity_id, :new.counter_instance_id, sysdate) ;
 		 			insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) values 
						('Profile Manager_'||v_entity_id||'_'||:new.counter_instance_id, 
					 	'profile_manager.rb '||v_entity_id||' '||:new.counter_instance_id||',ProfilemanagerPID', 0, 0 ) ;
					begin
						select entity_type into v_entity_type from fp_entities where  id = v_entity_id and category like '%FP%' ;

						delete from FP_PROFILES_DATASET_MAP where entity_id  = v_entity_id and instance_id = :new.counter_instance_id ;

						insert into FP_PROFILES_DATASET_MAP(ENTITY_ID,INSTANCE_ID,RUN_IDENTIFIER,TNAME) values 
								(v_entity_id, :new.counter_instance_id, 2,'FP_PROFILES_'||v_entity_type||'_'||:new.counter_instance_id||'_2') ;
						insert into FP_PROFILES_DATASET_MAP(ENTITY_ID,INSTANCE_ID,RUN_IDENTIFIER,TNAME) values 
								(v_entity_id, :new.counter_instance_id, 3,'FP_PROFILES_'||v_entity_type||'_'||:new.counter_instance_id||'_3') ;

						delete from configurations where config_key = 'FP_PROFILES_LAST_RUN_IDENTIFIER_'||v_entity_id||'_'||:new.counter_instance_id ;
						insert into configurations (id, config_key, value) values (configurations_seq.nextval, 
																	'FP_PROFILES_LAST_RUN_IDENTIFIER_'||v_entity_id||'_'||:new.counter_instance_id, 9999) ;

					exception
						when no_data_found then
							v_entity_type := 0 ;
					end ;
				exception
					when no_data_found then
						dbms_output.put_line ('Enter profile_manager_entity_configs for offline counter '||:new.id) ;
				end ;
			end if ;
   	 end if ;
end ;
/

spool off
