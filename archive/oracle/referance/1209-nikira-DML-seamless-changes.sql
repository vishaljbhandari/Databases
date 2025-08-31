--Expression correction for rules
--Set Is New Flag
--Add Subscriber

insert into expressions (id, left_field,LEFT_FIELD_INDICATOR, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54',1025,'54', 1029, 7);
update filter_tokens set EXPRESSION_ID=expressions_seq.currval where FILTER_ID=56 and ID=3738;

insert into expressions (id, left_field,LEFT_FIELD_INDICATOR, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54',1025,'54', 1029, 7);
update filter_tokens set EXPRESSION_ID=expressions_seq.currval where FILTER_ID=55 and ID=3732;

insert into expressions (id, left_field,LEFT_FIELD_INDICATOR, right_field, right_field_indicator, operator_id) values (expressions_seq.nextval, '20.54',1025,'54', 1029, 7);
update filter_tokens set EXPRESSION_ID=expressions_seq.currval where FILTER_ID=55 and ID=3733;

delete from FIELD_CATEGORIES where ID=103 and NAME='Parent Account Hierarchy ID';
update regular_expressions set DESCRIPTION='Alphabet Regular Expression to test characters with no laguage key' where DESCRIPTION='Alphabet Regular Expression to test characters' and LANGUAGE_KEY is null;
update regular_expressions set DESCRIPTION='Default Regular Expression for word' where DESCRIPTION='Default Regular Expression' and ID=9;
update filter_tokens set filter_id=3684 where filter_id=9;
delete  from filters_rules where filter_id=9; 

--Deleting duplicates.
delete from RANGER_GROUPS_TASKS where TASK_ID = 1452 ;
delete from tasks  where id = 1452 ;

--Updating name in record_view_configs to have unique name in business constraint (name, record_config_id)
update record_view_configs set name='Alarms ' where id = 27;
update record_view_configs set name='Named Filters '  where id = 40 ;
update record_view_configs set name='Internal User ' where id = 112 ;

--Removing duplicates.
delete from FIELD_RECORD_CONFIG_MAPS where FIELD_CATEGORY_ID = 30 and RECORD_CONFIG_ID = 505  and FIELD_ASSOCIATION=11 ;
delete from FIELD_RECORD_CONFIG_MAPS where FIELD_CATEGORY_ID = 212 and RECORD_CONFIG_ID =3 and FIELD_ASSOCIATION = 32 ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (field_record_config_maps_seq.nextval, 505, 11, 30) ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (field_record_config_maps_seq.nextval, 3, 212, 32) ;

--Removing duplicates.
delete from RECORD_VIEW_CONFIGS_REPORTS where RECORD_VIEW_CONFIG_ID=50 and REPORT_ID =34 ;
insert into RECORD_VIEW_CONFIGS_REPORTS(RECORD_VIEW_CONFIG_ID, REPORT_ID) values(50, 34) ;

--Removing duplicates.
delete from FEATURE_SOURCES where FEATURE_ID = (select id from feature_status where name='RTF') and SOURCE_ID = (select id from source where DESCRIPTION='Rule Test Facility');
insert into FEATURE_SOURCES(ID, FEATURE_ID, SOURCE_ID) values (FEATURE_SOURCES_seq.nextval, (select id from feature_status where name='RTF'), (select id from source where DESCRIPTION='Rule Test Facility')) ;

--Removing duplicates.
delete from RECORD_CONFIGS_RULES where RULE_ID= (select id from rules where name='Update CurrentPartitionInfo') and RECORD_CONFIG_ID = (select id from record_configs where description='LTE') and GRANULARITY = 0;
insert into RECORD_CONFIGS_RULES values((select id from rules where name='Update CurrentPartitionInfo'), (select id from record_configs where description='LTE'), 0) ;

--Removing duplicates.
delete from RECORD_CONFIG_TASK_MAPS where TASK_ID is null ;
delete from RECORD_CONFIG_TASK_MAPS where  RECORD_CONFIG_ID =160 and TASK_ID = (select id from tasks where name = 'Order Form Rule Creation');
delete from RECORD_CONFIG_TASK_MAPS where  RECORD_CONFIG_ID =160 and TASK_ID= (select id from tasks where name = 'Order Form Template Creation');
delete from RECORD_CONFIG_TASK_MAPS where  RECORD_CONFIG_ID =160 and TASK_ID= (select id from tasks where name = 'Order Form Customer Alert Rule Creation');
delete from RECORD_CONFIG_TASK_MAPS where  RECORD_CONFIG_ID =160 and TASK_ID= (select id from tasks where NAME='Orders' and link='/record_view/list/161?fetch_records=false');
delete from RECORD_CONFIG_TASK_MAPS where  RECORD_CONFIG_ID =7 and TASK_ID= (select id from tasks where NAME='GPRS' and link='/global_exceptions/list/7?show_enrichment=true');

insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_seq.nextval, 160, (select id from tasks where name = 'Order Form Rule Creation'));
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_seq.nextval, 160, (select id from tasks where name = 'Order Form Template Creation'));
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_seq.nextval, 160, (select id from tasks where name = 'Order Form Customer Alert Rule Creation'));
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_seq.nextval, 160, (select id from tasks where NAME='Orders' and link='/record_view/list/161?fetch_records=false')) ;
insert into RECORD_CONFIG_TASK_MAPS values(RECORD_CONFIG_TASK_MAPS_seq.nextval, 7, (select id from tasks where NAME='GPRS' and link='/global_exceptions/list/7?show_enrichment=true')) ;

