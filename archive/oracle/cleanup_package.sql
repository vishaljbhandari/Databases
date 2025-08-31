--Generated from ./cleanup_package.sql.parse.in by setup.sh at Mon May 4 07:10:50 2015
--/**********************************************************************************
-- *	Copyright (c) Subex Systems Limited 2007. All rights reserved.	         	*
-- *	The copyright to the computer program(s) herein is the property of Subex 	*
-- *	Azure Limited. The program(s) may be used and/or copied with the written 	*
-- *	permission from Subex Systems Limited or in accordance with the terms and	*
-- *	conditions stipulated in the agreement/contract under which the program(s)	*
-- *	have been supplied.                                                        	*
-- **********************************************************************************/
SPOOL cleanup_package.log
set serveroutput off ;


CREATE OR REPLACE PACKAGE Cleanup
AS
	Cleanup_Option					varchar2(10) ;
	Run_Id						number(15);
	Test_Run		          		varchar2(2) ;
	Last_Cleanup_Run_Date			date ;
    Number_Of_Days					number(10,0) ;
	Bulk_Fetch_Array_Size			number(5) ;
	Cleanup_BatchSize				number(5) ;
	Alarms_Count					number(20) ;
	CountChangesFunction			number := 11 ;
	IsAlarmXDRTablePresent			boolean:=false ;
	AlarmTableName					varchar2(32) ;

	cursor archive_map_table_name_cursor is
		select a.lookup_table_name, a.archive_name, decode(r.is_spark_support,1,'xdr_id','id') id_column from archive_maps a, record_configs r where a.record_config_id = r.id and a.archive_name != a.lookup_table_name ;

	cursor archive_map_xdr_table_cursor is
		select a.lookup_table_name, decode(r.is_spark_support,1,'xdr_id','id') id_column from archive_maps a, record_configs r where a.record_config_id = r.id and a.archive_name = a.lookup_table_name ;

	cursor cleanup_alarm_cursor is
		select id from alarm_cleanup ;

    cursor case_cursor is
       select id from case c where instr(Cleanup_Option, status) > 0
	   				and id > 1024
					and not exists (select 1 from alarms where case_id = c.id)
					and not exists (select 1 from archived_alarms where case_id = c.id) 
                    and (Last_Cleanup_Run_Date - trunc(modified_date)) > Number_Of_Days
					and rownum <= Cleanup_BatchSize ;

    cursor archived_alarm_cursor (ar_last_run_date date, ar_number_of_days number) is
		select distinct id, case_id from archived_alarms where (ar_last_run_date - trunc(modified_date)) > ar_number_of_days ;

    cursor archived_filtered_alarm_cursor (ar_last_run_date date, ar_number_of_days number, alarm_status number) is select distinct id, case_id from archived_alarms where (ar_last_run_date - trunc(modified_date)) > ar_number_of_days and status = alarm_status ;

	type array_alarmids is table of alarms.id%type index by binary_integer ;
	type array_ReferenceIDs is table of alarms.reference_id%type index by binary_integer ;
	type array_ReferenceTypes is table of alarms.reference_type%type index by binary_integer ;
	type array_aggregation_types is table of alerts.aggregation_type%type index by binary_integer ;
	type array_aggregation_values is table of alerts.aggregation_value%type index by binary_integer ;
	type array_case_ids is table of alarms.case_id%type index by binary_integer ;

	type array_ar_AlarmIDs is table of archived_alarms.id%type index by binary_integer ;
	type array_ar_ReferenceIDs is table of archived_alarms.reference_id%type index by binary_integer ;
	type array_ar_AggregationTypes is table of archived_alerts.aggregation_type%type index by binary_integer ;
	type array_ar_AggregationValues is table of archived_alerts.aggregation_value%type index by binary_integer ;

	type array_RecordCategoryIDs is table of alert_cdr.record_category%type index by binary_integer ;
	type array_AlertIDs is table of alert_cdr.alert_id%type index by binary_integer ;
	type array_RecordCategoryAlarmXDR IS TABLE OF VARCHAR2(40) INDEX BY binary_integer ;
	AlarmXDRs array_RecordCategoryAlarmXDR;

	AlertIDs array_AlertIDs ;
	RecordCategoryIDs array_RecordCategoryIDs ;

	AlarmIDs array_alarmids ;
	CaseIDs array_case_ids ;
    case_cursor_val case_cursor%ROWTYPE ;
	archive_map  archive_map_table_name_cursor%ROWTYPE ;
	archive_map2  archive_map_xdr_table_cursor%ROWTYPE ;

    ArchivedAlarmIDs array_ar_AlarmIDs ;

	procedure Initialize ;
	procedure PopulateCleanupData ;
	procedure CleanupAlarmsData ;
	procedure DeleteAlerts;
	procedure CleanupSmartPatternData ;
	procedure DeleteAlarms ;
	procedure DeleteCase ;
	procedure DeleteCaseData ;
	procedure DeleteAllRecords(RunID in number) ;
	procedure DeleteRecordsForCategory (RecordConfigID in number) ;
	procedure DeleteAlarmXDRForCategoryAlID (RecordConfigID in number, AlertID in number) ;
	procedure CleanupRecord (ReceivedTableName in varchar2, Last_Run_date in date, Interval in number, RecordConfigID in number) ;
	procedure CleanupOnlineData (RecordConfigID in number , TableName in varchar2) ;
	procedure TruncSubPartitions (TableName in varchar2, PartitionName in varchar2) ;
	procedure TruncPartitions (TableName in varchar2, PartitionName in varchar2) ;

	procedure CleanupArchivedDataForIds(ArchvdAlarmIDs IN array_ar_AlarmIDs);
	procedure CleanupArchivedData(alarm_status_type IN number) ;
	procedure DeleteArchivedAlarmsData ;
	procedure DeleteArchivedRecordsData ;
	procedure DeleteFpProfiles ; 
	procedure DeleteArchivedSmartPatternData ;
	PROCEDURE CleanupProfiles(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) ;
	procedure DeleteArchivedFpAlarmsData ;
	procedure DeleteArchivedFpProfiles(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) ;
	procedure CleanupWorkflows ;
	procedure CleanupArchWorkflowActivities ;
	procedure CleanupArchivedWorkflows ;
	procedure CleanupPartialTempTables ;
 	procedure CleanupPrecheckBuilderLogs ;
	procedure SafePartitionsList(run_id in number, RecordConfigID in number, Last_Run_date in date, cleanup in number, safe_partition_list out varchar2);
	procedure AuditTrailInsertion(source in number, event_code in number, entity_type in number, entity_value in varchar2, entity_id in number, action in varchar2, ip_address in varchar2) ;

