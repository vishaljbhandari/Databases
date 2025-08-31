spool WIFI-new-aggregation.log
-----------------For Field Categories Entries ------------

insert into field_categories (name,category,regular_expression_id,data_type,id,maskable_positions,common_category_id,is_maskable) values ('WIFI_ID','NEGATIVE_RULE_AGG_TYPE ACCUMULATION_FIELD MANUAL_ALARM ONDEMAND_OFFLINE_TEST STATS_RULE_AGG_TYPE PROFILE_AGG_TYPE CUSTOMER_ALERT_AGG_TYPE PROFILE_SPECIFIC FINGERPRINT_RULE_AGG_TYPE AUTO_THRESHOLD AGGREGATION_TYPE CUST_ALERT_PLACE_HOLDER','31','3','6014','','6014','') ;

-----------------For Aggregation Type --------------------


----------------------------------------------------- SQL Queries For WIFI_ID ----------------------------------------------------------
insert into aggregation_types(id,description,record_config_idS,duration_type_ids) values((select id from field_categories where name ='WIFI_ID'),'WIFI ID','','-1,-2,-3,-4,-5,901');
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, (select id from field_categories where name ='WIFI_ID'));
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority) values(agg_type_granularity_maps_seq.nextval,6014.0,0,1) ; 
insert into tags values(tags_seq.nextval,'WIFI ID','AGGREGATION_TYPE') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(6014, '4,6014,54');
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) values (AGGREGATION_TYPES_MAPS_SEQ.nextval,(select id from field_categories where name='WIFI_ID'), 0, 29, 3) ;
insert into xdr_query_hints(id, field_category_id, hint_value) values(xdr_query_hints_seq.nextval, (select id from field_categories where name='WIFI_ID'), '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */') ;

delete from reference_types_maps where aggregation_type=6014 ;
insert into reference_types_maps (id, reference_type, reference_value_category_id, reference_category_id, aggregation_type, service_number_type) values (reference_types_maps_seq.nextval, 1, 6014, 16, 6014, 3) ;


insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 1) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 2) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 3) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 4) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 5) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 6) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 7) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 8) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 9) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 10) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 11) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 12) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 13) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 14) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 15) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 16) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 17) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 18) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 19) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 20) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 21) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 25) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 26) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 36) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 39) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 40) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 46) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 48) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 49) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 53) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6014, 104) ;


update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'2,3,505',record_config_ids||'2,3,505'))  where id in (6014) ;

insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 505.0, 6014, '6') ;
--------In Relation with Subscriber ------------
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 3, 6014, '12') ;
------For Profile Flows
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 51, 6014, '1') ;
insert into field_record_config_maps (id, record_config_id, field_category_id, field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 2, 6014, '2') ;

-------counter entries-----


insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 10, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6014, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6014, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6014, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6014, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6014, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6014, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6014, 505, 3) ; 

----------------------------------------------------- SQL Queries For Subscriber UID ----------------------------------------------------------
insert into aggregation_types(id,description,record_config_idS,duration_type_ids) values((select id from field_categories where name ='Subscriber UID'),'Subscriber UID','','-1,-2,-3,-4,-5,901');
insert into agg_type_retention_maps(id, aggregation_type_id) values (agg_type_retention_maps_seq.nextval, (select id from field_categories where name ='Subscriber UID'));
insert into agg_type_granularity_maps(id, aggregation_type, granularity, priority) values(agg_type_granularity_maps_seq.nextval,6011.0,0,1) ; 
insert into tags values(tags_seq.nextval,'Subscriber UID','AGGREGATION_TYPE') ;
insert into SP_AGGREGATION_TYPE_MAPS(PARENT_AGGREGATION, CHILD_AGGREGATIONS) values(6011, '6011');
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) values (AGGREGATION_TYPES_MAPS_SEQ.nextval,(select id from field_categories where name='Subscriber UID'), 0, 29, 3) ;
insert into xdr_query_hints(id, field_category_id, hint_value) values(xdr_query_hints_seq.nextval, (select id from field_categories where name='Subscriber UID'), '/*+ use_hash(TEMP_TABLE), use_hash(XDR_TABLE) */') ;

