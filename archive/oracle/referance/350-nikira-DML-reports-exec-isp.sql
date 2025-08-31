spool nikira-DML-reports-exec-isp.log
set feedback off ;
set serveroutput off ;
--ISP Cumulative HighDuration
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'ISPCumulativeHighDuration', 'ISP Cumulative High Duration Report', 'ISP', 'Shows the details of IPDR session summary having total duration beyond given duration limit and that occured in given period of time', 0);

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Duration','Duration',5,NULL,1);

-- ISP Qos Violation
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'ISPQoSViolation', 'ISP QoS Violation Report', 'ISP', 'Shows the details of IPDR session summary having lesser ISP QoS value than the subscriber actually holds', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
-- ISP Long Duration
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'ISPLongSessions', 'ISP Long Sessions Report', 'ISP', 'Shows subscriber  and session details when session is greater than given session', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory)      values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Duration','Duration',5,NULL,1);

-- ISP Repeated Short Sessions
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'ISPRepeatedShortSession', 'ISP Repeated Short Session Report', 'ISP', 'This report gives the details of the repeated short GPRS Sessions', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values (REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'No Of Sessions','NoOfSessions',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values (REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Session Duration','SessionDuration',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory)      values (REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'Total Duration','Duration',5,NULL,1);
-- ISP Multiple Simultaneous Sessions
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'ISPMultipleSimultaneousSessions', 'ISP Multiple Simultaneous Sessions Report', 'ISP', 'Shows session and subscriber details for simultaneous sessions', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

commit ;