end Cleanup ;
/
show error;

create or replace package body Cleanup
aS

procedure Initialize
as
	CLEANUP                     number(20) := 61 ;
	CLEANUP_RUN                 number(10) := 1002 ;
	CLEANUP_ENTITY              number(10) := 15002 ;
begin
    select value into Cleanup_Option from configurations where config_key = 'CLEANUP.ALARMS.OPTION' ;
	select to_number(value) into Number_Of_Days from configurations where config_key = 'CLEANUP.ALARMS.INTERVAL_IN_DAYS' ;
    select to_number(value) into Cleanup_BatchSize from configurations where config_key = 'CLEANUP.ALARMS.BATCH_VALUE' ;
    select to_number(value) into Bulk_Fetch_Array_Size from configurations where config_key = 'BULK_FETCH_ARRAY_SIZE' ;
    select trunc(to_date(value, 'YYYY/MM/DD HH24:MI:SS')) into Last_Cleanup_Run_Date
            from configurations where config_key = 'CLEANUP.ALARMS.LAST_RUN_DATE' ;

	IF to_char(Last_Cleanup_Run_Date, 'dd/mm/yyyy') = '01/01/1970' or Last_Cleanup_Run_Date is NULL
	THEN
		Last_Cleanup_Run_Date := trunc(sysdate) ;
	END IF ;

    select count(1) into Alarms_Count from alarms where instr (Cleanup_Option, status) > 0
            and (Last_Cleanup_Run_Date - trunc(modified_date)) > Number_Of_Days ;

	IF ( ( Number_Of_Days <= 0 and Number_Of_Days <> -1 ) OR Number_Of_Days IS NULL ) THEN
		raise INVALID_NUMBER ;
	END IF ;    
	
	EXCEPTION
	when others then
	   Alarms_Count := 0 ;
	   AuditTrailInsertion(CLEANUP, CLEANUP_RUN, CLEANUP_ENTITY, '-', 0, 'Alarm Cleanup failed due to invalid cleanup configuration(s) : CLEANUP.ALARMS.INTERVAL_IN_DAYS , CLEANUP.ALARMS.LAST_RUN_DATE', '-') ;

end Initialize ;

procedure PopulateCleanupData
as
begin
	execute immediate 'truncate table alarm_cleanup' ;
	insert /*+ append */ into alarm_cleanup (id, case_id)
    select distinct id, case_id	from alarms where instr (Cleanup_Option, status) > 0
			and (Last_Cleanup_Run_Date - trunc(modified_date)) > Number_Of_Days
			and rownum <= Cleanup_BatchSize ;
	commit ;
end PopulateCleanupData ;

procedure CleanupAlarmsData
as
begin
	Initialize ;
	loop
		if (Alarms_Count <= 0 ) then
			exit ;
		end if ;
		PopulateCleanupData ;
		open cleanup_alarm_cursor ;
		loop
------ To Do :- make Bulk_Fetch_Array_Size configurable to DB2		
		fetch cleanup_alarm_cursor bulk collect into AlarmIDs limit Bulk_Fetch_Array_Size ;
				CleanupWorkflows ;
				DeleteFpProfiles ;
				CleanupSmartPatternData ;
				DeleteAlerts ;
				DeleteAlarms ;
			commit ;
			exit when cleanup_alarm_cursor%NOTFOUND ;
    	end loop ;
		DeleteCase ;
		close cleanup_alarm_cursor ;
		Alarms_Count := Alarms_Count - Cleanup_BatchSize ;
		commit ;
    end loop ;
	execute immediate 'update configurations set value=to_char(trunc(sysdate),''yyyy/mm/dd hh24:mi:ss'') where config_key = ''CLEANUP.ALARMS.LAST_RUN_DATE''' ;
End CleanupAlarmsData ;

procedure DeleteAlarmXDRForCategoryAlID (RecordConfigID in number,AlertID in number )
AS
	TableName						varchar2(32) ;
begin

	if ( AlarmXDRs.EXISTS(RecordConfigID))
	then
		AlarmTableName := AlarmXDRs(RecordConfigID) ;
		IsAlarmXDRTablePresent:=true ;
	else 
		select tname into TableName from record_configs where id = RecordConfigID ;

		IsAlarmXDRTablePresent:=true ;

		begin
			select LOOKUP_TABLE_NAME into AlarmTableName from alarm_xdr_maps where record_config_id = RecordConfigID ;
			AlarmXDRs(RecordConfigID) := AlarmTableName ;
			EXCEPTION 
				when NO_DATA_FOUND then
				AlarmXDRs(RecordConfigID) := 'Not Found' ;
				IsAlarmXDRTablePresent:=false ;
		end ;
	end if ;

	if (IsAlarmXDRTablePresent = true)
	then
		begin
			execute immediate 'delete from '|| AlarmTableName || ' where  alert_id = :AlertID ' using AlertID ;
		exception 
			when others then
				return ;
		end ;
	end if ;
end DeleteAlarmXDRForCategoryAlID ;

procedure DeleteAlarms
aS
begin
	forall l_i in 1 .. AlarmIDs.count
		delete from currently_opened_alarms where alarm_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alarm_link_cdr_details where alarm_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alarm_attachments where alarm_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alarm_comments where alarm_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alarm_views_fraud_types where alarm_view_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from ml_aq_alarm where id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alarms where id = AlarmIDs(l_i) ;
end DeleteAlarms ;

