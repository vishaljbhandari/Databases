insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Show Inline Rule'),0 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Show Inline Rule'),1 from dual) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) (select (select id from tasks where name = 'Show Inline Rule'),2 from dual) ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 3, id, 'TEMPLATE' from tasks where name = 'Subscriber Template Creation') ;