delete from reference_types_maps where aggregation_type=6011 ;
insert into reference_types_maps (id, reference_type, reference_value_category_id, reference_category_id, aggregation_type) values (reference_types_maps_seq.nextval, 1, 6011, 6010, 6011) ;


insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 1) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 2) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 3) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 4) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 5) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 6) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 10) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 11) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 12) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 13) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 14) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 19) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 20) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 21) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 25) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 26) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 39) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 40) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 48) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 53) ;
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) values ( agg_type_pseudo_functions_seq.nextval, 6011, 104) ;

----------Counter entries for WIFI_ID to subscriber --------------
--
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6014, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 11, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 29, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 52, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6014, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6014, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6014, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6014, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6014, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6014, 3, 0) ; 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6014, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6014, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6014, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6014, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6014, 3, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6014, 3, 3) ; 

------------ Data Stream Entries ---------
 ---- Pseudo Functions For DataStream CDR

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'1',record_config_ids||',1'))  where id in (6011) ;
-- DML for record config Recharge Logs ************** 
 ---- Pseudo Functions For DataStream Recharge Logs

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'2',record_config_ids||',2'))  where id in (6011) ;

-- DML for record config LTE ************** 
 ---- Pseudo Functions For DataStream LTE

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'505',record_config_ids||',505'))  where id in (6011) ;

-- DML for record config GPRS ************** 
 ---- Pseudo Functions For DataStream GPRS

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'7',record_config_ids||',7'))  where id in (6011) ;

-- DML for record config IPDR ************** 
 ---- Pseudo Functions For DataStream IPDR

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'83',record_config_ids||',83'))  where id in (6011) ;

-- DML for record config Subscriber ************** 
 ---- Pseudo Functions For DataStream Subscriber

update aggregation_types set record_config_ids = (decode(length(record_config_ids),null,'3',record_config_ids||',3'))  where id in (6011) ;
----------------COUNTER ENTRIES FOR NEW AGGREGATION SUBSCRIBER UID (6011) -----------------
--- GPRS ------
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 10, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 7, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 7, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 7, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 7, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 7, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 7, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 7, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 7, 3) ; 

--- LTE ---

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 10, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 505, 3) ; 

---- IPDR -----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 2, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 83, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 83, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 83, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 83, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 83, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 83, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 83, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 83, 3) ; 

--- CDR ---

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 8, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 9, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 55, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 1, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 1, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 1, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 1, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 1, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 1, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 1, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 1, 3) ; 

--- Recharge ---

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 2, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 12, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 13, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 2, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 2, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 2, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 2, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 2, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 2, 0) ; 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 2, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 2, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 2, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 2, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 2, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 2, 3) ; 

--- subscriber ---

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 11, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 29, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 52, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 6011, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 6011, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 6011, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 3, 0) ; 
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 6011, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 6011, 3, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 3, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 6011, 3, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 6011, 3, 3) ;

---------- counter entries for aggregation id 14 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 2, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 14, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 14, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 14, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 14, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 14, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 14, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 14, 505, 3) ; 

---------- counter entries for aggregation id 7 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 3, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 7, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 7, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 7, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 7, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 7, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 7, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 7, 505, 3) ; 

---------- counter entries for aggregation id 3 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 10, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 3, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 3, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 3, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 3, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 3, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 3, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 3, 505, 3) ; 

--------- counter entries for aggregation id 4 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 10, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 4, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 4, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 4, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 4, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 4, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 4, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 4, 505, 3) ; 

--------- counter entries for aggregation id 54 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 2, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 54, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 54, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 54, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 54, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 54, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 54, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 54, 505, 3) ; 

