spool new-datastream.log

DROP TABLE NEW_DATASTREAM;
delete record_configs_rules where record_config_id=9901 ;
delete field_configs where record_config_id=9901 ; 
delete record_configs where id=9901 ; 
delete record_view_configs where id=9901 ; 

CREATE SEQUENCE NEW_DATASTREAM_ID INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
CREATE TABLE NEW_DATASTREAM(
ID        	              NUMBER(20,0),
PHONE_NUMBER              VARCHAR2(40), 
SUBSCRIBER_ID             NUMBER(20,0)    NOT NULL,
DEALER_CODE	              NUMBER(20,0),
IMSI				      VARCHAR2(40),
VALUE					  NUMBER(20,0),
NETWORK_ID				  NUMBER(20,0),
TIME_STAMP                DATE            NOT NULL
) ;

----------------------------------Record Config Entries----------------------------------------------

insert into record_configs (ID,TNAME,DESCRIPTION,CACHEABLE,KEY,IS_VISIBLE,DELIMETER,CATEGORY,IS_PARTITIONED) values(9901,'NEW_DATASTREAM','New DataStream',1,null,1,',','NAMED_FILTERS RULE_TAGS FINGERPRINT_ENTITY PROFILE_FIELD',0);

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_primary_view, is_logging_enabled) values (9901,'New DataStream',9901,'id>0','TBL.ID DESC',1,1,1,1);

insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'ID', 'ID',1,0,8, 0, '', '', 20, null, 0,0,'', 31) ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Phone Number', 'PHONE_NUMBER', 2, 1,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Subscriber Id','SUBSCRIBER_ID',3,2,8, 0, '', '', 20, null, 0,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Dealer Code','DEALER_CODE',4,3,8, 0, '', '', 20, null, 1,0,'', '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'IMSI', 'IMSI', 5, 4,3, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Value', 'VALUE', 6, 5,2, 1, '', '', 40, null, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Network Id', 'NETWORK_ID', 7, 6,1, 0, '', '', 40, 10, 1,1,1, '') ;
insert into field_configs (id, record_config_id, name, database_field, field_id, position, data_type, is_expandable, ds_category, query_field, width, translation_id, is_visible, is_filter, reg_exp_id, derivative_function)  values (field_configs_seq.nextval, 9901, 'Time Stamp', 'TIME_STAMP', 8, 7,4, 0, '', '', 40, null, 1,1,1, '') ;
-----------------------------------------------------------------------------------------------------

--------------------------------Entries for 'File Write Action', 'Dispatcher', 'SubscriberStore','Manual Alarm Rules'-----

insert into record_configs_rules values(5,9901,0);
insert into record_configs_rules values(6,9901,0);
insert into record_configs_rules values(7,9901,0);
insert into record_configs_rules (select r.id, rc.id, 0 from rules r , record_configs rc where rc.id=9901 and r.category = 'MANUAL_ALARM_RULES') ;

-----------------------------------------------------------------------------------------------------

-----------------------------DB Writer Configuration Entry-------------------------------------------

insert into dbwriter_configurations(id, record_config_id, max_recs_per_subpartition, max_subpartitions, current_partition_info, records_processed, max_wait_time, reserved_subpartitions) values (9901, 9901, 1000, 22, '0:0:0', 0, 1, '22,23') ;

-----------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------

--Entries into Tasks and ranger_groups_tasks to have 'New DataStream' in the Record View(with Bulk Data Viewer and Manual Alarm)

DECLARE
  parentid NUMBER(20) ;
BEGIN
  select GetParentID('Record View') into parentid from dual ;
  insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values(tasks_seq.nextval,'0,1,4' ,parentid,'New DataStream','/record_view/list/9901?fetch_records=false',0,1);
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

  select GetParentID('New DataStream', 'Record View' ) into parentid from dual ;
  insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', parentid,'Bulk Data Viewer','/bulk_data_viewer/9901',0,0);
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

  select GetParentID('New DataStream', 'Record View' ) into parentid from dual ;
  insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM )  values (tasks_seq.nextval,'0,1,4',parentid,'Manual Alarm','/record_view/create_manual_alarm/9901',0,0);
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

  select GetParentID('New DataStream', 'Record View' ) into parentid from dual ;
  insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM )  values (tasks_seq.nextval,'0,1,4',parentid,'Apply High Cost Filters','/high_cost_filtering/9901',0,0);
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

  select GetParentID('New DataStream', 'Record View' ) into parentid from dual ;
  insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM )  values (tasks_seq.nextval,'0,1,4',parentid,'Filter Using Pattern Searches','/filter_using_pattern_searches/9901',0,0);
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

 insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4',
	 GetParentID('Add Rule'), 'New DataStream Rule Creation', '', 0, 0) ;
 insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4',
	 GetParentID(' Add Rules'), 'New DataStream Customer Alert Rule Creation', '', 0, 0) ;
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

 insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,4',
	 GetParentID('Add Rule'), 'New DataStream Template Creation', '', 0, 0) ;
  insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin','nadmin','default');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('Global Exceptions'),'New DataStream', '/global_exceptions/list/9901?show_enrichment=true',  0, 1) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,1,4', GetParentID('New DataStream', 'Global Exceptions'), 'Modify', '/global_exceptions/edit/9901', 0, 0) ;
insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name not in ('InternalUser');

END;
/

-----------------------------------------------------------------------------------------------------

--DAC Entries 
insert into dac_record_views_tasks (select dac_record_views_tasks_seq.nextval, 9901, id from tasks where link like '%record_view/list/9901?fetch_records=%') ;


insert into field_categories(id, name, category, data_type, regular_expression_id, common_category_id, maskable_positions, is_maskable) values( 9901, 'DEALER CODE', 'AGGREGATION_TYPE NICKNAME HOTLIST MANUAL_ALARM AUTO_THRESHOLD ONDEMAND_OFFLINE_TEST', 3, 3, 9901,'2,3,4', 0);

-------------------------Mapping the field id's to the corresponding id of the field_categories table

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  2, 9901, '2') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  5, 9901, '7') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  17, 9901, '6') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  13, 9901, '8') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  16, 9901, '3') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  1, 9901, '1') ;
----------------------------------------------------------------------------------------------------


-----------------------------Entries for Events to be associated with NEW DATASTREAM---------------------

insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (1,9901) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) values (6,9901) ;

----------------------------------------------------------------------------------------------------

--Add to rc_record_configs 

insert into rc_record_configs (select rc_record_configs_seq.nextval, 9901, id, 'RULE' from tasks where name = 'New DataStream Rule Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 9901, id, 'TEMPLATE' from tasks where name = 'New DataStream Template Creation') ;
insert into rc_record_configs (select rc_record_configs_seq.nextval, 9901, id, 'CUST_ALERT_RULE' from tasks where name = 'New DataStream Customer Alert Rule Creation') ;

--Setting Page size in record view
insert into user_options
select user_options_seq.nextval,'9901.PageSize', user_id, role_id, value, is_read_only, is_enabled 
from user_options where option_id = '1.PageSize' ;
--Setting Page size in record view

--Adding New aggregation type--
update aggregation_types set RECORD_CONFIG_IDS= '3,71,1,7,2,9901' where id=2;

--New Aggregation Type
insert into aggregation_types (ID, DESCRIPTION, RECORD_CONFIG_IDS, DURATION_TYPE_IDS) values (9901, 'DEALER CODE', '9901', '-1,-2,-3,-4,-5,901') ;
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, 9901) ;
insert into xdr_query_hints values (xdr_query_hints_seq.nextval, 9901, '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */');
insert into agg_type_pseudo_functions values(agg_type_pseudo_functions_seq.nextval, 9901, 1) ;
insert into agg_type_pseudo_functions values(agg_type_pseudo_functions_seq.nextval, 9901, 6) ;

insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,  9901, 9901, '4') ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id,  group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 9901, 0, 0, '') ;
insert into agg_type_granularity_maps(ID, AGGREGATION_TYPE, GRANULARITY, PRIORITY) values(AGG_TYPE_GRANULARITY_MAPS_SEQ.nextval, 9901, 0, 1) ;

insert into reference_types(id, description, record_config_id) values(9901, 'DEALER CODE', null) ;

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id,REFERENCE_CATEGORY_ID )
	values (reference_types_maps_seq.nextval, 9901, 9901, 9901, 9901 ) ;

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 9901 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 9901 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into tags(select tags_seq.nextval, name, 'AGGREGATION_TYPE' from field_categories where category like '%AGGREGATION_TYPE%' and name ='DEALER CODE' ) ;



-- CounterManager Mappings --
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 2, 9901) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id) values (1, 1, 9901, 9901) ;

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval,2,9901,2,1);
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval,2,9901,1,1);
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval,9901,9901,2,1);
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type) values (counter_maps_seq.nextval,9901,9901,1,1);


-- Inserts for record_types which are not to be used by alarmdenormalizer
INSERT INTO NO_DENORMALIZATION_TYPES (ID,RECORD_CONFIG_ID,DESCRIPTION) VALUES(999,9901,'NEW DATASTREAM') ;

insert into modulo_dispatcher_categories  (record_config_id, field_category_id, enabled) values (9901, 2, 1) ;

insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (10056, 'Subscriber Info', 9901, 'PHONE_NUMBER', 21, 'PHONE_NUMBER', 0, 2, 'RECORD_VIEW GR RULE');	
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 47, 9901, '10056.32') ;
insert into field_record_config_maps(id, field_category_id, record_config_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 29, 9901, '10056.22') ;



--New Datastream table entries
insert into new_datastream values (1024, '+123', 1, 111, 11111, 10, 1024, sysdate);
insert into new_datastream values (1025, '+456', 3, 222, 11111, 10, 1024, sysdate);


--Sample RFF
--Recordtype:9901
--+919812005761, 1025, 556, 111, 10, 1024, 2010/03/23 06:15:00


commit;
spool off;


