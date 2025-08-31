spool SCHEDULER_COMMAND_MAPS.log


---------------------------delete statements ---------------
delete from SCHEDULER_COMMAND_MAPS where job_name = 'Profile Manager_6011_0' and command = 'profile_manager.rb 6011 0,ProfilemanagerPID' ;
---------------------------insert statements ---------------
insert into SCHEDULER_COMMAND_MAPS(command,job_name,report_file_name,is_network_based,machine_id,is_mandatory,is_parameter_required) values ('profile_manager.rb 6011 0,ProfilemanagerPID','Profile Manager SubscriberUID Instance 0','','0','','','0');
spool off ;
