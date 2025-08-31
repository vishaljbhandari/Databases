spool nikira-DML-demo-service_number_types.log
set feedback off ;
set serveroutput off ;


--ranger-new-exec-demo.sql.parse.in

---***** Entries for Service table**********
delete from SERVICE_NUMBER_TYPES ;

insert into SERVICE_NUMBER_TYPES(id,description, record_configs, primary_aggregation_type) values (0, 'NA', '', 0);
insert into SERVICE_NUMBER_TYPES(id,description, record_configs, primary_aggregation_type) values (1,'MOBILE', '1,7,2', 2);
insert into SERVICE_NUMBER_TYPES(id,description, record_configs, primary_aggregation_type) values (2, 'LTE', '2,505', 6013);
insert into SERVICE_NUMBER_TYPES(id,description, record_configs, primary_aggregation_type) values (3, 'WIFI', '2,505', 6014);

commit ;

