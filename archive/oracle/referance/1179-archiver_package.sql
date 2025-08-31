--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2001. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written   *
-- *	permission from Subex Systems Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/

spool archiver_package.log
set feedback off ;
set serveroutput on ;
create or replace package Archiver
as
	ArchiveOption				varchar2(10) ;
	LastArchivedTime			date ;
	Bulk_Fetch_Array_Size		number ;
	Archive_BatchSize			number ;
	Alarms_Count				number ;
	RecordRow					number := 0 ;
	CountChangesFunction		number := 11 ;
	ExceptionalCase				boolean:=false ;

	cursor archive_alarm_id_cursor(archive_opt varchar2) is
		select distinct alarm_id from archive_details 
					where instr(archive_opt, status) > 0 ;


	cursor archive_alarm_cursor(archive_opt varchar2) is
		select alarm_id, aggregation_type, aggregation_value, reference_id from archive_details 
					where instr(archive_opt, status) > 0 ;

	procedure ArchiveAlarmData ;
	procedure Initialize ;
	procedure PopulateArchiverDetails ;
	procedure ArchiveAlarms ;
	procedure ArchiveAlerts ;
	procedure ArchiveAllRecords ;
	procedure ArchiveFpAlarms ;
	procedure ArchiveSmartPatternData ;
	procedure ArchiveAlarmsWorkflow ;
	procedure ArchiveWorkflowActivities ;
	procedure ArchiveProfileTables(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) ;
	procedure ArchiveRecordsForCategory(RecordConfigID in number) ;
	procedure InsertIntoArchiveRecords(aggregationType in number, aggregationValue in varchar2, archivedTableName in varchar2, TableName in varchar2, dofy in number,RecordConfigID in number, AlarmID in number) ;

	type array_alarmids is table of alarms.id%type index by binary_integer ;
	type array_subscriberids is table of alarms.reference_id%type index by binary_integer ;
	type array_aggregation_types is table of alerts.aggregation_type%type index by binary_integer;
	type array_aggregation_values is table of alerts.aggregation_value%type index by binary_integer;
	
	AlarmIDs array_alarmids ;
	AggregationTypes array_aggregation_types ;
	AggregationValues array_aggregation_values ;
	ReferenceIDs      array_subscriberids ;
	
end Archiver ;
/
show error;

create or replace package body Archiver
as

procedure Initialize
as
begin
	select value into ArchiveOption from configurations where config_key = 'ARCHIVER.ALARM.OPTION' ;
	select to_date(value, 'yyyy/mm/dd hh24:mi:ss') into LastArchivedTime from configurations where config_key = 'ARCHIVER.LAST_ARCHIVED_TIME' ;
	select to_number(value) into Bulk_Fetch_Array_Size from configurations where config_key = 'BULK_FETCH_ARRAY_SIZE' ;
	select to_number(value) into Archive_BatchSize from configurations where config_key = 'ARCHIVER.ALARM.BATCH_SIZE' ;
    select count(1) into Alarms_Count from alarm_views where instr (ArchiveOption, status) > 0
            and modified_date > LastArchivedTime ;
end Initialize ;

procedure PopulateArchiverDetails
as
begin
	execute immediate 'truncate table archive_details' ;
	insert /*+ append */ into archive_details(alarm_id, aggregation_type, aggregation_value, reference_id, status)
		select id, aggregation_type, aggregation_value, reference_id, status from 
		(	select A.*, rownum rnum from 
			(	select distinct M.id, T.aggregation_type, T.aggregation_value, M.reference_id, M.status
				from alarm_views M, alerts T 
				where instr (ArchiveOption, status) > 0 
				and T.alarm_id = M.id
				and M.modified_date > LastArchivedTime order by M.id) A
			where rownum <= RecordRow )
		where rnum > (RecordRow - Archive_BatchSize);
	commit;
end PopulateArchiverDetails;

