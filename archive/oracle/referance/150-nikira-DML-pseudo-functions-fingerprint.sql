spool nikira-DML-pseudo-functions-fingerprint.log
set feedback off ;
set serveroutput off ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (30, 'Profile Cumulative Value', 'FP_ELEMENT', 24, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (31, 'Profile Cumulative Duration', 'FP_ELEMENT', 24, 12) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (32, 'Profile Cumulative Upload Data Volume', 'FP_ELEMENT', 24, 50) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (33, 'Profile Cumulative Download Data Volume', 'FP_ELEMENT', 24, 49) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (34, 'Profile Cumulative Data Volume', 'FP_ELEMENT', 24, 51) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (35, 'Profile Count Of Records', 'FP_ELEMENT', 25, 1) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (37,  'Fingerprint Rule', 'FINGERPRINT_RULE', 26, 0) ;

commit ;


