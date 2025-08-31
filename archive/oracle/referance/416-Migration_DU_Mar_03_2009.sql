set feedback on
set serveroutput on
spool Migration_DU_Mar_03_2009.log;

DROP SEQUENCE TRANSLATION_INDICES_SEQ ;
CREATE SEQUENCE TRANSLATION_INDICES_SEQ INCREMENT BY 1 START WITH 515 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;

update field_configs set translation_id=null where id=508 ;
update field_configs set translation_id=null where record_config_id in (10,16,21,22,23,24) and database_field = 'USER_ID' ;

delete translations where tr_id in (513, 514) ;
delete translation_indices where id in (513, 514) ;

insert into translation_indices (id, description, sort_on, is_dynamic) values (513, 'User Names', null, 1) ;
insert into translations values (translations_seq.nextval, 513, '-176', 'select name as key, name as value from RANGER_USERS where id > 2 and is_active = 1 order by name') ;
update field_configs set translation_id=513 where id=508 ;

insert into translation_indices (id, description, sort_on, is_dynamic) values (514, 'Owner Name', null, 1) ;
insert into translations values (translations_seq.nextval, 514, '-176', 'select * from (select name as key, name as value from RANGER_USERS where id > 2 and is_active = 1 union select name as key, name||'' (Team)'' as value from teams where is_active = 1) order by value') ;
update field_configs set translation_id=514 where record_config_id in (10,16,21,22,23,24) and database_field = 'USER_ID' ;

update basic_filter_configs set operator_id=8 where record_config_id in (8,10,16,21,22,23,24) and field_id=9 ;
delete basic_filter_configs where field_id in (9,25) and RECORD_VIEW_CONFIG_ID=16 ;

delete configurations where config_key='LAST_NF_FILE' ;
insert into configurations values(configurations_seq.nextval, 'LAST_NF_FILE', null, 1);

-- Precheck Alarm Details Report --

delete from ranger_groups_tasks where task_id in (select id from tasks where NAME='Precheck Alarm Details');
delete from tasks where NAME='Precheck Alarm Details';

delete report_parameters where report_id in (select id from reports where name='PrecheckAlarmDetails');
delete reports where name='PrecheckAlarmDetails' ;

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrecheckAlarmDetails','Precheck Alarm Details', 'Alarms', 'This Report shows the Matched Details for each Active Precheck Alarm',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'End Date','EndDate',4,NULL,1);

DECLARE
    parentid NUMBER(20) ;
BEGIN
	    select GetParentID('Report Listing', 'Reports') into parentid from dual ;
		insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) (select tasks_seq.nextval, '0,1,2,3', parentid, 'Precheck Alarm Details', '', 0, 0 from dual) ; 
END ;
/

insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'radmin';
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'nadmin';
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval, id from ranger_groups where name = 'default';

commit;
spool off;
quit;
/