procedure DeleteCaseData
AS
begin
	forall l_i in 1 .. CaseIDs.count
		update case set alarm_Count = alarm_count - 1 where id > 1024 and id = CaseIDs(l_i) ;
end DeleteCaseData ;

procedure DeleteAlerts
AS
begin
	forall l_i in 1 .. AlarmIDs.count
 		delete from matched_details where matched_results_id in
				(select mr.id from matched_results mr, alert_matched_results_maps amr, alerts a
					where mr.id = amr.matched_results_id
						and a.id = amr.alert_id
						and a.alarm_id = AlarmIDs(l_i));

 	forall l_i in 1 .. AlarmIDs.count
		delete from matched_results where id in
			(select mr.id from matched_results mr, alert_matched_results_maps amr, alerts a
				where mr.id = amr.matched_results_id
					and a.id = amr.alert_id
					and a.alarm_id = AlarmIDs(l_i)) ;

	forall l_i in 1 .. AlarmIDs.count
		delete from alert_matched_results_maps
			where alert_id in (select distinct am.alert_id from alert_matched_results_maps am, alerts a
				           		where am.alert_id = a.id and a.alarm_id = AlarmIDs(l_i)) ;

	forall l_i in 1 .. AlarmIDs.count
		delete from multiple_field_func_res_info where record_id in
			(select m.record_id from multiple_field_func_res_info m, alert_cdr c, alerts a
				where a.alarm_id = AlarmIDs(l_i) and a.event_instance_id = m.rule_key
					and c.alert_id = a.id and m.record_id = c.cdr_id) ;

	for l_i in 1 .. AlarmIDs.count
	loop
        for rule_category_alert_id in (select distinct record_category,alert_id from alert_cdr where alert_id in (select id from alerts where alarm_id = AlarmIDs(l_i)))
		loop
			DeleteAlarmXDRForCategoryAlID(rule_category_alert_id.record_category, rule_category_alert_id.alert_id);
		end loop ;
	end loop ;	

	forall l_i in 1 .. AlarmIDs.count
		delete from alert_cdr where alert_id in
				(select id from alerts where alarm_id = AlarmIDs(l_i)) ;

	forall l_i in 1 .. AlarmIDs.count
		delete from map_for_srs where osr_id in
			(select id from observation_summary_records
			 	where alert_id in
			 		(select id from alerts
			 		 	where alarm_id = AlarmIDs(l_i))) ;

	forall l_i in 1 .. AlarmIDs.count
		delete from observation_summary_records where alert_id in
				(select id from alerts where alarm_id = AlarmIDs(l_i)) ;
	forall l_i in 1 .. AlarmIDs.count
		delete from alerts
			   where alarm_id = AlarmIDs(l_i) ;
End DeleteAlerts ;

procedure DeleteCase
AS
begin
    open case_cursor ;
    loop
        fetch case_cursor into case_cursor_val ;
        exit when case_cursor%NOTFOUND ;
		delete from case_comments where case_id = case_cursor_val.id ;
		delete from case_attachments where case_id = case_cursor_val.id ;
        delete from case where id = case_cursor_val.id ;
        commit ;
    end loop ;
    close case_cursor ;
End DeleteCase ;

procedure DeleteAllRecords(RunID in number)
AS
	Cleanup_Record_Ids				varchar2(64) ;
	cursor record_ids is select distinct id from record_configs where instr(',' || Cleanup_Record_Ids || ',', ',' || id || ',') > 0 ;
begin
	Run_Id := RunID;
	select value into Cleanup_Record_Ids from configurations where config_key = 'CLEANUP.RECORDS.OPTION' ;
	for recordconfig in record_ids
	loop
		DeleteRecordsForCategory (recordconfig.id) ;
	end loop ;
	exception
	when others then
		dbms_output.put_line(sqlerrm) ;
end DeleteAllRecords ;

procedure CleanupPartialTempTables
AS
	Cleanup_Interval			varchar2(32) ;
	Last_Record_Processed_Date		date ;
	time_cal				date ;
	table_name 				varchar2(100) ;
	id 					number ;
	CLEANUP                     number(20) := 61 ;
	CLEANUP_RUN                 number(10) := 1002 ;
	CLEANUP_ENTITY              number(10) := 15002 ;
	CURSOR fetch_record_config_ids IS
		select distinct record_config_id 
		from partial_temp_table_maps ;
	CURSOR fetch_table_name_cursor(Rec_ID number ) IS
		select TNAME 
		from partial_temp_table_maps T,record_configs R
		where T.RECORD_CONFIG_ID=Rec_ID and T.LOOKUP_TABLE_ID=R.ID ;
	fetchtablenamecursor fetch_table_name_cursor%ROWTYPE;
begin
	select to_number(value) into Cleanup_Interval from configurations where config_key = 'PARTIAL_TEMP_CLEANUP_DAYS';
	IF ( ( Cleanup_Interval <= 0 and Cleanup_Interval <> -1 ) OR Cleanup_Interval IS NULL) THEN
	    raise INVALID_NUMBER ;
	END IF ;
	FOR Record_ID IN fetch_record_config_ids LOOP
		Last_Record_Processed_Date := Utility.GETCURRENTPARTITIONDATE(Record_ID.record_config_id) ;
		time_cal := Last_Record_Processed_Date - to_number(Cleanup_Interval) ;
		open fetch_table_name_cursor(Record_ID.record_config_id) ;
		loop
			FETCH fetch_table_name_cursor into fetchtablenamecursor ;
			EXIT WHEN fetch_table_name_cursor%NOTFOUND ;
 execute immediate 'delete from ' || fetchtablenamecursor.TNAME || ' where time_stamp <  :Time_Cal ' using time_cal ;
		end loop ;
		close fetch_table_name_cursor ;
		
	END LOOP;     	

	exception
	when others then
	   AuditTrailInsertion(CLEANUP, CLEANUP_RUN, CLEANUP_ENTITY, '-', 0, 'Cleanup of Partial Temp Tables failed due to invalid cleanup interval configuration : PARTIAL_TEMP_CLEANUP_DAYS', '-') ;
		
end CleanupPartialTempTables ;

