SPOOL migration_on_16042006.log;

DROP SEQUENCE ALARM_DETAILS_TAB_CONFIGS_SEQ ;
DROP TABLE ALARM_DETAILS_TAB_CONFIGS ;

CREATE SEQUENCE ALARM_DETAILS_TAB_CONFIGS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE ALARM_DETAILS_TAB_CONFIGS
(
    ID                      NUMBER(10)  NOT NULL,
    EXPANDABLE_FIELD_MAP_ID NUMBER(10)  NOT NULL,
    CONSTRAINT PK_AL_DET_TAB_CONF_ID PRIMARY KEY(ID),
    CONSTRAINT FK_AL_DET_TAB_CONF_EXP_FIE_ID FOREIGN KEY (EXPANDABLE_FIELD_MAP_ID) REFERENCES EXPANDABLE_FIELD_MAPS(ID)
) ;

CREATE OR REPLACE FUNCTION GetParentID(name_string VARCHAR2, pre_name_string1 VARCHAR2 DEFAULT NULL, pre_name_string2 VARCHAR2 DEFAULT NULL) RETURN NUMBER
      IS
          id  INTEGER ;
      BEGIN
          if ((pre_name_string1 IS NULL) and (pre_name_string2 IS NULL))then
              SELECT id INTO id FROM tasks
                      WHERE name = name_string ;
          elsif (pre_name_string2 IS NULL) then
              SELECT id INTO id FROM tasks
                     WHERE name = name_string and parent_id = ( SELECT id FROM tasks  WHERE name = pre_name_string1 );
          else
              SELECT id INTO id FROM tasks
                     WHERE name = name_string
                        and parent_id = ( SELECT id FROM tasks
                                                        WHERE name = pre_name_string1
                                                            and parent_id = ( SELECT id FROM tasks
                                                        WHERE name = pre_name_string2));
         end if ;
         RETURN id;
     END GetParentID ;
/


insert into configurations (id, config_key, value) values (configurations_seq.nextval,'CSVFILE.DELIMITER', '|') ;

delete from expandable_field_maps where id in (1543, 1544) ;

update expandable_field_maps set name = 'Billing Number Summary' where id in (1737, 1539, 1540) ;

insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1537) ;
insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1539) ;
insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1540) ; 

update record_view_configs set is_visible=0 where id in (28,29);
update record_configs set is_visible=0 where id in (25,26);

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible,is_cell_specific, is_primary_view) values(30,'Active Alerts',11,'alarm_id in (select alarms.id from alarms where status not in (2,4))','ID ASC', 0, 1, 1, 0) ;
	
update field_configs set is_filter = 1, reg_exp_id = 13 where id in (432, 434, 435, 438, 439) ;
update field_configs set is_filter = 1, reg_exp_id = 13 where id = 433 ;
update field_configs set is_filter = 1, reg_exp_id = 0 where id = 440 ;
update field_configs set is_filter = 1 where id in (436, 437) ;


insert into field_config_links (id, source_view_id, source_key, link) values (4, 30, 'EVENT_INSTANCE_ID', 'rule') ;
	
---------------Record Configs and Field Configs For Audit Files Processed-----------
update record_view_configs set name = 'User/Server Actions' where id = 8 ;

insert into record_configs (id, tname, description, cacheable, key, is_visible) values(30,'AUDIT_FILES_PROCESSED','Files processed',0,'ID',0) ;
insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view) values(31,'Files Processed',30,'','', 1, 1, 0) ;


insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Record Name', 'RECORD_NAME',1,0,3,0,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Status', 'STATUS',2,0,3,0,'','',40,null,0,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'File Name', 'FILE_NAME',3,0,3,0,'','',40,null,1,0,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Start Time', 'START_TIME',4,0,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'End Time', 'END_TIME',5,0,4,0,'','',40,null,1,null,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Total Record Count', 'TOTAL_COUNT',6,0,1,0,'','',40,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Accepted Record Count', 'ACCEPTED',7,0,1,0,'','',40,null,1,13,1) ;
insert into field_configs(id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, reg_exp_id, is_filter) values  (field_configs_seq.nextval, 30, 'Rejected Record Count', 'REJECTED',8,0,1,0,'','',40,null,1,13,1) ;

------Added between operator for interger, float and date datatypes.
insert into data_types_operators(data_type_id, operator_id) values(1, 10) ;
insert into data_types_operators(data_type_id, operator_id) values(2, 10) ;
insert into data_types_operators(data_type_id, operator_id) values(4, 10) ;


update tasks set name = 'Active Alarms' where name = 'View Alarms' ; 
delete from RANGER_GROUPS_TASKS where task_id = 129;
delete from tasks where id=129 ;

DECLARE
	parentid NUMBER(20) ;
BEGIN

	insert into tasks values ( tasks_seq.nextval, GetParentID('Tasks'),'Audit log','',0, 1) ;
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name = 'radmin';

	select GetParentID('Alarm Management') into parentid from dual ;

	insert into tasks (select tasks_seq.nextval, parentid, name, '/record_view/list/' || id ,0 , 1 from record_view_configs where id = 30 );
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin', 'nadmin' ,'default');

	select GetParentID('Audit log') into parentid from dual ;

	insert into tasks (select tasks_seq.nextval, parentid, name, '/record_view/list/' || id ,0 , 1 from record_view_configs where  id = 8);
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin', 'nadmin' ,'default');
	insert into tasks (select tasks_seq.nextval, parentid, name, '/record_view/list/' || id,0 , 1 from record_view_configs where  id = 31);
	insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin', 'nadmin' ,'default');

END;
/

commit;

SPOOL OFF;

EXIT;
