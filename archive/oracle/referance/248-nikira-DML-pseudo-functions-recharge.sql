spool nikira-DML-pseudo-functions-recharge.log
set feedback off ;
set serveroutput off ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (19, 'Odd Value topup', 'TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 12, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (20, 'Suspicious Recharge', 'TEMPLATE RULE', 13, 17) ;

commit ;

