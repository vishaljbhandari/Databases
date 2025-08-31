spool nikira-DML-task-mlh.log
set feedback off ;
set serveroutput off ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Active Alarms', 'Alarm Management'), 'MLH View', '/alarm_stack/mlh_view/10', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('My Alarms', 'Alarm Management'), 'MLH View', '/alarm_stack/mlh_view/96', 0, 0);
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('My Team Alarms', 'Alarm Management'), 'MLH View', '/alarm_stack/mlh_view/116', 0, 0);



insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Account View'), 'MLH View', '/account/mlh_view/4', 0, 0);
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Open Alarms'), 'MLH View', '/alarm_stack/mlh_view/16', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Closed Alarms'), 'MLH View', '/alarm_stack/mlh_view/17', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Assigned Alarms'), 'MLH View', '/alarm_stack/mlh_view/18', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Case Management'), 'MLH View', '/case/mlh_view/26', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Closed Cases'), 'MLH View', '/case/mlh_view/50', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Archived Alarms'), 'MLH View', '/alarm_stack/mlh_view/19', 0, 0) ;


	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Active Subscriber', 'Subscriber View'), 'MLH View', '/roc_profile/mlh_view/3', 0, 0);
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Black List Account'), 'MLH View', '/account/mlh_view/13', 0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Black List Subscriber'), 'MLH View', '/roc_profile/mlh_view/12', 0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0,4', GetParentID('Suspect eFingerprints'),'MLH View','/roc_profile/mlh_view/100',0, 0) ;
	insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values ( tasks_seq.nextval, '0', GetParentID('Disconnected Subscriber'), 'MLH View', '/roc_profile/mlh_view/105', 0, 0) ;
commit ;