procedure ArchiveAlarmData
IS
begin
	Initialize ;
	loop
		if (RecordRow >= Alarms_Count) then
			exit ;
		end if ;
		RecordRow := RecordRow + Archive_BatchSize ;
		PopulateArchiverDetails ;
		open archive_alarm_id_cursor(ArchiveOption) ;
		loop
			fetch archive_alarm_id_cursor bulk collect into AlarmIDs ;

			ArchiveAlarms ;
			ArchiveAlerts ;
			ArchiveFpAlarms ;
			ArchiveAlarmsWorkflow ;
			ArchiveSmartPatternData ;
			commit ;
			exit when archive_alarm_id_cursor%NOTFOUND ;
		end loop ;
		close archive_alarm_id_cursor ;

		open archive_alarm_cursor(ArchiveOption) ;
		loop
			fetch archive_alarm_cursor bulk collect into AlarmIDs, AggregationTypes, AggregationValues, ReferenceIDs limit Bulk_Fetch_Array_Size ;
			ArchiveAllRecords ;
			commit ;	
			exit when archive_alarm_cursor%NOTFOUND ;
    	end loop ;
		close archive_alarm_cursor ;
		execute immediate 'update configurations set value=to_char(sysdate,''yyyy/mm/dd hh24:mi:ss'') where config_key = ''ARCHIVER.LAST_ARCHIVED_TIME''' ;
		commit ;
    end loop ;
            delete from currently_opened_alarms where alarm_id in (select id from archived_alarms );
end ArchiveAlarmData ;
									
procedure ArchiveAlarms
as
begin
	forall l_i in 1 .. AlarmIDs.count
		insert into archived_alarms (network_id, id, reference_id, case_name, alert_count, created_date,
									 modified_date, status, user_id, owner_type, score, value, cdr_count, pending_time,
									 reference_type, reference_value, is_visible, rule_ids, account_name,
									 subscriber_name, subscriber_group, outstanding_amount, display_value,parent_id,hierarchy_id,fraud_types,rule_tags,
									 assigned_date, analysis_duration)
							  select A.network_id, A.id, reference_id, C.name, alert_count, A.created_date, 
									 A.modified_date, A.status, A.user_id, A.owner_type, A.score, A.value, A.cdr_count, A.pending_time, 
									 reference_type, reference_value, A.is_visible, A.rule_ids, A.account_name,
									 subscriber_name, groups, outstanding_amount, display_value, parent_id, hierarchy_id, fraud_types,
									 rule_tags, assigned_date, a.analysis_duration
							  from alarm_views A, cases C where A.id = AlarmIDs(l_i) and C.network_id(+)= A.network_id 
							  		and A.case_id = C.id(+) ;

	forall l_i in 1 .. AlarmIDs.count 	
		insert into archived_alarm_comments (id, comment_date, user_id, alarm_id, action_id, user_comment,parameters) 
			select id, comment_date, user_id, alarm_id, action_id, user_comment,parameters from alarm_comments 
			where alarm_id = AlarmIDs(l_i) ;
	 
	forall l_i in 1 .. AlarmIDs.count 	
		insert into archived_alarms_fraud_types (alarm_id, fraud_type_id)
			select alarm_view_id, fraud_type_id from alarm_views_fraud_types where alarm_view_id = AlarmIDs(l_i) ;

	forall l_i in 1 .. AlarmIDs.count 	
		insert into archived_alarm_attachments (id, alarm_id, file_name )
			select id, alarm_id, file_name from alarm_attachments where alarm_id = AlarmIDs(l_i) ;
	forall l_i in 1 .. AlarmIDs.count 	
		insert into ar_alarm_link_cdr_details (alarm_id,value,value_count,value_type,create_date,id )
			select alarm_id,value,value_count,value_type,create_date,id from alarm_link_cdr_details where alarm_id = AlarmIDs(l_i) ;

	forall l_i in 1 .. AlarmIDs.count 	
		insert into ar_ml_aq_alarm (id, score, gen_date)
			select id, score, gen_date from ml_aq_alarm where id = AlarmIDs(l_i) ;

	for l_i in 1 .. AlarmIDs.count 	
	loop
		DBMS_OUTPUT.PUT_LINE(AlarmIDs(l_i)) ;
	end loop ;	

end ArchiveAlarms ;

procedure ArchiveSmartPatternData
as
begin
	forall l_i in 1..AlarmIDs.count
		insert into ar_alert_repeat_count_maps (id, alert_id, repeat_count, rule_id, template_id)
			select id, alert_id, repeat_count, rule_id, template_id from alert_repeat_count_maps where alert_id in
			(select id from alerts where alarm_id = AlarmIDs(l_i) ) ;
		
	forall l_i in 1..AlarmIDs.count
		insert into ar_alert_repeat_count_records (alert_repeat_count_map_id, block_record_id, block_record_category, aggregation_value)
			select alert_repeat_count_map_id, block_record_id, block_record_category, aggregation_value
				from alert_repeat_count_records where alert_repeat_count_map_id in
				(select id from alert_repeat_count_maps where alert_id in (select id from alerts
	where alarm_id = AlarmIDs(l_i) )) ;
