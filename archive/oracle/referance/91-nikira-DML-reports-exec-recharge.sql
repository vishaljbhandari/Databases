spool nikira-DML-reports-exec-recharge.log;
set feedback off;
set serveroutput off ;
-- Prepaid High Balance Report 
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidHighBalance','Prepaid High Balance Report','Prepaid', 'This report gives details of prepaid subscriber with balance above  balance limit', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 2, 'Current Balance', 'BalanceLimit', 2, NULL, 1, 12 );

--  Prepaid High Frequency Failed Recharge

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidHighFrequencyFailedRecharge','Prepaid High Frequency Failed Recharge Report','Prepaid','This report gives details of high frequency failed  recharge',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 4, 'Number of Failed Recharges', 'FAILED_RECHARGE_LIMIT', 1, NULL, 1, 13);

-- Prepaid High Frequency Recharge

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidHighFrequencyRecharge','Prepaid High Frequency Recharge Report','Prepaid','This report gives details of high frequency recharge that have been successful',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 4, 'Number of Recharges', 'RECHARGE_LIMIT', 1, NULL, 1, 13);

-- Prepaid Low Balance Report 
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidLowBalance','Prepaid Low Balance Report','Prepaid', 'This report gives details of prepaid subscriber with balance less than balance limit',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id ) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 2, 'Current Balance', 'BalanceLimit', 2, NULL, 1, 12);

-- Prepaid PIN Reuse Report 
insert into reports (id,name,display_name,category,description,is_long_running) values(reports_seq.nextval,'PrepaidPINReuse','Prepaid PIN Reuse Report','Prepaid', 'This report gives details of PIN numbers  which are reused multiple times',-1);

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Prepaid Voucher Expiry 
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'PrepaidVoucherExpiry','Prepaid Voucher Expiry Report','Summary', 'This report gives the details of those prepaid subscribers who have managed to make calls even after the voucher has expired',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

commit ;

