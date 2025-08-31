spool nikira-DML-reports-exec-recharge.log;
set feedback off;
set serveroutput off ;

-- Prepaid High Frequency Recharge

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidHighFrequencyRecharge','Prepaid High Frequency Recharge Report','Prepaid','This report gives details of high frequency recharge that have been successful',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 4, 'Number of Recharges', 'RECHARGE_LIMIT', 1, NULL, 1, 13);

-- Prepaid PIN Reuse Report                                                                                                                                  
insert into reports (id,name,display_name,category,description,is_long_running) values(reports_seq.nextval,'PrepaidPINReuse','Prepaid PIN Reuse Report','Prepaid', 'This report gives details of PIN numbers  which are reused multiple times',0);                                                                        
                                                                                                                                                             
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);                                                                                          
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);                                                                                      
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

commit ;

