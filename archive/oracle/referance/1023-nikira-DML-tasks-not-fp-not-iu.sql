spool nikira-DML-tasks-not-fp-not-iu.log
set feedback off ;
set serveroutput off ;


		delete from ranger_groups_tasks ;
			delete from RC_RECORD_CONFIGS where task_id not in (select id from tasks where instr(package_ids, '4') <> 0) ;
			insert into ranger_groups_tasks (task_id, ranger_group_id) select id, 2 from tasks where instr(package_ids, '4') <> 0 ; 

		insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 0 from ranger_groups_tasks where ranger_group_id = 2 ;
		insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 1 from ranger_groups_tasks where ranger_group_id = 2 ;

commit ;

