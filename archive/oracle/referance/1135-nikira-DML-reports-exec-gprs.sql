spool nikira-DML-reports-exec-gprs.log
set feedback off ;
set serveroutput off ;

-- Repeated Short Session
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'GPRSRepeatedShortSessions','GPRS Repeated Short Session Report','Summary','This report gives the details of the subscriber who has initiate
d short GPRS session',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Total Duration','Duration',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Session Duration','SessionDuration',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 5,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'Number Of Sessions','NoOfSessions',1,NULL,1,13);

commit ;

