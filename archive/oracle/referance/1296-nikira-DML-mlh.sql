spool nikira-DML-mlh.log
set feedback off ;
set serveroutput off ;
--For Multi Level Account Hierarchy
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (40,'Update Hierarchy ID',0) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (42,'Close All Accounts In Hierarchy',0) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (43,'Close Alarms In Hierarchy',0) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (44,'Reject Account Record',0) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (45,'Blacklist Hierarchy Profile', 0) ;
insert into actions (ID,ACTION_NAME,IS_VISIBLE) values (46,'Copy Precheck Info For Account', 0) ;


---- ***************** Popup Menu configration for MLH Tree ***************** ------
set define off;

insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','10','/record_view/get_mlh_data_records','data_record_view_config_id=10&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','10','/record_view/get_mlh_data_records','data_record_view_config_id=10&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER&mlh_option=3');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','26','/record_view/get_mlh_data_records','data_record_view_config_id=26&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','16','/record_view/get_mlh_data_records','data_record_view_config_id=16&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','16','/record_view/get_mlh_data_records','data_record_view_config_id=16&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','17','/record_view/get_mlh_data_records','data_record_view_config_id=17&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','17','/record_view/get_mlh_data_records','data_record_view_config_id=17&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','50','/record_view/get_mlh_data_records','data_record_view_config_id=50&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','18','/record_view/get_mlh_data_records','data_record_view_config_id=18&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','18','/record_view/get_mlh_data_records','data_record_view_config_id=18&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','19','/record_view/get_mlh_data_records','data_record_view_config_id=19&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','19','/record_view/get_mlh_data_records','data_record_view_config_id=19&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers','3','/record_view/get_mlh_data_records','data_record_view_config_id=3&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers Without Filters','3','/record_view/get_mlh_data_records','data_record_view_config_id=3&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers','12','/record_view/get_mlh_data_records','data_record_view_config_id=12&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers Without Filters','12','/record_view/get_mlh_data_records','data_record_view_config_id=12&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Accounts','4','/record_view/get_mlh_data_records','data_record_view_config_id=4&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Accounts Without Filters','4','/record_view/get_mlh_data_records','data_record_view_config_id=4&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Accounts','13','/record_view/get_mlh_data_records','data_record_view_config_id=13&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Accounts Without Filters','13','/record_view/get_mlh_data_records','data_record_view_config_id=13&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');
----Entries for MyAlarm MLH View
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','96','/record_view/get_mlh_data_records','data_record_view_config_id=96&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','96','/record_view/get_mlh_data_records','data_record_view_config_id=96&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER&mlh_option=3');
----Entries for Suspect FingerPrints
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values (popupmenu_configurations_seq.nextval,'Show All Suspected Subscribers','100','/record_view/get_mlh_data_records','data_record_view_config_id=100&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values (popupmenu_configurations_seq.nextval,'Show All Suspected Subscribers Without Filters','100','/record_view/get_mlh_data_records','data_record_view_config_id=100&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');

---Entries for Disconnected Subsciber View
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers','105','/record_view/get_mlh_data_records','data_record_view_config_id=105&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Subscribers w/o Filters','105','/record_view/get_mlh_data_records','data_record_view_config_id=105&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER');

insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms','116','/record_view/get_mlh_data_records','data_record_view_config_id=116&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=2&action_controller=ACTIONCONTROLLER');
insert into POPUPMENU_CONFIGURATIONS (ID,LABEL,RECORD_VIEW_CONFIG_ID,URL,ARGUMENTS) values(popupmenu_configurations_seq.nextval,'Show All Alarms Without Filters','116','/record_view/get_mlh_data_records','data_record_view_config_id=116&reference_record_view_config_id=4&parent_id=PARENTID&mlh_option=3&action_controller=ACTIONCONTROLLER&mlh_option=3');
set define on;

commit ;

