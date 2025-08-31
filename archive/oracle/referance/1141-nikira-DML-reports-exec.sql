spool nikira-DML-reports-exec.log
set feedback off ;
set serveroutput off ;

delete from report_parameters ;
delete from reports ;
delete from report_data_types ;

insert into report_data_types(id, data_type) values(-1, 'Invalid') ;
insert into report_data_types(id, data_type) values(1, 'Integer') ;
insert into report_data_types(id, data_type) values(2, 'Double') ;
insert into report_data_types(id, data_type) values(3, 'String') ;
insert into report_data_types(id, data_type) values(4, 'Date') ;
insert into report_data_types(id, data_type) values(5, 'Duration') ;
insert into report_data_types(id, data_type) values(6, 'Multi Valued') ;
insert into report_data_types(id, data_type) values(7, 'DurationInMinutes') ;

insert into configurations values (configurations_seq.nextval, 'REPORTS_WEEK_RETENTION', '5', 1) ;

--Reports Entries--


-- High Usage Cumulative
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighUsageCumulative','High Usage Cumulative Report', 'Summary', 'This report shows the high usage of subscribers by duration in min',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Local Usage','local_usage',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Long Distance Usage','long_distance_usage',5,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'International Usage','international_usage',5,NULL,1);

-- High Value Cumulative
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighValueCumulative','High Value Cumulative Report', 'Summary', 'This report shows the high usage of subscribers by value',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id,units_to_display) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Local Value','local_value',1,NULL,1,13,'INR');
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id,units_to_display) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Long Distance Value','long_distance_value',1,NULL,1,13,'INR');
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id,units_to_display) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,6,'International Value','international_value',1,NULL,1,13,'INR');

-- IMSI Low Duration Usage
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'IMSILowDurationUsage','IMSI Low Duration Usage Report', 'Summary', 'This report shows the low usage of subscribers by duration in min',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Minimum Call Duration','MinimumCallDuration',5,NULL,1);
 

-- IMSI Non Usage
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'IMSINonUsage','IMSI Non Usage Report', 'Summary','This report shows the details of the subscribers who have not used the connection within the given week',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Outgoing Incoming Ratio
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'OutgoingVsIncomingRatio','Outgoing Vs Incoming Ratio Report', 'Summary','This report shows the comparison of the outgoing vs incoming calls of subscribers',0) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 4,'Ratio','Ratio',2,NULL,1,12);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 5,'Type of Call','TypeOfCall', 3 , 90, 1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 6,'Minimum Outgoing Call Count','MinimumOutgoingCallCount',1,NULL,1,13);

-- Analyst Performance
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AnalystPerformanceByGroup','Analyst Performance Report (By Group)', 'Alarms','This report shows details of the analyst investigations for the given Group',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Analyst Role','AnalystGroup',6, 95 ,1);

-- Rule List
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'RuleList','Rule List Report', 'Rules','This report shows all the active rules,threshold value, exceptions, modifiers, filters, hotlists for them for the given network',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);

-- Alarm History
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AlarmHistory', 'Alarm History Report', 'Alarms', 'This report gives the alarm history for a particular aggregation type', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 2,'Reference Type','Reftype',1,42,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval, reports_seq.currval, 3,'Reference Value','Refvalue',3,NULL,1,19);

-- Alarms Statistics Bar Chart by status
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AlarmStatisticsBarChartByStatus', 'Alarm Statistics Bar Chart Report (By Status)', 'Alarms', 'This report gives the alarm-status for particular network in bar graph', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Alarms Statistics Pie Chart by status
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AlarmStatisticsPieChartByStatus', 'Alarm Statistics Pie Chart Report (By Status)', 'Alarms', 'This report gives the alarm-status for particular network in pie graph', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Groupwise Fraud Alarms Statistics Bar
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudAlarmStatisticsBarChartByGroup', 'Fraud Alarm Statistics Bar Chart Report (By Group)', 'Alarms', 'This report gives the alarm statistics in bar graph groupwise', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Subscriber Group','SubscriberGroup',6,27,1);

-- Groupwise Fraud Alarm Statistics Pie
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudAlarmStatisticsPieChartByGroup', 'Fraud Alarm Statistics Pie Chart Report (By Group)', 'Alarms', 'This report gives the alarm statistics in pie graph groupwise', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Subscriber Group','SubscriberGroup',6,27,1);

