spool nikira-DML-demo-recharge.log
set feedback off ;
set serveroutput off ;


--ranger-new-exec-demo.sql.parse.in


insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 19);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 7, id from pseudo_functions where id = 20);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 19);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 3, id from pseudo_functions where id = 20);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 19);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 4, id from pseudo_functions where id = 20);

insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 19);
insert into agg_type_pseudo_functions (id, aggregation_type_id, pseudo_function_id) (select agg_type_pseudo_functions_seq.nextval, 2, id from pseudo_functions where id = 20);


commit ;

