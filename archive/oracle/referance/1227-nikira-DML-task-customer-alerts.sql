spool nikira-DML-task-fingerprint.log
set feedback off ;
set serveroutput off ;


--insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (tasks_seq.nextval, '0,1,3,4', GetParentID('Tasks'), 'Customer Alert Management','',0, 1,'icons/rulemanagement.png') ;
--insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Customer Alert Management'),'Groups','/subscriber_group/index/342',0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Customer Alert Management'),'Grouping Rules','/grouping_rule/index/143',0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Customer Alert Management'),'Customer Alert Rules','/customer_alert_rule/list/252',0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Customer Alert Management'),'Notification Templates','/customer_alert_template/list/145',0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',(select id from tasks where name = 'Customer Alert Management'),'Customer Notifications','/customer_notification/list/253',0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Groups' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Add Groups','/subscriber_group/new/342;/subscriber_group/create/342',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Groups' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Modify Groups','/subscriber_group/update/342;/subscriber_group/edit/342',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Groups' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Delete Groups','/subscriber_group/destroy/342;/subscriber_group/multiple_delete/342',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Grouping Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Add Grouping Rules','/grouping_rule/new/143;/grouping_rule/create/143',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Grouping Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Modify Grouping Rules','/grouping_rule/update/143;/grouping_rule/edit/143',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Grouping Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Delete Grouping Rules','/grouping_rule/destroy/143;/grouping_rule/multiple_delete/143',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4', (select id from tasks where name = 'Grouping Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Show Grouping Rules','/grouping_rule/show/143',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',
	(select id from tasks where name = 'Customer Alert Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Add Rules','/customer_alert_rule/new/252;/customer_alert_rule/create/252',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',
	(select id from tasks where name = 'Customer Alert Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Modify Rules','/customer_alert_rule/update/252;/customer_alert_rule/edit/252',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',
	(select id from tasks where name = 'Customer Alert Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Delete Rules','/customer_alert_rule/destroy/252;/customer_alert_rule/multiple_delete/252',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',
	(select id from tasks where name = 'Customer Alert Rules' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Show Rules','/customer_alert_rule/show/252',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Notification Templates' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Add Notification Template','/customer_alert_template/new/145;/customer_alert_template/create/145',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Notification Templates' and parent_id = (select id from tasks where name ='Customer Alert Management')),' Modify Notification Templates','/customer_alert_template/update/145;/customer_alert_template/edit/145',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval,'0,1,3,4',(select id from tasks where name = 'Notification Templates' and parent_id = (select id from tasks where name ='Customer Alert Management')),' Delete Customer Alert Templates','/customer_alert_template/destroy/145;/customer_alert_template/multiple_delete/145',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Notification Templates' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Show Notification Templates','/customer_alert_template/show/145',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,3,4',	(select id from tasks where name = 'Customer Notifications' and parent_id = (select id from tasks where name = 'Customer Alert Management')),' Show Customer Notifications','/customer_notification/show/253',0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval,'0,1,3,4',(select id from tasks where name= 'Customer Notifications' and parent_id = (select id from tasks where name = 'Customer Alert Management')), 'Bulk Data Viewer', '/bulk_data_viewer/253', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID(' Add Rules'), 'IPDR Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID(' Add Rules'), 'GPRS Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID(' Add Rules'), 'Recharge Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID(' Add Rules'), 'CDR Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID(' Add Rules'), 'Adjustment Logs Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,4', GetParentID(' Add Rules'), 'CRM Logs Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', GetParentID(' Add Rules'), 'Subscriber Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,3,4', GetParentID(' Add Rules'), 'Account Customer Alert Rule Creation', '', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');


insert into rc_record_configs (select rc_record_configs_seq.nextval, 83, id, 'CUST_ALERT_RULE' from tasks where name = 'IPDR Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 72, id, 'CUST_ALERT_RULE' from tasks where name = 'CRM Logs Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 71, id, 'CUST_ALERT_RULE' from tasks where name = 'Adjustment Logs Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 7, id, 'CUST_ALERT_RULE' from tasks where name = 'GPRS Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 2, id, 'CUST_ALERT_RULE' from tasks where name = 'Recharge Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 1, id, 'CUST_ALERT_RULE' from tasks where name = 'CDR Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 3, id, 'CUST_ALERT_RULE' from tasks where name = 'Subscriber Customer Alert Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 4, id, 'CUST_ALERT_RULE' from tasks where name = 'Account Customer Alert Rule Creation') ;


commit;