procedure CleanupPrecheckBuilderLogs
AS
	CleanupInterval			varchar2(32) ;
begin
 	select value into CleanupInterval from configurations where config_key = 'CLEANUP.PRECHECK_BUILDER_LOGS.INTERVAL_IN_DAYS' ;
    execute immediate 'delete from precheck_builder_logs where build_end_time < trunc(sysdate) - ' || CleanupInterval ;
end CleanupPrecheckBuilderLogs ;
 
procedure DeleteRecordsForCategory (RecordConfigID in number)
AS
	TableName						varchar2(32) ;
	Record_Config_Options			varchar2(32) ;
	Alarm_XDR_Config_Options		varchar2(32) ;
	Last_Record_Processed_Date		date ;
	Cleanup_Interval				varchar2(32) ;
	Alarm_XDR_Cleanup_Interval		varchar2(32) ;
	delimeter						varchar2(2) := ',' ;
	start_pos						number := 1 ;
	curr_pos						number ;
	CLEANUP                         number(20) := 61 ;
	CLEANUP_RUN                     number(10) := 1002 ;
	CLEANUP_ENTITY                  number(10) := 15002 ;
	configuration_value             NUMBER(10) ;
begin
	insert into CLEANUP_RECORD_STATUS(RUN_ID, RECORD_CONFIG_ID, CLEANUP_DATE, CLEANUP_CONFIGS, ERROR_MESSAGE) values (Run_Id, RecordConfigID, CURRENT_TIMESTAMP, NULL, NULL);
	select tname into TableName from record_configs where id = RecordConfigID ;

	select value into Record_Config_Options from configurations
			where config_key = 'CLEANUP.RECORDS.'||TableName||'.OPTIONS' ;
	update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = '#CLEANUP.RECORDS.'||TableName||'.OPTIONS := '||Record_Config_Options where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
	begin
	    tokenizer (start_pos, delimeter, Record_Config_Options, Cleanup_Interval, curr_pos) ;
	    configuration_value := to_number(Cleanup_Interval) ;
	update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #Cleanup_Interval := '||Cleanup_Interval where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
	    IF ( ( configuration_value <= 0 and configuration_value <> -1 ) OR configuration_value IS NULL) THEN
	        raise INVALID_NUMBER ;
	    END IF ;
	EXCEPTION 
	    when others then
	        AuditTrailInsertion(CLEANUP, CLEANUP_RUN, CLEANUP_ENTITY, '-', RecordConfigID, 'Cleanup of '||TableName||' failed due to invalid cleanup interval configuration : ' || 'CLEANUP.RECORDS.'||TableName||'.OPTIONS' , '-') ;
	        return ;
	end ;

	Last_Record_Processed_Date := Utility.GETCURRENTPARTITIONDATE(RecordConfigID) ;
	update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #LastRecordProcessedDate := '||Last_Record_Processed_Date where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
	commit;
	tokenizer (start_pos, delimeter, Record_Config_Options, Cleanup_Interval, curr_pos) ;

	CleanupRecord (TableName,Last_Record_Processed_Date,to_number(Cleanup_Interval), RecordConfigID) ;

end DeleteRecordsForCategory ;

procedure CleanupRecord ( ReceivedTableName in varchar2, Last_Run_date in date, Interval in number, RecordConfigID in number)
is
	end_cleanup_date			date ;
	Last_Run_Day				number;
	Safe_Partition_List			varchar2(2048);
	start_cleanup_date 			date ;
	alarm_xdr_end_cleanup_date		date ;
	day							number ;
	PartitionName				varchar2(32) ;
	IsPartitioned				number ;
	TimeStamp					varchar2(50) ;
	TableName					varchar2(256) ;
	IsOfflineEnabled			number := 0 ;
	OfflineTableName			varchar2(256) ;
	FieldCategoryID				number := 13 ;
begin
		TableName := ReceivedTableName ;

		select is_partitioned into IsPartitioned from record_configs where id = RecordConfigID ;
		update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #IsPartitioned := '||IsPartitioned where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;	
		IF IsPartitioned = 1 THEN
			OfflineTableName := Utility.GETOFFLINETABLENAME(RecordConfigID) ;
			IF OfflineTableName IS NOT NULL THEN
				update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #OfflineTableName := '||OfflineTableName where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
				IsOfflineEnabled := 1 ;
				CleanupOnlineData( RecordConfigID , TableName ) ; 
				TableName := OfflineTableName ;
			END IF ;
		END IF ;
		end_cleanup_date := Last_Run_date - Interval ;
		select to_date(value, 'YYYY/MM/DD') + 1 into start_cleanup_date from configurations where config_key = 'CLEANUP.RECORDS.'||'LAST_'||TableName||'_DAY_TRUNCED' ;

		select is_partitioned into IsPartitioned from record_configs where id = RecordConfigID ;

		IF to_char(Last_Run_date, 'dd/mm/yyyy') = '01/01/1970'
		THEN
			RETURN ;
		END IF ;
		
		IF start_cleanup_date IS NULL or start_cleanup_date = to_date('1970/01/01', 'YYYY/MM/DD') + 1 THEN
			start_cleanup_date := end_cleanup_date - Interval ;
		END IF ;
		select TO_CHAR(Last_Run_date, 'DDD') into Last_Run_Day from dual;
		SafePartitionsList(Run_Id, RecordConfigID, Last_Run_date, Interval, Safe_Partition_List);	
		update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #LastRunDate := '||Last_Run_date||' #Last_Run_Day := '||Last_Run_Day where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
		
		update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #end_cleanup_date := '||end_cleanup_date where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
		update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #start_cleanup_date := '||start_cleanup_date where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
		IF IsPartitioned = 0
		THEN
			select database_field into TimeStamp from field_configs
				where record_config_id = RecordConfigID
					and field_id = (select field_association from field_record_config_maps
										where record_config_id = RecordConfigID
											and field_category_id = FieldCategoryID) ;

			execute immediate 'delete from '|| TableName || ' where ' || TimeStamp || ' <= :CleanupDate' using end_cleanup_date ;
			update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #Cleaned Data of '||TableName||' between interval' where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
			update configurations set value = to_char(end_cleanup_date,'yyyy/mm/dd') where config_key ='CLEANUP.RECORDS.'||'LAST_'||TableName||'_DAY_TRUNCED' ;

		ELSE
			update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' #CleaningPartitionsi := ' where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
			LOOP
				exit when trunc(start_cleanup_date) > trunc(end_cleanup_date) ;
				day := to_char(start_cleanup_date, 'ddd') ;

				if Test_Run = '1' then
					execute immediate 'delete from '|| TableName || ' where day_of_year ='|| day ;
				else
					PartitionName := GetPartitionName(RecordConfigID, day) ;
					IF INSTR(Safe_Partition_List, PartitionName) > 0 THEN
						start_cleanup_date := start_cleanup_date + 1 ;
						update CLEANUP_RECORD_STATUS set ERROR_MESSAGE = ERROR_MESSAGE ||'#Tried cleaning a Safe Partition '||PartitionName||', Hence skipped' where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
						CONTINUE;	
					END IF;
					IF OfflineTableName IS NOT NULL THEN
						TruncPartitions (TableName, PartitionName) ;
						update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' P' || PartitionName where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;	
					ELSE
						TruncSubPartitions (TableName, PartitionName) ;
						update CLEANUP_RECORD_STATUS set CLEANUP_CONFIGS = CLEANUP_CONFIGS || ' SP-' || PartitionName where RUN_ID = Run_Id and RECORD_CONFIG_ID = RecordConfigID;
					END IF ;
				end if ;
				execute immediate 'delete from key_range_for_day where day = :CleanupDate and record_config_id= :RecordConfigID' using start_cleanup_date, RecordConfigID;
				update configurations set value = to_char(start_cleanup_date,'yyyy/mm/dd') where config_key ='CLEANUP.RECORDS.'||'LAST_'||TableName||'_DAY_TRUNCED' ;
				commit ;
				start_cleanup_date := start_cleanup_date + 1 ;
			END LOOP ;

		END IF ;
	commit;
	exception
	when others then
		dbms_output.put_line(sqlerrm) ;
	commit ;
