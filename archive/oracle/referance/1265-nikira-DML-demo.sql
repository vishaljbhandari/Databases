spool nikira-DML-demo.log
set feedback off ;
set serveroutput off ;
-- nikira-DML-demo.sql  nikira-DML-demo-distance_times.sql.parse.in  nikira-DML-demo-holiday-lists.sql.parse.in  nikira-DML-demo-nrtrde.sql

---***** Entries for Calendar table *****
delete from fms_calendars ;

insert into fms_calendars values (1,'Gregorian') ;
insert into fms_calendars values (2,'Islamic') ;
insert into fms_calendars values (3,'Jalaali') ;

delete aggregation_types_maps where source_aggregation not in (54, 225);

insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 2, 0, 29, 3) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 3, 0, null, null) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 4, 0, 29, 3) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 7, 0, 203, 4) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 14, 0, null,null) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 16, 2, 29, 3) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 200, 0, null, null) ;
insert into aggregation_types_maps (id, source_aggregation, dest_aggregation, field_category_id, group_record_config_id) VALUES (AGGREGATION_TYPES_MAPS_SEQ.nextval, 1, 0, null, null) ;


delete from reference_types ;

insert into reference_types(id, description, record_config_id) values(1, 'Subscriber', 3) ;
insert into reference_types(id, description, record_config_id) values(2, 'IMEI', null) ;
insert into reference_types(id, description, record_config_id) values(3, 'Account', 4) ;
insert into reference_types(id, description, record_config_id) values(4, 'Cell site', null) ;

delete reference_types_maps ;

insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id, service_number_type) values (reference_types_maps_seq.nextval, 2, 1, 2, 16, 1) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 3, 2, 3, 0) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_catEgory_id, service_number_type) values (reference_types_maps_seq.nextval, 4, 1, 2, 16, 1) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 7, 3, 7, 24) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 14, 4, 14, 45) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id, service_number_type) values (reference_types_maps_seq.nextval, 16, 1, 2, 212, 1) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id, service_number_type) values (reference_types_maps_seq.nextval, 54, 1, 2, 16, 1) ;


delete from alarm_status_action_maps ;

--Entries for alarm with reference_type=subscriber and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(1, 2, 23, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(3, 2, 26, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(7, 2, 31, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(8, 2, 32, 1) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 1) ;



--Entries for alarm of reference_type=account and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(12, 2, 23, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(14, 2, 26, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(18, 2, 31, 3) ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(19, 2, 32, 3) ;

--Entries for alarm of reference_type=imei and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 2) ;

--Entries for alarm of reference_type=cell_site and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 4) ;




----*********Insert counter clear action for all reference types for NFR   ***----
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 1 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 2 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 3 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 4 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
---***************************************************************************************

----*********Insert counter clear action for all reference types for Delete   ***----
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 1 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 2 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 3 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 4 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;

--Clear rule history and Move to profile match list for reference type=3 and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(alarm_status_action_maps_seq.nextval, 2, 34, 3) ;

----*********Insert Reset Threshold Settings action for all reference types for NFR   ***----
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 1 from analyst_actions where action_script = 'change_thresholds_action' and name = 'Reset Threshold Settings') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 2 from analyst_actions where action_script = 'change_thresholds_action' and name = 'Reset Threshold Settings') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 3 from analyst_actions where action_script = 'change_thresholds_action' and name = 'Reset Threshold Settings') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 4 from analyst_actions where action_script = 'change_thresholds_action' and name = 'Reset Threshold Settings') ;

----*********Insert Reset Threshold Settings action for all reference types for NFR/FRD   ***----
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 1 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 2 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 3 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 4 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 1 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 2 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 3 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 4 from analyst_actions where action_script = 'move_to_hotlist_groups' and name = 'Move to Hotlist group(s)') ;



-- Aggregation Type Pseudo Functions --
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 11);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 21);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 25);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 39);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 40);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 48);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 53);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 104);


insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 11);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 14, id from pseudo_functions where id = 21);


insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 7);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 9);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 11);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 15);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 21);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 36);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 49);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 39);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 40);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 21);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 16);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 17);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 8);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 11);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 7);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 9);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 15);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 25);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 46);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 49);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 39);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 40);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 48);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 36);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 21);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 16);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 17);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 8);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 11);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 9);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 15);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 7);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 25);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 46);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 49);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 39);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 40);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 48);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 53);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 104);

commit ;

