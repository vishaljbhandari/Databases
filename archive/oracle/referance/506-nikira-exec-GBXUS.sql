set feedback off
spool nikira-exec-GBXUS.log

delete from alarm_status_action_maps ;
delete from reference_types_maps ;
delete from reference_types ;

update networks set description = 'Global Crossing' ; 

update configurations set value = value || ',highcostsummary.sh, switchtrunksummary.sh' where config_key like 'SUMMARY_SCRIPTS';

------------------ Installation Type ---------------------------
delete from holiday_lists;
insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'04-JULY-2000','Independence day');
insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'25-DEC-2000','Christmus');

delete distance_times;

delete from service ;

insert into service(id, description) values(1 , 'Incoming') ;
insert into service(id, description) values(2 , 'Local') ;
insert into service(id, description) values(4 , 'Long Distance') ;
insert into service(id, description) values(8 , 'International') ;
insert into service(id, description) values(16 , 'Trunk') ;
insert into service(id, description) values(32 , 'National Roaming') ;
insert into service(id, description) values(64 , 'International Roaming') ;

---***** Entries for Calendar table *****
delete from calendar ;

insert into calendar values (1,'Gregorian') ;
insert into calendar values (2,'Islamic') ;

delete aggregation_types_map ;

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 2,  0, 16, 1, '6.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 16, 2, 16, 1, '6.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 3,  0, 0, 1, '6.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 4,  0, 16, 1, '6.22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 14, 0, 45, 1, ''	 , 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval,  7, 0, 24, 1, '6.5.20', 4) ;

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1000, 0, 1005, 1, '4.22', null) ; 
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1001, 0, 1006, 1, '3.22', null) ; 
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1002, 0, 1007, 1, '1535.22', 3) ; 
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1003, 0, 0, 1, '', null) ; 
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 1004, 0, 0, 1, '', null) ; 

insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 2,  0, 16, 3, '22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 16, 2, 16, 3, '22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 3,  0, 0, 3, '22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 4,  0, 16, 3, '22', 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval, 14, 0, 45, 3, ''	 , 3) ;
insert into aggregation_types_map (id, source_aggregation, dest_aggregation, reference_category_id, datastream_record_config_id, group_field_association, group_record_config_id) VALUES (aggre_types_map_seq.nextval,  7, 0, 24, 3, '5.20', 4) ;

------- Reference Type Entries --------------
insert into reference_types(id, description, record_config_id) values(1, 'Phone Number', 3) ;
insert into reference_types(id, description, record_config_id) values(2, 'GBX Account Number', null) ;
insert into reference_types(id, description, record_config_id) values(3, 'Calling Card Number', null) ;

------- Reference Type Map Entries -----------
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 2, 1, 2 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1000, 1, 1000 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1001, 1, 1001 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1002, 1, 1002 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1003, 3, 1003 ) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id)
        values (reference_types_maps_seq.nextval, 1004, 2, 1004 ) ;

--------- Reference Type -- Billing Number --------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(1, 2, 24, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(2, 2, 25, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(3, 2, 26, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(4, 2, 27, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(5, 2, 28, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(6, 2, 30, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(7, 2, 31, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(8, 2, 33, 1) ;

--------- Reference Type -- GBX Account Number ---------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(9,  2, 24, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(10, 2, 25, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(11, 2, 26, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(12, 2, 27, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(13, 2, 28, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(14, 2, 30, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(15, 2, 31, 2) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(16, 2, 33, 2) ;

--------- Reference Type -- Calling Card Number ---------
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(17, 2, 24, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(18, 2, 25, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(19, 2, 26, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(20, 2, 27, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(21, 2, 28, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(22, 2, 30, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(23, 2, 31, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(24, 2, 33, 3) ;

----*********Insert counter clear action for all reference types for NFR   ***----
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(25, 4, 33, 1) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(26, 4, 33, 2) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(27, 4, 33, 3) ;

--Tasks for Billing Summary info
insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Active Alarms'), '/record_view/list/28') ;
insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Open Alarms'), '/record_view/list/28') ;
insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Assigned Alarms'), '/record_view/list/28') ;

insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Active Alarms'), '/record_view/list/29') ;
insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Open Alarms'), '/record_view/list/29') ;
insert into task_additional_actions values ( task_additional_actions_seq.nextval, GetTaskID('Assigned Alarms'), '/record_view/list/29') ;

-- Alarm Details Tab for Billing Number summary
insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1537) ;
insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1539) ;
insert into alarm_details_tab_configs values (alarm_details_tab_configs_seq.nextval, 1540) ;

commit;
quit;