--Updating Rule name according to catetory in order to have unique name for business contraints for rules table (name,
	--versoin and user_id)
update rules set name='Subscriber Store Dispatcher' where name='Dispatcher' and category='SUBSCRIBER.STORE';
update rules set name='Scheduler Dispatcher Profile' where name='Scheduler Dispatcher' and category='DISPATCH.PROFILE_MATCH';

--Removing duplicates from counter_maps
create table counter_maps_bak as select distinct AGGREGATION_TYPE, RECORD_CONFIG_ID, FUNCTION_ID, COUNTER_TYPE, CATEGORY from counter_maps ;
truncate table counter_maps ;
 
--Removing duplicates
delete from rc_record_configs where RECORD_CONFIG_ID = 3 and  task_id in ( select id from tasks where name='Subscriber Template Creation') and category='TEMPLATE';
insert into rc_record_configs values(rc_record_configs_seq.nextval, 2, (select id from tasks where name='Subscriber Template Creation'), 'TEMPLATE') ; 

insert into counter_maps  select counter_maps_seq.nextval,  AGGREGATION_TYPE, RECORD_CONFIG_ID, FUNCTION_ID, COUNTER_TYPE, CATEGORY from counter_maps_bak ;
drop table counter_maps_bak ; 
--Updating rule dates fields to sysdate
update rules set created_time=sysdate, modification_time=sysdate ;
update holiday_lists set is_repetitive =1 ;

--DB corrections for Silent installer
update audit_log_event_codes set action ='Alarm raised on $2 (''$1'') changed its status from ''$3'' to ''$4'' -- Actions Performed : $5' where id=52;
update record_configs set category='TEST_RULE NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD CUSTOMER_ALERT DATASTREAM' where id=83;
update reports set description ='This report gives the details of the subscriber who has initiated short GPRS session' where id=39;
update XDR_OFFLINE_TEMP_MAPS set id = 5 where record_config_id = 505;

update report_parameters set name = 'Record Type' where report_id=20 and position=5 and id=77;

delete from xdr_offline_temp_maps;
delete from record_loader_config;
exec filters_bc ;
exec expression_bc ;

drop procedure expression_bc;
drop procedure filters_bc;
