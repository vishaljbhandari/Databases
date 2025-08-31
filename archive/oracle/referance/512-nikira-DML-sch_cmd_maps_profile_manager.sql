
---Distribution mode--------

delete from scheduler_command_maps where job_name like 'Profile Manager%' ;

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based) 
	select 'Profile Manager_'||entity_type||'_'||instance_id, 'profile_manager.rb '||entity_type||' '||instance_id||',ProfilemanagerPID', 0, 0 from pm_instance_configs ;