-- Rulewise Fraud AlarmStatistics Pie
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudAlarmStatisticsPieChartByRule', 'Fraud Alarm Statistics Pie Chart Report (By Rule)', 'Alarms', 'This report gives the alarm statistics in pie graph rulewise', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Rulewise FraudAlarm Statistics Bar
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudAlarmStatisticsBarChartByRule', 'Fraud Alarm Statistics Bar Chart Report (By Rule)', 'Alarms', 'This report gives the alarm statistics in bar graph rulewise', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- Inroamer High SDR Value Per Call Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'InroamerHighSDRValuePerCall', 'Inroamer High SDR Value Per Call Report', 'Summary', 'This report shows per call details of inroamers', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Call Count','ThresholdCallCount',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory, regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Band','Band',1,NULL,1, 13);

-- Inroamer High SDR Value Cumulative
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'InRoamerHighSDRValueCumulative', 'Inroamer High SDR Value Cumulative Report', 'Summary', 'This report shows cumulative call details of inroamers', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id,units_to_display) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Value','ThresholdValue',2,NULL,1,12,'INR');

-- Outroamer High SDR Value Per Call Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'OutroamerHighSDRValuePerCall', 'Outroamer High Value Per Call Report', 'Summary', 'This report shows per call details of outroamers', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Call Count','ThresholdCallCount',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values (REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Band','Band',1,NULL,1, 13);

-- Outroamer High SDR Value Cumulative
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'OutRoamerHighSDRUsageCumulative', 'Outroamer High Value Cumulative Report', 'Summary', 'This report shows cumulative call details of outroamers', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id,units_to_display)
values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Value','Threshold',1,NULL,1,13,'INR');


-- International Vs National Outgoing Ratio Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'InternationalVsNationalOutgoingRatio', 'International Vs National Outgoing Ratio Report', 'Summary', 'This report gives the Details of International Vs National outgoing calls ratio', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Ratio','Ratio',2,NULL,1,12);





-- OffPeak High Usage Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'OffPeakHighUsage', 'OffPeak High Usage Report', 'Summary', 'This report gives the details of Offpeak high usage', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Duration','Duration',5,NULL,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Call Type','CallType',3,90 ,1 );
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory)values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'Record	Type','RecordType',3, 91, 1);

-- High Cost Summary Report
--insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighCostReport','High Cost Summary Report','Summary','This report shows all the called numbers, their call_count and total call duration by every phone_number',0) ;

-- Switch Trunk Summary Report
--insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'SwitchTrunkReport','Switch Trunk Summary Report','Summary','This report shows all the ports, their call_count and total call duration based on switch and trunk id',0) ;

-- Fraud Losses Per Month Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudLossesPerMonth','Fraud Losses Per Month Report','Summary','This report shows the total call value and duration for the given fraud type over a period of 1 month',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(report_parameters_seq.nextval,reports_seq.currval,4,'Analyst','ANALYST',3,107,1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(report_parameters_seq.nextval,reports_seq.currval,5,'Fraud Type','FRAUD_TYPE',3,83,1);

-- High Risk Destinations CellSite
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighRiskDestinationsCellSite','High Risks Destinations CellSite Report','Summary','This report gives the details of the CellSites that are high risk destinations',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Alert Count','ALERT_COUNT',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Number Of CellSites','NO_OF_CELLSITES',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Start Date','StartDate',4,NULL,1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'End Date','EndDate',4,NULL,1) ;

-- High Risk Destinations Country
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'HighRiskDestinationsCountry','High Risk Destination Country Report','Summary','This report gives the details of the Country that are high risk destinations',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Alert Count','ALERT_COUNT',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Number Of Countries','NO_OF_COUNTRIES',1,NULL,1,13);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Start Date','StartDate',4,NULL,1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,5,'End Date','EndDate',4,NULL,1) ;
-- Alarm Escalation
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AlarmEscalation','Alarm Escalation Report','Summary','This Report gives the details of the alarms in NEW, AVL and ALT status till the given lookback period',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Look Back','NumberOfDays',1,NULL,1,13);




-- Alert Summary For A Group
insert into reports (id, name, display_name, category,description, is_long_running) values (reports_seq.nextval, 'AlertSummaryForAGroupForSubscriber', 'Alert summary Report For A Subscriber Group', 'Alerts', 'This report shows the  count of alerts for the given subscriber group', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values (REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Group','Group',3,27,1);

-- Analyst Performance By User
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AnalystPerformanceByUser','Analyst Performance Report (By User)', 'Alarms','This report shows details of the  analyst investigations for the given user',1) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) 	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'Analyst Name','AnalystName',6, 23,1);

-- Box Splitting Report 
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'BoxSplitting' ,'Box Splitting Report','Summary', 'This report keeps track of all IMSI, IMEI that have been sold as a box, along with validity period of that box and gives the details of the box that are used with different IMSI/IMEI',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory, regexp_id)	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 2, 'Mismatch Count', 'MISMATCH_COUNT', 1, NULL, 1, 13);

