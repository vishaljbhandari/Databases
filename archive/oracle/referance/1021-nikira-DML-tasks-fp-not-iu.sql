spool nikira-DML-tasks-fp-not-iu.log
set feedback off ;
set serveroutput off ;
delete from ranger_groups_tasks ;

			delete from RC_RECORD_CONFIGS where task_id not in (select id from tasks ) ;
            insert into ranger_groups_tasks (task_id, ranger_group_id) select id, 2 from tasks  ;
            insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'IS_FP_ENABLED', '1');

            insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 0 from ranger_groups_tasks where ranger_group_id = 2 ;
	        insert into ranger_groups_tasks (task_id, ranger_group_id) select task_id, 1 from ranger_groups_tasks where ranger_group_id = 2 ;

commit ;


