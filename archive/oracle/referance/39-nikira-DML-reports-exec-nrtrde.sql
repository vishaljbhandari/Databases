spool nikira-DML-reports-exec-nrtrde.log
set feedback off ;
set serveroutput off ;
-- High Usage Per Network Per VPMN
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighUsagePerNetworkPerVPMN','High Usage Per Network Per VPMN Report','Summary','This report gives the details of high usage per VPMN for a given network',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1,NULL);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'EndDate','EndDate',4,NULL,1,NULL);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Total Value','TotalValue',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Total Duration','TotalDuration',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'Total Count','TotalCount',1,NULL,1,13);

-- PRS Destinations Called Per VPMN
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PRSDestinationsCalledPerVPMN','PRS Destinations Called Per VPMN Report','Summary','This report gives the details of the PRS Destinations Thathave been called for a particular VPMN',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Total Value','total_value',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Total Duration','total_duration',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'Total Count','total_count',1,NULL,1,13);

-- VPMN Traffic Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'VPMNTraffic','VPMN Traffic Report','Summary','This report gives the details of the VPMN Traffic in the given date range',0) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);

commit ;