-- Case Details Report 
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval, 'CaseDetails', 'Case Details Report ', 'Alarms', 'Summary of cases sorted on case status', 0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);

-- Case User Detail

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'CaseUserDetails','Case User Details Report ','Alarms','Summary of Open Cases sorted on user',1) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);

-- Fraud Loss Avoidance Report 

insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'FraudLossAvoidance','Fraud Loss Avoidance Report','Summary','Fraud loss avoidance report gives a measure of the amount of fraud that is prevented with the help of ROC Fraud Management and the fraud analysts in monitory terms',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

-- IMSI IMEI Mismatch
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'IMSIIMEIMismatch','IMSI IMEI Mismatch Report','Summary', 'This report gives the details of all postpaid subscribers for whom IMEI- IMSI is not matched',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1);
insert into
report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory, regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval, 2, 'Mismatch Count', 'MISMATCH_COUNT', 1, NULL, 1, 13);



-- RSAGE Log report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'AutogroupingExecution','Autogrouping Execution Report', 'Summary','This report gives details of Autogrouping run for Susbcirber or Account and their group wise distribution for every run',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Record Type','RECORD_TYPE',1,85,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory,regexp_id) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Number of Runs','RUN_COUNT',1,NULL,1,13);


--Rulewise Alarm Statistics Report
insert into reports (id,name,display_name,category,description,is_long_running) values (reports_seq.nextval,'RulewiseAlarmStatistics','Rulewise Alarm Statistics Report','Rules','Shows rule wise alarm statistics. ',0) ;

insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,1,'Network','NETWORK_ID',6,10,1); 
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,2,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'End Date','EndDate',4,NULL,1);

----Alarm Details report--

insert into reports (id,name,display_name,category,is_long_running) values (reports_seq.nextval,'AlarmDetails','Alarm Details Report','Record View',0) ;

insert into record_view_configs_reports(record_view_config_id,report_id) values(10, reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(16 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(17 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(18 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(26 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(27 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(96 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(116 ,reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(50, reports_seq.currval) ;

insert into reports (id,name,display_name,category,is_long_running) values (reports_seq.nextval,'ArchivedAlarmDetails','Archived Alarm Details Report','Record View',0) ;
insert into record_view_configs_reports(record_view_config_id,report_id) values(19, reports_seq.currval) ;
insert into record_view_configs_reports(record_view_config_id,report_id) (select 50, id from reports where name='AlarmDetails') ;

---- Groupwise Rule Summary report --

insert into reports (id, name, display_name, description, category, is_long_running)
    values  (reports_seq.nextval,'GroupwiseRuleSummary','Groupwise Rule Summary Report',
	            'This report gives groupwise summary of rules configured in system', 'Summary', 0) ;
insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
	    values (report_parameters_seq.nextval, reports_seq.currval, 1, 'Network', 'NETWORK_ID', 6, 10, 1) ;

---- Teamwise Alarm Status Report --
insert into reports(id, name, display_name, description, category, is_long_running)
    values(reports_seq.nextval,'AlarmStatisticsBarChartByTeam','Alarm Statistics Bar Chart Report (By Team)',
        'This report gives teamwise alarm statistics by status for particular network in bar graph', 'Alarms', 0) ;

insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
    values (report_parameters_seq.nextval, reports_seq.currval, 1, 'Network', 'NETWORK_ID', 6, 10, 1) ;
insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
    values (report_parameters_seq.nextval, reports_seq.currval, 2, 'Team', 'TEAM_ID', 6, 519, 1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) 
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) 
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'End Date','EndDate',4,NULL,1);

insert into reports(id, name, display_name, description, category, is_long_running)
    values(reports_seq.nextval,'AlarmStatisticsPieChartByTeam','Alarm Statistics Pie Chart Report (By Team)',
        'This report gives teamwise alarm statistics by status for particular network in pie graph', 'Alarms', 0) ;

insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
    values (report_parameters_seq.nextval, reports_seq.currval, 1, 'Network', 'NETWORK_ID', 6, 10, 1) ;
insert into report_parameters (id, report_id, position, name, report_parameter_name, report_data_type_id, translation_index_id, is_mandatory)
    values (report_parameters_seq.nextval, reports_seq.currval, 2, 'Team', 'TEAM_ID', 6, 519, 1) ;
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) 
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,3,'Start Date','StartDate',4,NULL,1);
insert into report_parameters(id,report_id,position,name,report_parameter_name,report_data_type_id,translation_index_id,is_mandatory) 
	values(REPORT_PARAMETERS_SEQ.nextval,reports_seq.currval,4,'End Date','EndDate',4,NULL,1);
		
commit ;

