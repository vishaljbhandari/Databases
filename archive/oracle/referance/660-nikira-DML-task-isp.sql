spool nikira-DML-task-isp.log
set feedback off ;
set serveroutput off ;

---ISP
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('Record View'), 'IPDR', '/record_view/list/104?fetch_records=false', 0, 1) ;

insert into tasks (ID,PARENT_ID,NAME,LINK,IS_DEFAULT,IS_MENU_ITEM,PACKAGE_IDS,IMAGE_SRC) values (tasks_seq.nextval,GetParentID('IPDR','Record View'),'Manual Alarm','/record_view/create_manual_alarm/104',0,0,'0,1,4',null);

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Record View'), 'Filter on Non Indexed Fields', '/non_index_filtering/83', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM) values (tasks_seq.nextval, '0,4', GetParentID('IPDR', 'Record View'), 'Bulk Data Viewer', '/bulk_data_viewer/104', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'), 'IPDR', '/global_exceptions/list/83?show_enrichment=true',  0, 1) ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('IPDR', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/83', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Rule'), 'IPDR Rule Creation', '', 0, 0) ;
insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4', GetParentID('Add Template'), 'IPDR Template Creation', '', 0, 0) ;

insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 83, id, 'RULE' from tasks where name = 'IPDR Rule Creation') ;
insert into rule_creation_record_configs (select rc_record_configs_seq.nextval, 83, id, 'TEMPLATE' from tasks where name = 'IPDR Template Creation') ;

insert into bulk_data_view_configs values (104,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17',100000);

insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 104, id from tasks where link like '%record_view/list/104?fetch_records=%') ;

insert into tasks values(tasks_seq.nextval, GetParentID('IPDR','Record View'), 'Sort Across Pages', '/field_config/sort_across_pages/104', 0, 0, '0,1,4', '');

commit ;