end ArchiveSmartPatternData ;

procedure ArchiveAlerts
as
begin
	forall l_i in 1 .. AlarmIDs.count 
		insert into archived_alerts(id, alarm_id, event_instance_id, value, cdr_count, 
								repeat_count, cdr_time, created_date, modified_date, 
								score, aggregation_type, aggregation_value, is_smart_pattern, is_part_of_smart_pattern, 
								is_visible, start_day, end_day, summarization_type)
			select id,alarm_id, event_instance_id, value, cdr_count,
					repeat_count, cdr_time, created_date, modified_date,
					score, aggregation_type, aggregation_value, is_smart_pattern, is_part_of_smart_pattern,
					is_visible, start_day, end_day, summarization_type from alerts where alarm_id = AlarmIDs(l_i) ; 

	forall l_i in 1 .. AlarmIDs.count 
		insert into archived_alert_cdr (alert_id, cdr_id, cdr_value,record_category,run_id,aggregation_type,aggregation_value,time_stamp) 
				(select alert_id, cdr_id, cdr_value,record_category,run_id,aggregation_type,aggregation_value,time_stamp from alert_cdr where alert_id in
					(select id from alerts where alarm_id = AlarmIDs(l_i))) ;

	forall l_i in 1 .. AlarmIDs.count 
		insert into ar_observation_summary_records (id, aggregation_type, aggregation_value, alert_id, summary_start_time,
								record_config_id, count, value, cdr_id) 
				(select id, aggregation_type, aggregation_value, alert_id, summary_start_time, record_config_id, count, value, cdr_id
				 	from observation_summary_records where alert_id in
					(select id from alerts where alarm_id = AlarmIDs(l_i))) ;

	forall l_i in 1 .. AlarmIDs.count
		insert into archived_matched_results (id, rule_key, aggregation_value, db_type, MATCH_PERCENTAGE, reference_id, reference_type)
               select mr.id, mr.rule_key, mr.aggregation_value, mr.db_type, mr.MATCH_PERCENTAGE, mr.reference_id, mr.reference_type
                                  from matched_results mr, alarms a,  alert_matched_results_maps amr, alerts al
                                      where mr.reference_id = a.reference_id
									  and mr.id = amr.matched_results_id
				                      and al.id = amr.alert_id
															and a.id = al.alarm_id
                                      and mr.reference_type = a.reference_type
                                      and a.id = AlarmIDs(l_i) ;

	forall l_i in 1 .. AlarmIDs.count
		insert into archived_matched_details (matched_results_id, matched_record, field_ids, field_values, match_types)
				select md.matched_results_id, md.matched_record, md.field_ids, md.field_values, md.match_types from
				matched_details md, matched_results mr, alarms a , alert_matched_results_maps amr, alerts al
                                                                      where a.reference_type = mr.reference_type
																	  and mr.id = amr.matched_results_id
																		and mr.id = md.matched_results_id
																	  and al.id = amr.alert_id
																		and al.alarm_id = a.id
                                                                      and a.reference_id = mr.reference_id
                                                                      and a.id = AlarmIDs(l_i);


 	forall l_i in 1 .. AlarmIDs.count
		insert into ar_alert_matched_results_maps (alert_id, matched_results_id)
			select am.alert_id, am.matched_results_id from alert_matched_results_maps am, alerts a
				where am.alert_id = a.id and a.alarm_id = AlarmIDs(l_i) ;

	forall l_i in 1 .. AlarmIDs.count
		insert into AR_MULTI_FIELD_FUNC_RES_INFO (id, rule_key, threshold_id, record_id, record_category, record_time, field_id, field_value, measured_value)
				select id, rule_key, threshold_id, record_id, record_category, record_time, field_id, field_value, measured_value
				from multiple_field_func_res_info
				where record_id in 	(select distinct cdr_id from alert_cdr where alert_id in
										(select al.id from alerts al, rules r where al.alarm_id = AlarmIDs(l_i)
										 	and r.accumulation_function = CountChangesFunction and al.event_instance_id = r.key
										 	and r.version = (select max(r1.version) from rules r1 where r1.key = r.key)))
					and id not in (select id from ar_multi_field_func_res_info) ;

end ArchiveAlerts;

