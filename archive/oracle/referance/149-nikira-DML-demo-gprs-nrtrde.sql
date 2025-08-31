spool nikira-DML-demo-gprs-nrtrde.log
set feedback off ;
set serveroutput off ;

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 3);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 4);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 5);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 12);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 13);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 14);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 200, id from pseudo_functions where id = 50);

commit ;