end CleanupRecord ;

procedure CleanupOnlineData (RecordConfigID in number , TableName in varchar2)
is
	end_cleanup_date			date ;
	start_cleanup_date 			date ;
	min_date                                        date := to_date('1970/01/01', 'YYYY/MM/DD') ;
	day							number ;
	counter						number := 0 ;
	oldest_available_date		date ;
	PartitionName				varchar2(32) ;
begin
		select to_date(value, 'YYYY/MM/DD') + 1 into start_cleanup_date from configurations where config_key = 'CLEANUP.RECORDS.'||'LAST_'||TableName||'_DAY_TRUNCED' ;
		begin
			select min(partition_date) into min_date from offline_readiness where record_config_id = RecordConfigID and is_ready > 0 ;
			IF min_date > start_cleanup_date  THEN
				start_cleanup_date := min_date ;
			END IF ;
			EXCEPTION 
				when NO_DATA_FOUND then
				min_date := start_cleanup_date ;
		end ;

		end_cleanup_date := Utility.GETLATESTAVAILABLEDATE(RecordConfigID) ;

			LOOP
				exit when start_cleanup_date IS NULL ;
				exit when end_cleanup_date IS NULL ;
				exit when trunc(start_cleanup_date) > trunc(end_cleanup_date) ;
				day := to_char(start_cleanup_date, 'ddd') ;

				if Test_Run = '1' then
					execute immediate 'delete from '|| TableName || ' where day_of_year ='|| day ;
				else
					PartitionName := GetPartitionName(RecordConfigID,day) ;
					TruncSubPartitions (TableName, PartitionName) ;
				end if ;
				update configurations set value = to_char(start_cleanup_date,'yyyy/mm/dd') where config_key ='CLEANUP.RECORDS.'||'LAST_'||TableName||'_DAY_TRUNCED' ;
				commit ;
				counter := counter + 1 ;
				start_cleanup_date := start_cleanup_date + 1 ;
			END LOOP ;
			
end CleanupOnlineData ;

procedure TruncSubPartitions (TableName in varchar2, PartitionName in varchar2)
IS
	detach_table_name   varchar2(100) ;
	partition_value		varchar2(10) ;
	cursor subpartns_cur is select subpartition_name from record_subpartitions
		where table_name = TableName and partition_name = PartitionName ;
begin
	for rec in subpartns_cur
	loop
		execute immediate 'alter table '||TableName||' truncate subpartition '||rec.subpartition_name||' drop storage' ;






	end loop ;
exception
	when others then
		dbms_output.put_line(sqlerrm) ;
end TruncSubPartitions ;

procedure TruncPartitions (TableName in varchar2, PartitionName in varchar2)
IS
	detach_table_name   varchar2(100) ;
	partition_value		varchar2(10) ;
begin
	execute immediate 'alter table '||TableName||' truncate partition '||PartitionName||' drop storage' ;






exception
	when others then
		dbms_output.put_line(sqlerrm) ;
end TruncPartitions ;
 
procedure CleanupArchivedDataForIds(ArchvdAlarmIDs IN array_ar_AlarmIDs)
IS
	ar_number_of_days			number(10,0) ;
    ar_last_run_date			date ;
    array_limit 				number(8,0) ;
BEGIN
	ArchivedAlarmIDs := ArchvdAlarmIDs ;
	CleanupArchivedWorkflows ;
	DeleteArchivedFpAlarmsData ;
	DeleteArchivedSmartPatternData ;
	DeleteArchivedRecordsData ;
	DeleteArchivedAlarmsData ;
	commit ;
end CleanupArchivedDataForIds ;
 


procedure CleanupArchivedData(alarm_status_type IN number)
IS
	ar_number_of_days			number(10,0) ;
    ar_last_run_date			date ;
    array_limit 				number(8,0) ;
