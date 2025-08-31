SPOOL nikira-nikira-DML-delete-trigger-multiple-instance.log
SET FEEDBACK OFF ;
set serveroutput off ;

create or replace trigger CounterInstDeleteTrigger
before delete  on IN_MEMORY_COUNTER_DETAILS
for each row
DECLARE
v_entity_type  number(3) ;
v_entity_id    number(3) ;
v_online_counter_id number(10) ;
begin
   	 if (:old.counter_instance_id != 0)
   	 then
   	     if ( :old.counter_category in (5))
   	     then
		 		begin
		   	 		select entity_type,online_counter_id into v_entity_id, v_online_counter_id from profile_manager_entity_configs where offline_counter_id = :old.id ;
					delete from PM_INSTANCE_CONFIGS where entity_type = v_entity_id and instance_id = :old.counter_instance_id ;
					delete from scheduler_command_maps where job_name in ('Profile Manager_'||v_entity_id||'_'||:old.counter_instance_id) ;

					begin
						select entity_type into v_entity_type from fp_entities where  id = v_entity_id and category like '%FP%' ;

						delete from FP_PROFILES_DATASET_MAP where entity_id  = v_entity_id and instance_id = :old.counter_instance_id ;

						delete from configurations where config_key = 'FP_PROFILES_LAST_RUN_IDENTIFIER_'||v_entity_id||'_'||:old.counter_instance_id ;

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
