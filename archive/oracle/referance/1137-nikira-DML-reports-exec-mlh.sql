spool nikira-DML-reports-exec-mlh.log
set feedback off ;
set serveroutput off ;
-- Fraud Distribution Report (MLH Report)
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudDistributionReport','Fraud Distribution Report (MLH Report)','Summary','This report gives the details of fraud losses happend wit
h all hierarchical accounts in the network',0) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id
,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
-- Fraud Activity Report (MLH Report)
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'Fraudulent
ActivityReport','Fraudulent Activity Report (MLH Report)','Summary','This report gives details of entire fraudulent activity for the given hierarchical account',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Hierarchy Account Name','ROOT_ACCOUNT_N
AME',3,NULL,1,8);

commit ;

