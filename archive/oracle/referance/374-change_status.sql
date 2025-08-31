insert into tasks(id, parent_id, name, link, is_default, is_menu_item, package_ids, image_src) values (tasks_seq.nextval, GetParentID('Assigned Alarms'), 'Change Status', '/alarm_stack/change_status/18', 0, 0, '0,1,2,3,4', '') ;
insert into ranger_groups_tasks(ranger_group_id, task_id) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(ranger_group_id, task_id) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(ranger_group_id, task_id) values (2, tasks_seq.currval) ;
commit ;
