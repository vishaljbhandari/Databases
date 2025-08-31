spool nikira-DML-demo-nrtrde.log
set feedback off ;
set serveroutput off ;
---ranger-new-exec-demo.sql.parse.in


insert into reference_types(id, description, record_config_id) values(5, 'VPMN', null) ;
insert into reference_types_maps (id, aggregation_type, reference_type, reference_value_category_id, reference_category_id) values (reference_types_maps_seq.nextval, 200, 5, 200, 2072) ;


--Entries for alarm of reference_type=vpmn and status=FRD
insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 2, id , 5 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ; 

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 5 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 8, id , 5 from analyst_actions where action_script = 'counter_resetter' and name = 'Clear Rule History') ;

insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) (select alarm_status_action_maps_seq.nextval, 4, id , 5 from analyst_actions where action_script = 'change_thresholds_action' and name = 'Reset Threshold Settings') ;

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 6);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 1);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 2);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 21);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 10);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 11);


commit ;