--------- counter entries for aggregation id 200 ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 2, 1,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 1, 200, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 30, 13,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 13, 200, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 15, 7,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 7, 200, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 6, 6,'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 6, 200, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 4, 5, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 5, 200, 505, 3) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 200, 505, 0) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 7, 4, 'REGULAR') ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (1.0, 4, 200, 505, 3) ; 

----------------------------------------------- Counter Related Entries for RTF --------------------------------------------------------------------------
-----For RTF rules adding Subscriber UID as aggregation for GPRS stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 7, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 7, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 7, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 7, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 7, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 7, 1) ; 

-----For RTF rules adding Subscriber UID as aggregation for IPDR stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 83, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 83, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 83, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 83, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 83, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 83, 1) ; 

-----For RTF rules adding Subscriber UID as aggregation for CDR stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 1, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 1, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 1, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 1, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 1, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 1, 1) ; 

-----For RTF rules adding Subscriber UID as aggregation for RECHARGE stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 2, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 2, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 2, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 2, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 2, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 2, 1) ; 

-----For RTF rules adding Subscriber UID as aggregation for SUBSCRIBER stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 3, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 3, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 3, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 3, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 3, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 3, 1) ; 

------------------- Counter Related Entries for LTE Stream  ----------------------------------------
----For aggregation id 6011 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6011, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6011, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6011, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6011, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6011, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6011, 505, 1) ; 
----For aggregation id 6013 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6013, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6013, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6013, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6013, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6013, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6013, 505, 1) ; 
----For aggregation id 6014 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 6014, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 6014, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 6014, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 6014, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 6014, 505, 1) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 6014, 505, 1) ; 
----For aggregation id 14 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 14, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 30, 13,'REGULAR') ;

----For aggregation id 3 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 10, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 3, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 30, 13,'REGULAR') ;

----For aggregation id 4 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 10, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 4, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 30, 13,'REGULAR') ;

----For aggregation id 54 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 54, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 30, 13,'REGULAR') ;

----For aggregation id 7 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 3, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 7, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 30, 13,'REGULAR') ;

----For aggregation id 200 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 1, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 6, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 7, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 4, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 7, 4, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 5, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (20.0, 13, 200, 505, 1) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 30, 13,'REGULAR') ;

---------------- End of Online RTF ----------------

----------------------------------------------- Counter Related Entries for RTF Online ----------------------------------------------------------------------

-----For RTF Offline rules adding Subscriber UID as aggregation for GPRS stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 7, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 7, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 7, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 7, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 7, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 7, 2) ; 

-----For RTF Offline rules adding Subscriber UID as aggregation for IPDR stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 83, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 83, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 83, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 83, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 83, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 83, 2) ; 

-----For RTF Offline rules adding Subscriber UID as aggregation for CDR stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 1, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 1, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 1, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 1, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 1, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 1, 2) ; 

-----For RTF Offline rules adding Subscriber UID as aggregation for RECHARGE stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 2, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 2, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 2, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 2, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 2, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 2, 2) ; 

-----For RTF Offline rules adding Subscriber UID as aggregation for SUBSCRIBER stream ---------

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 3, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 3, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 3, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 3, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 3, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 3, 2) ; 

------------------- Counter Related Entries for LTE Stream  (OFFLINE RTF)----------------------------------------
----For aggregation id 6011 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6011, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6011, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6011, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6011, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6011, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6011, 505, 2) ; 

----For aggregation id 6013 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6013, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6013, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6013, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6013, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6013, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6013, 505, 2) ; 

----For aggregation id 6014 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 6014, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 6014, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 6014, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 6014, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 6014, 505, 2) ; 

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 6014, 505, 2) ; 

----For aggregation id 14 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 14, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 14, 505, 7, 4, 'REGULAR') ;

----For aggregation id 3 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 10, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 3, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 3, 505, 7, 4, 'REGULAR') ;

----For aggregation id 4 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 3, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 10, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 5, 6,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 4, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 4, 505, 7, 4, 'REGULAR') ;

----For aggregation id 54 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 54, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 54, 505, 7, 4, 'REGULAR') ;