BEGIN
	Initialize ;
	begin
		select to_number(interval_in_days) into ar_number_of_days from arc_alarm_cleanup_configs Where alarm_status = alarm_status_type ;
	EXCEPTION 
	when NO_DATA_FOUND then
		raise_application_error (-20001,'Invalid Alarm Status Type. Alarm Status not present in arc_alarm_cleanup_configs.');
	end;

    select  trunc(to_date(last_run_date, 'YYYY/MM/DD HH24:MI:SS')) into ar_last_run_date from arc_alarm_cleanup_configs Where alarm_status = alarm_status_type ;
	select to_number(value) into array_limit from configurations where config_key = 'BULK_FETCH_ARRAY_SIZE' ;

    IF to_char(ar_last_run_date, 'dd/mm/yyyy') = '01/01/1970'
    THEN
        ar_last_run_date := trunc(sysdate) ;
    END IF ;

	open archived_filtered_alarm_cursor(ar_last_run_date,ar_number_of_days, alarm_status_type) ;
    loop
        exit when archived_filtered_alarm_cursor%NOTFOUND ;
------ To Do :- make Bulk_Fetch_Array_Size configurable to DB2		
	fetch archived_filtered_alarm_cursor bulk collect into ArchivedAlarmIDs, CaseIDs limit array_limit ;
			CleanupArchivedWorkflows ;
			DeleteArchivedFpAlarmsData ;
			DeleteArchivedSmartPatternData ;
			DeleteArchivedRecordsData ;
			DeleteArchivedAlarmsData ;
			DeleteCaseData ;
			DeleteCase ;
		commit ;
		for l_i in 1 .. ArchivedAlarmIDs.count
		loop
			DBMS_OUTPUT.PUT_LINE(ArchivedAlarmIDs(l_i)) ;
		end loop ;
    end loop ;
    close archived_filtered_alarm_cursor;
	execute immediate 'update arc_alarm_cleanup_configs set last_run_date = to_char(trunc(sysdate),''yyyy/mm/dd hh24:mi:ss'') where alarm_status='||alarm_status_type ;
end CleanupArchivedData ;

procedure DeleteArchivedAlarmsData
IS
BEGIN

	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_multi_field_func_res_info where record_id in
			(select m.record_id from ar_multi_field_func_res_info m, archived_alert_cdr c, archived_alerts a
				where a.alarm_id = ArchivedAlarmIDs(l_i) and a.event_instance_id = m.rule_key
					and c.alert_id = a.id and m.record_id = c.cdr_id) ;

	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_matched_details
			where matched_results_id in
				(select mr.id from archived_matched_results mr, ar_alert_matched_results_maps amr, archived_alerts a
					where mr.id = amr.matched_results_id
						and a.id = amr.alert_id
						and a.alarm_id = ArchivedAlarmIDs(l_i));

	forall l_i in 1 .. ArchivedAlarmIDs.count
 		delete from archived_matched_results where id in
			(select mr.id from archived_matched_results mr, ar_alert_matched_results_maps amr, archived_alerts a
				where mr.id = amr.matched_results_id
					and a.id = amr.alert_id
					and a.alarm_id = ArchivedAlarmIDs(l_i)) ;

 	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_alert_matched_results_maps
			where alert_id in (select distinct am.alert_id from ar_alert_matched_results_maps am, archived_alerts a
				           		where am.alert_id = a.id and a.alarm_id = ArchivedAlarmIDs(l_i)) ;

	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alert_cdr where alert_id in
			(select id from archived_alerts
				where alarm_id = ArchivedAlarmIDs(l_i)) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_map_for_srs where osr_id in
			(select id from ar_observation_summary_records
			 	where alert_id in
			 		(select id from archived_alerts
			 		 	where alarm_id = ArchivedAlarmIDs(l_i))) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_observation_summary_records where alert_id in
			(select id from archived_alerts
				where alarm_id = ArchivedAlarmIDs(l_i)) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alerts
			where alarm_id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alarm_comments where alarm_id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alarm_attachments where alarm_id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alarms_fraud_types where alarm_id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_alarm_link_cdr_details where alarm_id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from ar_ml_aq_alarm where id = ArchivedAlarmIDs(l_i) ;
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_alarms where id = ArchivedAlarmIDs(l_i) ;
END DeleteArchivedAlarmsData ;

PROCEDURE cleanupSmartPatternData
IS
BEGIN
	-- 'forall' changed to 'for' due to shared run id cases
	for l_i in 1..AlarmIDs.count
	loop
		delete from SP_VIOLATIONS where
			run_id in
			(
				select sp_violations_run_id from ALERT_SP_VIOLATIONS_MAPS
				where alert_id in (select id from alerts where alarm_id = AlarmIDs(l_i))
			) and
			run_id not in
			(
				select sp_violations_run_id from ALERT_SP_VIOLATIONS_MAPS
				where alert_id in (select id from alerts where alarm_id in (select id from alarms
					where id <> AlarmIDs(l_i) and reference_id = (select reference_id from alarms
					where id = AlarmIDs(l_i) and rownum < 2)))
			) ;

		delete from ALERT_SP_VIOLATIONS_MAPS where alert_id in
			(select id from alerts where alarm_id = AlarmIDs(l_i)) ;
	end loop ;
End CleanupSmartPatternData ;