procedure ArchiveRecordsForCategory(RecordConfigID in number)
IS
	TableName 				varchar2(32) ;
	TmpTableName 				varchar2(32) ;
	ArchivedTableName 		varchar2(30) ;
	Record_Config_Options	varchar2(32) ;
	Last_Record_Processed_Date		    date ;	
	Cleanup_Interval		varchar2(32) ;
	delimeter				varchar2(2) := ',' ;
	start_pos				number := 1 ;
	curr_pos				number ;

	LatestRecordsYear		number(4) ;
	LatestRecordsDofY		number(4) ;
	LastTruncatedDatesYear	number(4) ;
	LastTruncatedDate		date;
	LastTruncatedDofY		number(4) ;

	IsYearWrap             boolean ;
	NormalMin              number(3) ;
	YearStartMin           number(3) ;
	YearEndMin             number(3) ;

	NormalMax              number(3) ;
	YearStartMax           number(3) ;
	YearEndMax             number(3) ;
	MinDofY                number(3) ;
	MaxDofY                number(3) ;

begin
	ExceptionalCase:=false ;
	select tname into TableName from record_configs where id = RecordConfigID;
	TmpTableName:=TableName ;

	begin
		select LOOKUP_TABLE_NAME into TableName from alarm_xdr_maps where record_config_id = RecordConfigID;
		EXCEPTION 
				when NO_DATA_FOUND then
				TableName:=TmpTableName ;
				ExceptionalCase:=true ;
	end ;

	select value into Record_Config_Options from configurations
			where config_key = 'CLEANUP.RECORDS.'||TableName||'.OPTIONS' ;


	tokenizer (start_pos, delimeter, Record_Config_Options, Cleanup_Interval, curr_pos) ;

	Last_Record_Processed_Date := Utility.GETCURRENTPARTITIONDATE(RecordConfigID) ;
	
	LastTruncatedDate := Last_Record_Processed_Date - Cleanup_Interval ;

	select to_char(LastTruncatedDate,'yyyy') into LastTruncatedDatesYear from dual ;
	select to_char(LastTruncatedDate,'ddd') into LastTruncatedDofY from dual ;

	select to_char(Last_Record_Processed_Date,'yyyy') into LatestRecordsYear from dual ;
	select to_char(Last_Record_Processed_Date,'ddd') into LatestRecordsDofY from dual ;

	if (LastTruncatedDatesYear < LatestRecordsYear)
	then
    	IsYearWrap:=true ;
	else
    	IsYearWrap:=false ;
	end if ;

	select LOOKUP_TABLE_NAME into ArchivedTableName from archive_maps  where RECORD_CONFIG_ID = RecordConfigID;
	for i in 1 .. AggregationValues.count
	loop

        select min(start_day),
        min(case when start_day between LastTruncatedDofY and 366 then start_day else 999 end),
        LastTruncatedDofY,
        max(end_day),
        max(case when end_day between LastTruncatedDofY and 366 then end_day else 0 end),
        max(case when end_day between 1 and LatestRecordsDofY then end_day else 0 end)
        into NormalMin,YearEndMin,YearStartMin,NormalMax,YearEndMax,YearStartMax
        from archived_alert_cdr aac, archived_alerts aa 
        where aac.record_category = RecordConfigID and aa.aggregation_value = AggregationValues(i)
		and  aac.alert_id = aa.id 
	        and aa.alarm_id = AlarmIDs(i) ;

		if (NormalMin is null or YearEndMin is null or YearStartMin is null or NormalMax is null
				or YearEndMax is null or YearStartMax is null)
		then
		    return ;
		end if;

	
		if (IsYearWrap = true)
		then
	        if (YearEndMin <> 999)
			then
			    MinDofY:=YearEndMin ;
			else
			    MinDofY:=YearStartMin ;
			end if ;

			if (YearStartMax <> 0)
			then
			    MaxDofY:=YearStartMax ;
			else
			    MaxDofY:=YearEndMax ;
			end if ;
		else
			if ((NormalMin < LastTruncatedDofY) or (NormalMin > LatestRecordsDofY))
			then
				NormalMin:=LastTruncatedDofY ;
			end if ; 

			MinDofY:=NormalMin ;
			MaxDofY:=NormalMax ;
		end if;


		if (MinDofY <= MaxDofY)
		then
			for d in MinDofY .. MaxDofY
			loop
				InsertIntoArchiveRecords(AggregationTypes(i), AggregationValues(i), ArchivedTableName, TableName, d, RecordConfigID, AlarmIDs(i));
			end loop ;
		else
			for d in MinDofY .. 366
			loop
				InsertIntoArchiveRecords(AggregationTypes(i), AggregationValues(i), ArchivedTableName, TableName, d, RecordConfigID, AlarmIDs(i));
			end loop ;

			for d in 1 .. MaxDofy
			loop
				InsertIntoArchiveRecords(AggregationTypes(i), AggregationValues(i), ArchivedTableName, TableName, d, RecordConfigID, AlarmIDs(i));
			end loop ;
		end if ;

	end loop ;