----For aggregation id 7 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 2, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 3, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 7, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 7, 505, 7, 4, 'REGULAR') ;

----For aggregation id 200 ----

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 1, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 1, 1,'REGULAR') ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 2, 1,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 13, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 30, 13,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 7, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 15, 7,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 6, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 6, 6,'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 5, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 4, 5, 'REGULAR') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (22.0, 4, 200, 505, 2) ; 
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) values (counter_maps_seq.nextval, 200, 505, 7, 4, 'REGULAR') ;


----------For Stats Rules & profile manager flows------------------------
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) select counter_detail_id, counter_type_id, 6014, record_config_id, rule_mode from counter_manager_mappings where aggregation_type_id=2 and record_config_id not in (3,505) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (101, 11, 6014, 505, 0) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (102, 12, 6014, 505, 0) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (3, 8, 6014, 505, 0) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (3, 8, 6014, 505, 3) ;

insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) select counter_maps_seq.nextval, 6014, record_config_id, function_id, counter_type, category from counter_maps where aggregation_type=2 ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) select counter_maps_seq.nextval, 6014, 505, function_id, counter_type, category from counter_maps where counter_type in (12,11,8) and aggregation_type=2 and record_config_id=2 ;

----------For Stats Online Rules-----------------------------------------
-- Elements on WIFI Aggregation, LTE stream

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 0, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 1, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 2, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 3, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 31, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 32, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 505, 33, 15, 'STATISTICAL_ONLINE') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (2, 15, 6014, 505, 0) ;

insert into counter_maps(id, aggregation_type, record_config_id,function_id, counter_type, category) values(counter_maps_seq.nextval, 6014, 3, 27, 15, 'STATISTICAL_ONLINE');
insert into field_record_config_maps(id,field_category_id,record_config_id,field_association) values (FIELD_RECORD_CONFIG_MAPS_SEQ.nextval, 6014, 500, 500.12) ;
insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (2, 15, 6014, 3, 0) ;
-- Elements on Subscriber ID Aggregation, IPDR stream

insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 0, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 1, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 2, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 3, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 31, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 32, 15, 'STATISTICAL_ONLINE') ;
insert into counter_maps(id, aggregation_type, record_config_id, function_id, counter_type, category) values(counter_maps_seq.nextval, 16, 83, 33, 15, 'STATISTICAL_ONLINE') ;

insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode) values (2, 15, 16, 83, 0) ;


------------------------------------------------------------------------------------------------------------------------------------------------------------

DECLARE
	cursor cur_cm_maps is select distinct record_config_id from counter_manager_mappings ; 
	cm_map cur_cm_maps%ROWTYPE;
BEGIN
	open cur_cm_maps ;
	loop
		FETCH cur_cm_maps INTO cm_map ;
		EXIT WHEN cur_cm_maps%NOTFOUND ;

		insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode)
			values (3, 8, 6011, cm_map.record_config_id, 0) ;
		insert into counter_manager_mappings (counter_detail_id, counter_type_id, aggregation_type_id, record_config_id, rule_mode)
			values (3, 8, 6011, cm_map.record_config_id, 3) ;
	end loop ;
	COMMIT ;
	close cur_cm_maps ;
	EXCEPTION
    	WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
	COMMIT ;
END ;
/

insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) select counter_maps_seq.nextval, 6011, record_config_id, function_id, counter_type, category from counter_maps where aggregation_type=2 ;
insert into counter_maps (id, aggregation_type, record_config_id, function_id, counter_type, category) select counter_maps_seq.nextval, 6011, record_config_id, function_id, counter_type, category from counter_maps where aggregation_type=6014 and record_config_id=505 ;

insert into FP_PROFILES_DATASET_MAP(ENTITY_ID,RUN_IDENTIFIER,TNAME) select 6014, RUN_IDENTIFIER, TNAME from FP_PROFILES_DATASET_MAP where ENTITY_ID=2;

commit;
spool off;