PROCEDURE DeleteArchivedRecordsData
IS
BEGIN
	open archive_map_table_name_cursor ;
   	loop
   	    fetch archive_map_table_name_cursor into archive_map ;
        exit when archive_map_table_name_cursor%NOTFOUND ;
		for l_i in 1 .. ArchivedAlarmIDs.count
		loop
			execute immediate 'delete from '||archive_map.lookup_table_name||' where alert_id in (select id from archived_alerts where alarm_id = :ArchivedAlarmIDs)' using ArchivedAlarmIDs(l_i);
			execute immediate 'delete from '||archive_map.archive_name||' where '||archive_map.id_column||' in (select map.xdr_id from ar_map_for_srs map , archived_alerts a, ar_observation_summary_records osr where a.alarm_id = :ArchivedAlarmIDs and a.id = osr.alert_id and map.osr_id = osr.id and  not exists (select map1.xdr_id from ar_map_for_srs map1 , ar_observation_summary_records osr1, archived_alerts a1 where map1.xdr_id = map.xdr_id and osr1.record_config_id = osr.record_config_id and osr1.id = map1.osr_id and a1.id = osr1.alert_id and a1.alarm_id != :ArchivedAlarmIDs))' using ArchivedAlarmIDs(l_i), ArchivedAlarmIDs(l_i);
		end loop;
 	end loop ;
    close archive_map_table_name_cursor ;

	open archive_map_xdr_table_cursor ;
   	loop
   	    fetch archive_map_xdr_table_cursor into archive_map2 ;
        exit when archive_map_xdr_table_cursor%NOTFOUND ;
		for l_i in 1 .. ArchivedAlarmIDs.count
		loop
			execute immediate 'delete from '||archive_map2.lookup_table_name||' where '||archive_map2.id_column||' in (select ac.cdr_id from archived_alerts a, archived_alert_cdr ac where a.alarm_id = :ArchivedAlarmIDs and a.id = ac.alert_id and not exists (select ac1.cdr_id from archived_alert_cdr ac1, archived_alerts a1 where ac1.cdr_id = ac.cdr_id and ac1.record_category = ac.record_category and ac1.alert_id = a1.id and a1.alarm_id != :ArchivedAlarmIDs))'  using ArchivedAlarmIDs(l_i), ArchivedAlarmIDs(l_i);
			execute immediate 'delete from '||archive_map2.lookup_table_name||' where '||archive_map2.id_column||' in (select map.xdr_id from ar_map_for_srs map , archived_alerts a, ar_observation_summary_records osr where a.alarm_id = :ArchivedAlarmIDs and a.id = osr.alert_id and map.osr_id = osr.id and  not exists (select map1.xdr_id from ar_map_for_srs map1 , ar_observation_summary_records osr1, archived_alerts a1 where map1.xdr_id = map.xdr_id and osr1.record_config_id = osr.record_config_id and osr1.id = map1.osr_id and a1.id = osr1.alert_id and a1.alarm_id != :ArchivedAlarmIDs))' using ArchivedAlarmIDs(l_i), ArchivedAlarmIDs(l_i);
		end loop;
 	end loop ;
    close archive_map_xdr_table_cursor ;
END DeleteArchivedRecordsData ;

PROCEDURE DeleteArchivedSmartPatternData
IS
BEGIN
	-- 'forall' changed to 'for' due to shared run id cases
	for aid in 1..ArchivedAlarmIDs.count
	loop
		delete from AR_SP_VIOLATIONS where 
			run_id in
			(
				select sp_violations_run_id from AR_ALERT_SP_VIOLATIONS_MAPS 
				where alert_id in (select id from archived_alerts where alarm_id = ArchivedAlarmIDs(aid))
			) and
			run_id not in
			(
				select sp_violations_run_id from AR_ALERT_SP_VIOLATIONS_MAPS 
				where alert_id in (select id from archived_alerts where alarm_id in (select id from archived_alarms
					where id <> ArchivedAlarmIDs(aid) and reference_id = (select reference_id from archived_alarms
					where id = ArchivedAlarmIDs(aid) and rownum < 2)))
			) ;

		delete from AR_ALERT_SP_VIOLATIONS_MAPS where alert_id in
			(select id from archived_alerts where alarm_id = ArchivedAlarmIDs(aid)) ;
	end loop ;
End DeleteArchivedSmartPatternData ;

PROCEDURE DeleteFpProfiles
IS	
	cursor fp_alert_cursor(alarmid varchar2) is 
		select alert_id, profile_match_index_id, rules.aggregation_type
			from alerts, alert_profile_match_index_maps, rules 
			where alerts.alarm_id = alarmid 
				and alert_profile_match_index_maps.alert_id = alerts.id 
				and rules.id = (select max(id) from rules where key = alerts.event_instance_id and category = 'FINGERPRINT_RULE') ;

	fpalertcursor fp_alert_cursor%ROWTYPE;
BEGIN

	for aid in 1..AlarmIDs.count
		loop
			open fp_alert_cursor(AlarmIDs(aid)) ;
			loop
				FETCH fp_alert_cursor INTO fpalertcursor ;
				EXIT WHEN fp_alert_cursor%NOTFOUND ;

				CleanupProfiles(fpalertcursor.alert_id, fpalertcursor.profile_match_index_id, fpalertcursor.aggregation_type) ;
		  	end loop ;
			close fp_alert_cursor ;
		end loop ;		
  	exception
		when others then dbms_output.put_line(sqlerrm) ;
END DeleteFpProfiles ;

PROCEDURE DeleteArchivedFpAlarmsData 
IS	
		cursor archived_fp_alert_cursor(alarmid varchar2) is 
			select alert_id, profile_match_index_id, rules.aggregation_type
				from archived_alerts, AR_ALERT_PROFILE_MATCH_INDEX, rules
				where archived_alerts.alarm_id = alarmid 
					and AR_ALERT_PROFILE_MATCH_INDEX.alert_id = archived_alerts.id
					and rules.id = (select max(id) from rules where key = archived_alerts.event_instance_id and category = 'FINGERPRINT_RULE') ;

		archivedfpalertcursor archived_fp_alert_cursor%ROWTYPE;
BEGIN
	for aid in 1..ArchivedAlarmIDs.count
		loop
			open archived_fp_alert_cursor(ArchivedAlarmIDs(aid)) ;
			loop
				FETCH archived_fp_alert_cursor INTO archivedfpalertcursor ;
				EXIT WHEN archived_fp_alert_cursor%NOTFOUND ;

				DeleteArchivedFpProfiles(archivedfpalertcursor.alert_id, archivedfpalertcursor.profile_match_index_id, 
						archivedfpalertcursor.aggregation_type) ;
		  	end loop ;
			close archived_fp_alert_cursor ;
		end loop ;		
	
	forall l_i in 1 .. ArchivedAlarmIDs.count
		delete from archived_subscriber where id in 
			(select cdr_id from archived_alerts, archived_alert_cdr
				where archived_alerts.alarm_id = ArchivedAlarmIDs(l_i)
				and archived_alerts.id = archived_alert_cdr.alert_id
				and cdr_id not in 
					(select cdr_id from archived_alerts, archived_alert_cdr
					where archived_alerts.alarm_id <> ArchivedAlarmIDs(l_i)
					and archived_alerts.id = archived_alert_cdr.alert_id
					) 
			);
  	exception
		when others then dbms_output.put_line(sqlerrm) ;

	COMMIT ;
