update precheck_lists set filter_id=(select id from filters where name='3711') where name='AlarmLinkPrecheckList' ;

/* for removing entries of Precheck, Profiles and Rule Test Facility task_ids from ranger_groups_tasks for Internal Users */
delete from ranger_groups_tasks where task_id in (55,56,57) and ranger_group_id=999; 
commit;
