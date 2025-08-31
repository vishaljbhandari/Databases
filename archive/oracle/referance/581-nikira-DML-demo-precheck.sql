spool nikira-DML-demo-precheck.log
set feedback off ;
set serveroutput off ;

insert into agg_type_pseudo_functions(id, aggregation_type_id, pseudo_function_id) 
	(select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 26) ;
insert into agg_type_pseudo_functions(id, aggregation_type_id, pseudo_function_id) 
	(select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 26) ;
insert into agg_type_pseudo_functions(id, aggregation_type_id, pseudo_function_id) 
	(select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 26) ;

insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(10, 2, 24, 1) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values(21, 2, 24, 3) ;

commit ;