end ArchiveRecordsForCategory ;

procedure InsertIntoArchiveRecords( aggregationType in number, aggregationValue in varchar2, archivedTableName in varchar2, TableName in varchar2, dofy in number,RecordConfigID in number, AlarmID in number)
IS
	Qry 	varchar(2048) ;
	is_spark_support_datastream NUMBER(10) ;
begin
		select is_spark_support into is_spark_support_datastream from record_configs where id = RecordConfigID ;

		if (ExceptionalCase = false)
		then
			Qry := 'insert into '  || archivedTableName || ' select distinct AC.* from  ' || TableName || ' AC, archived_alerts AA where AC.day_of_year='|| dofy || 
					' and AC.ALERT_ID=AA.ID and AA.ALARM_ID = ' ||AlarmID||'and AA.AGGREGATION_TYPE=' || aggregationType ||' and AA.AGGREGATION_VALUE= ''' || aggregationValue || '''' ;
		else
			if(is_spark_support_datastream = 0)
			then
				Qry :=  'insert into ' || archivedTableName || ' select distinct RecordTable.* from (select * from ' || TableName ||
						' where '||utility.GET_FIELD(aggregationType,RecordConfigID) ||'='''|| aggregationValue || 
						''' and day_of_year = '|| dofy ||
						' and not exists (select 1 from ' || archivedTableName || ' where '|| archivedTableName || '.id = '||TableName || 
						'.id and '||utility.GET_FIELD(aggregationType,RecordConfigID) ||'='''|| aggregationValue||''' )) RecordTable, 
						(select distinct cdr_id cid from archived_alert_cdr aac, archived_alerts aa 
							where aac.record_category = '|| RecordConfigID || ' and aa.aggregation_value ='''||aggregationValue|| ''' and  aac.alert_id = aa.id and aa.alarm_id = '|| AlarmID || '
						) RecordIDs where RecordTable.id=RecordIDs.cid' ;
			else
				Qry :=  'insert into ' || archivedTableName || ' select distinct RecordTable.* from (select * from ' || TableName ||
						' where '||utility.GET_FIELD(aggregationType,RecordConfigID) ||'='''|| aggregationValue || 
						''' and day_of_year = '|| dofy ||
						' and not exists (select 1 from ' || archivedTableName || ' where '|| archivedTableName || '.id = '||TableName || 
						'.cdr_id and '||utility.GET_FIELD(aggregationType,RecordConfigID) ||'='''|| aggregationValue||''' )) RecordTable, 
						(select distinct cdr_id cid from archived_alert_cdr aac, archived_alerts aa 
							where aac.record_category = '|| RecordConfigID || ' and aa.aggregation_value ='''||aggregationValue|| ''' and  aac.alert_id = aa.id and aa.alarm_id = '|| AlarmID || '
						) RecordIDs where RecordTable.id=RecordIDs.cid' ;
			end if ;
		end if ;

		execute immediate Qry ;
		exception when others then
			dbms_output.put_line (substr ('Error : ' || sqlcode || '-' || sqlerrm, 1, 250)) ;

end InsertIntoArchiveRecords ; 

procedure ArchiveAllRecords
IS
	cursor participated_record_config_ids is
	select distinct record_category as id from archived_alert_cdr 
	where alert_id in (select id from archived_alerts where alarm_id in (select alarm_id from archive_details)) ;
begin
	for RecordConfig in participated_record_config_ids
	loop
		if RecordConfig.id not in (RangerDefs.subscriber_record_config_id, RangerDefs.match_result_record_config_id)
		then
			ArchiveRecordsForCategory(RecordConfig.id) ;
		end if ;
	end loop ;
end ArchiveAllRecords ;

PROCEDURE ArchiveFpAlarms
IS	
	cursor fp_alert_cursor(alarmid varchar2) is 
		select alert_id, profile_match_index_id, rules.aggregation_type
			from alerts, alert_profile_match_index_maps, rules
			where alerts.alarm_id = alarmid 
				and alert_profile_match_index_maps.alert_id = alerts.id 
				and rules.id = (select max(id) from rules where key = alerts.event_instance_id and category = 'FINGERPRINT_RULE') ;

	fpalertcursor fp_alert_cursor%ROWTYPE;
BEGIN
	for id in 1..AlarmIDs.count
	loop
		open fp_alert_cursor(AlarmIDs(id)) ;
		loop
			FETCH fp_alert_cursor INTO fpalertcursor ;
			EXIT WHEN fp_alert_cursor%NOTFOUND ;
			ArchiveProfileTables(fpalertcursor.alert_id, fpalertcursor.profile_match_index_id, fpalertcursor.aggregation_type) ;
	  	end loop ;
		close fp_alert_cursor ;
	end loop ;		
  	exception
	when others then
  		dbms_output.put_line(sqlerrm) ;
END ArchiveFpAlarms ;

PROCEDURE ArchiveProfileTables(AlertID in number, ProfileMatchIndexID in number, AggregationType in number) 
IS
	EntityID 				number(20) ;
	EntityProfileVersion	number(20) ;
  BEGIN
		select profiled_entity_id, entity_profile_version INTO EntityID, EntityProfileVersion
			from profile_match_index 
			where id = ProfileMatchIndexID ;

		insert into archived_profile_match_index 
			select * from profile_match_index 
				where id = ProfileMatchIndexID ;
								
		insert into archived_profile_match_detail 
			select * from profile_match_detail 
				where profile_match_index_id = ProfileMatchIndexID ;
								
		insert into archived_fp_profiles 
			select * from fp_profiles FP
				where entity_id = AggregationType and profiled_entity_id = EntityID 
					and version = EntityProfileVersion 
					and is_match_type = 0 
					and GENERATED_DATE = (select max(GENERATED_DATE) from fp_profiles 
									where profiled_entity_id = FP.profiled_entity_id and entity_id = FP.entity_id and version = FP.version)
					and not exists (select 1 from archived_fp_profiles where entity_id = AggregationType and profiled_entity_id = EntityID 
						and version = EntityProfileVersion and is_match_type = 0) ;

		insert into AR_ALERT_PROFILE_MATCH_INDEX 
			select * from alert_profile_match_index_maps
				where alert_id = AlertID and profile_match_index_id = ProfileMatchIndexID ;  
				
	COMMIT;
    EXCEPTION
    	WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
	COMMIT;
END ArchiveProfileTables ;

PROCEDURE ArchiveAlarmsWorkflow
IS
	BEGIN
		for id in 1.. AlarmIDs.count
		loop
			insert into archived_workflow_transactions (id, alarm_id, activity_id, user_id, actual_completion_date, expected_completion_date, 
													status, position, is_mandatory)
											select id, alarm_id, activity_id, user_id, actual_completion_date, expected_completion_date,
												   status, position, is_mandatory 
										    from workflow_transactions where alarm_id = AlarmIDs(id) ;


			insert into	archived_alarm_activity_logs (id, alarm_id, activity_id, activity_description, log_date,
														log_message, user_id)
											select id, alarm_id, activity_id, activity_description, log_date, log_message, user_id 
											from alarm_activity_logs where alarm_id = AlarmIDs(id) ;
		end loop ; 
		ArchiveWorkflowActivities ;
	COMMIT;
    EXCEPTION
    	WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
	COMMIT;
END ArchiveAlarmsWorkflow ;

PROCEDURE ArchiveWorkflowActivities 
IS
	cursor activities_cursor(alarmid varchar2) is select activity_id from archived_workflow_transactions where alarm_id = alarmid ; 
	activitiescursor activities_cursor%ROWTYPE;
BEGIN
	for id in 1..AlarmIDs.count
	loop
		open activities_cursor(AlarmIDs(id)) ;
		loop
			FETCH activities_cursor INTO activitiescursor ;
			EXIT WHEN activities_cursor%NOTFOUND ;
			insert into archived_activities(id, name, description, jeopardy_period, activity_template_id, is_automatic) 
					select id, name, description, jeopardy_period, activity_template_id, is_automatic 
					from activities 
					where id = activitiescursor.activity_id and 
							not exists (select 1 from archived_activities where archived_activities.id = activitiescursor.activity_id) ;
	  	end loop ;
		close activities_cursor ;
	end loop ;		
	COMMIT;
    EXCEPTION
    	WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM) ;
	COMMIT;
END ArchiveWorkflowActivities ;

end Archiver ;
/
show error;

spool off;

commit ;
