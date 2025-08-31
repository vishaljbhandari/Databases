spool nikira-DML-tasks-not-fp-iu.log
set feedback off ;
set serveroutput off ;

		delete from ranger_groups_tasks ;

			delete from RULE_CREATION_RECORD_CONFIGS where task_id not in (select id from tasks where instr(package_ids, '4') <> 0) ;
			insert into ranger_groups_tasks (task_id, ranger_group_id) select id, 2 from tasks where instr(package_ids, '4') <> 0 ; 
			insert into ranger_groups_tasks (task_id, ranger_group_id) select id, 999 from tasks where name in ('Tasks', 'Default', 'Menu') and instr(package_ids, '4') <> 0;

			@nikira-DML-internal_user.sql
			exec assign_intuser_tasks(999) ; 

			
			insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 0 from ranger_groups_tasks where ranger_group_id = 2 ;
		insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 1 from ranger_groups_tasks where ranger_group_id = 2 ;
commit ;

