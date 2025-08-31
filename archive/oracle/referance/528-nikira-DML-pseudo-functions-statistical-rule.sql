spool nikira-DML-pseudo-functions-statistical-rule.log
set serveroutput off ;
set feedback off ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) Values (45,  'Statistical Rule', 'STATISTICAL_RULE', 27, 0) ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (47, 'Distinct Phone Number', 'PROFILE_FIELD', 3, 2) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (48, 'Distinct IMEI', 'PROFILE_FIELD TEMPLATE RULE ONDEMAND_OFFLINE_TEST', 3, 3) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select id, 1 from pseudo_functions where id = 47)  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select 48, id from record_configs where id in (1,7))  ;

insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (50, 'Average Value', 'PROFILE_FIELD', 31, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (51, 'Minimum Value', 'PROFILE_FIELD', 32, 17) ;
insert into pseudo_functions (id, name, category, accumulation_function_id, accumulation_field_id) values (52, 'Maximum Value', 'PROFILE_FIELD', 33, 17) ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select 50, id from record_configs where id in (1,7))  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select 51, id from record_configs where id in (1,7))  ;
insert into pseudo_functns_record_configs (pseudo_function_id, record_config_id) (select 52, id from record_configs where id in (1,7))  ;

insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 45) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 47) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 48) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 50) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 51) ;
insert into components_pseudo_functions (pseudo_function_id, component_id) (select id, 1 from pseudo_functions where id = 52) ;

commit ;

