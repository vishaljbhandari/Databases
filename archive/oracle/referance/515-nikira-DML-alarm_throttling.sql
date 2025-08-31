set feedback off ;
set serveroutput on ;
spool alarm_throttling_migration.log
delete from ranger_groups_tasks where TASK_ID in (select ID from tasks where LINK='/alarm_stack/restore_to_avl/18');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Tasks'), 'Restore Alarm As Available','/alarm/show_close_alarm_as_available',0, 0) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alarms', 'Alarm Management'), 'Set Visible Columns', '/field_config/visible_columns/10', 0, 0) ;


insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alarms', 'Alarm Management'), 'Set Page Size', '/field_config/page_size/10', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alarms', 'Alarm Management'), 'Set Sort Order ', '/field_config/sort_order/10', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alarms', 'Alarm Management'), 'Set Color Schema', '/field_config/color_schema/10', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('My Alarms', 'Alarm Management'), 'Set Visible Columns', '/field_config/visible_columns/96', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('My Alarms', 'Alarm Management'), 'Set Page Size', '/field_config/page_size/96', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('My Alarms', 'Alarm Management'), 'Set Sort Order', '/field_config/sort_order/96', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('My Alarms', 'Alarm Management'), 'Set Color Schema', '/field_config/color_schema/96', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0, 1, 2, 3, 4', GetParentID('My Team Alarms', 'Alarm Management'), 'Set Visible Columns', '/field_config/visible_columns/116', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0, 1, 2, 3, 4', GetParentID('My Team Alarms', 'Alarm Management'), 'Set Page Size', '/field_config/page_size/116', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0, 1, 2, 3, 4', GetParentID('My Team Alarms', 'Alarm Management'), 'Set Sort Order', '/field_config/sort_order/116', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0, 1, 2, 3, 4', GetParentID('My Team Alarms', 'Alarm Management'), 'Set Color Schema', '/field_config/color_schema/116', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Assignment Rules'), 'Set Visible Columns', '/field_config/visible_columns/91', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Assignment Rules'), 'Set Page Size', '/field_config/page_size/91', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Assignment Rules'), 'Set Sort Order', '/field_config/sort_order/91', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Escalation/Notification Rules'), 'Set Visible Columns', '/field_config/visible_columns/97', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Escalation/Notification Rules'), 'Set Page Size', '/field_config/page_size/97', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Alarm Escalation/Notification Rules'), 'Set Sort Order', '/field_config/sort_order/97', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Open Alarms'), 'Set Visible Columns', '/field_config/visible_columns/16', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Open Alarms'), 'Set Page Size', '/field_config/page_size/16', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Open Alarms'), 'Set Sort Order', '/field_config/sort_order/16', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Open Alarms'), 'Set Color Schema', '/field_config/color_schema/16', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Assigned Alarms'), 'Set Visible Columns', '/field_config/visible_columns/18', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Assigned Alarms'), 'Set Page Size', '/field_config/page_size/18', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Assigned Alarms'), 'Set Sort Order', '/field_config/sort_order/18', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Assigned Alarms'), 'Set Color Schema', '/field_config/color_schema/18', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Closed Alarms'), 'Set Visible Columns', '/field_config/visible_columns/17', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Closed Alarms'), 'Set Page Size', '/field_config/page_size/17', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Closed Alarms'), 'Set Sort Order', '/field_config/sort_order/17', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Closed Alarms'), 'Set Color Schema', '/field_config/color_schema/17', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alerts'), 'Set Visible Columns', '/field_config/visible_columns/32', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alerts'), 'Set Page Size', '/field_config/page_size/32', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alerts'), 'Set Sort Order ', '/field_config/sort_order/32', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alerts'), 'Set Color Schema', '/field_config/color_schema/32', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Archived Alarms'), 'Set Visible Columns', '/field_config/visible_columns/19', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Archived Alarms'), 'Set Page Size', '/field_config/page_size/19', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Archived Alarms'), 'Set Sort Order ', '/field_config/sort_order/19', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Archived Alarms'), 'Set Color Schema', '/field_config/color_schema/19', 0, 0) ;

insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (0, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (1, tasks_seq.currval) ;
insert into ranger_groups_tasks(RANGER_GROUP_ID, TASK_ID) values (2, tasks_seq.currval) ;


commit ;
/
