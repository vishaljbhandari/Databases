spool nikira-DML-ai.log
set feedback off ;
set serveroutput off ;
--Blacklist Neural Profile Load  Action
insert into actions (ID, ACTION_NAME, IS_VISIBLE) values (52,'Blacklist Neural Profile Load Action',0);

----Cleanup Package Configurations---
insert into configurations (id, config_key, value) values (configurations_seq.nextval,'INSTALLATION.AI','1');

insert into scheduler_command_maps (job_name, command, is_parameter_required, is_network_based,is_mandatory) values ('Cumulative Record Generator', 'ai_cumulative_record_generator_wrapper.rb,AICRDGWrapperPID', 0, (select decode(count(*), 1,0,1) from networks),1) ;
commit ;