END DeleteArchivedFpAlarmsData ;

PROCEDURE CleanupProfiles(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) 
IS
	EntityID 				number(20) ;
	EntityProfileVersion	number(20) ;
BEGIN
	select profiled_entity_id, entity_profile_version INTO EntityID, EntityProfileVersion
		from profile_match_index 
		where id = ProfileMatchIndexID ;

	for FpTableName in (select tname from fp_profiles_dataset_map where entity_id = AggregationType and run_identifier in (0,1,2,3))
	loop
		execute immediate 'delete from ' || FpTableName.tname || ' where entity_id = ' || AggregationType || ' and 
				profiled_entity_id = ' || EntityID || ' and 
				version = ' || EntityProfileVersion || ' and 
				is_match_type = 0 ';
	end loop;

	delete from alert_profile_match_index_maps where alert_id = AlertID and profile_match_index_id = ProfileMatchIndexID ;  
	delete from profile_match_detail where profile_match_index_id = ProfileMatchIndexID ;
	delete from profile_match_index where id = ProfileMatchIndexID 
		and (select count(*) from alert_profile_match_index_maps where profile_match_index_id = ProfileMatchIndexID) = 0;

	COMMIT ;
  	exception
		when others then dbms_output.put_line(sqlerrm) ;
END CleanupProfiles ;

PROCEDURE DeleteArchivedFpProfiles(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) 
IS
	EntityID 				number(20) ;
	EntityProfileVersion	number(20) ;
BEGIN
	select profiled_entity_id, entity_profile_version INTO EntityID, EntityProfileVersion
		from archived_profile_match_index 
		where id = ProfileMatchIndexID ;

	delete from archived_fp_profiles 
		where entity_id = AggregationType 
			and profiled_entity_id = EntityID 
			and version = EntityProfileVersion 
			and is_match_type = 0 ;

	delete from AR_ALERT_PROFILE_MATCH_INDEX where alert_id = AlertID and profile_match_index_id = ProfileMatchIndexID ;  
	delete from archived_profile_match_detail where profile_match_index_id = ProfileMatchIndexID ;
	delete from archived_profile_match_index where id = ProfileMatchIndexID 
		and (select count(*) from AR_ALERT_PROFILE_MATCH_INDEX where profile_match_index_id = ProfileMatchIndexID) = 0;

	COMMIT ;
  	exception
		when others then dbms_output.put_line(sqlerrm) ;
END DeleteArchivedFpProfiles ;

PROCEDURE CleanupWorkflows
IS
BEGIN
	for aid in 1.. AlarmIDs.count
	loop
		delete from workflow_trans_variables where workflow_transaction_id 
			in (select id from workflow_transactions where alarm_id = AlarmIDs(aid)) ;
        delete from workflow_transactions where alarm_id = AlarmIDs(aid) ;
		delete from alarm_workflow_info where alarm_id = AlarmIDs(aid) ;
		delete from alarm_activity_logs where alarm_id = AlarmIDs(aid) ; 
	end loop ;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
    COMMIT;
END CleanupWorkflows ;

PROCEDURE CleanupArchivedWorkflows
IS
BEGIN
	CleanupArchWorkflowActivities ;
	for aid in 1.. ArchivedAlarmIDs.count
	loop
		delete from ar_workflow_trans_variables where workflow_transaction_id 
			in (select id from archived_workflow_transactions where alarm_id = ArchivedAlarmIDs(aid)) ;
        delete from archived_workflow_transactions where alarm_id = ArchivedAlarmIDs(aid) ;
		delete from archived_alarm_workflow_info where alarm_id = ArchivedAlarmIDs(aid) ;
		delete from archived_alarm_activity_logs where alarm_id = ArchivedAlarmIDs(aid) ; 
	end loop ; 
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
    COMMIT;
END CleanupArchivedWorkflows ;

PROCEDURE CleanupArchWorkflowActivities
IS
BEGIN
    forall id in 1.. ArchivedAlarmIDs.count
        delete from archived_activities where id in (select activity_id from archived_workflow_transactions where alarm_id = ArchivedAlarmIDs(id)) ;

    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
    COMMIT;
END CleanupArchWorkflowActivities ;

PROCEDURE AuditTrailInsertion(source in number, event_code in number, entity_type in number, entity_value in varchar2, entity_id in number,  action in varchar2, ip_address in varchar2)
IS
BEGIN
    insert INTO audit_trails (id, logged_date, source, event_code, entity_type, entity_value, entity_id, action, ip_address, user_id, network_id) values (audit_trails_seq.nextval, sysdate, source, event_code, entity_type, entity_value,
	entity_id, action, ip_address, 'system', '999') ;
END AuditTrailInsertion ;

procedure SafePartitionsList(run_id in number, RecordConfigID in number, Last_Run_date in date, cleanup in number, safe_partition_list out varchar2)
IS
	safe_list varchar2(2048);
	future_days number(1);
	start_date date;
	end_date date;
BEGIN
	end_date := Last_Run_date+future_days;
	select ACCEPTABLE_FUTURE_DAYS into future_days from dbwriter_configurations where RECORD_CONFIG_ID = RecordConfigID;		
	start_date := Last_Run_date-cleanup;
	FOR day IN start_date..end_date LOOP
		safe_list := safe_list || GetPartitionName(RecordConfigID, to_char(Last_Run_date, 'ddd'));
		day := day + 1;
	END LOOP;
	update CLEANUP_RECORD_STATUS set SAFE_PARTITIONS = safe_list where RUN_ID = run_id and RECORD_CONFIG_ID = RecordConfigID;
	commit;
END SafePartitionsList ;

end Cleanup;
/
show error;
commit ;
