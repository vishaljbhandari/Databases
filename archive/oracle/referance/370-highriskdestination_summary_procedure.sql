--Generated from ./highriskdestination_summary_procedure.sql.parse.in by setup.sh at Fri Sep 13 00:48:53 IST 2019
-- /*******************************************************************************
--  *	Copyright (c) Subex Systems Limited 2005. All rights reserved.	            *
--  *	The copyright to the computer program(s) herein is the property of Subex    *
--  *	Systems Limited. The program(s) may be used and/or copied with the written  *
--  *	permission from Subex Systems Limited or in accordance with the terms and   *
--  *	conditions stipulated in the agreement/contract under which the program(s)  *
--  *	have been supplied.                                                         *
--  *******************************************************************************/
SPOOL highriskdestination_summary_procedure.log 
 
set serveroutput off 
SET FEEDBACK OFF 
create or replace procedure HighRiskDestSummary(summary_run_date in date)
is
	l_summary_table1_name	constant varchar2 (32) := 'geographic_position_summary' ;
	l_summary_table2_name	constant varchar2 (32) := 'country_summary' ;
	l_summary_conf_id		constant varchar2 (64) := 'HIGHRISK_DESTINATION_SUMMARY_LAST_UPDATED_WEEK' ;
	v_aggregation_field		varchar2(64) ;
	summary_date date := trunc(summary_run_date) ;


	cursor alarm_agg_cursor(p_status in number, summary_date in date) is
		select distinct T.aggregation_type
		from alarms M, alerts T
		where M.status = p_status
		and trunc (M.modified_date) = summary_date
		and T.alarm_id = M.id ;
	alarm_agg_record alarm_agg_cursor%ROWTYPE ;
	begin
	SummaryData.delete_old_data (summary_date, l_summary_table1_name, l_summary_conf_id) ;
	SummaryData.delete_old_data (summary_date, l_summary_table2_name, l_summary_conf_id) ;
	commit;


	execute immediate 'truncate table temp_highrisk_dest_summary' ;
	execute immediate 'truncate table highriskcdr_temp ' ;
	open alarm_agg_cursor(RangerDefs.frd,summary_date) ;
	loop
	begin
		fetch alarm_agg_cursor into alarm_agg_record ;
		exit when alarm_agg_cursor%NOTFOUND ;
		v_aggregation_field := utility.GET_FIELD(alarm_agg_record.aggregation_type, RangerDefs.cdr_category) ;

		execute immediate '
                merge into highriskcdr_temp htmp using
                (
            select  distinct 
			 C.ID,
			C.NETWORK_ID,C.CALLER_NUMBER,C.CALLED_NUMBER,C.FORWARDED_NUMBER,C.RECORD_TYPE,
			C.DURATION,C.TIME_STAMP,C.EQUIPMENT_ID,C.IMSI_NUMBER,C.GEOGRAPHIC_POSITION,C.CALL_TYPE,C.SUBSCRIBER_ID,
			 C.VALUE,
			C.CDR_TYPE,C.SERVICE_TYPE,C.CDR_CATEGORY,C.IS_COMPLETE,C.IS_ATTEMPTED,C.SERVICE,C.PHONE_NUMBER,C.DAY_OF_YEAR,C.HOUR_OF_DAY,
			C.OTHER_PARTY_COUNTRY_CODE,C.VPMN
			from alarm_cdr C,
                (
                    select A.alert_id, B.alarm_id, A.cdr_id, B.aggregation_value
                    from alert_cdr A,
                        (
                            select id as alert_id, alarm_id, aggregation_value
                            from alerts
                            where alarm_id in
                                (
                                    select id
                                    from alarms
                                    where status in('||RangerDefs.frd||','||RangerDefs.nfr||')
                                        and trunc (modified_date) = :SummaryDate
                                )
                            and aggregation_type = :AggregationType
                        ) B
                    where A.alert_id = B.alert_id
                    and A.record_category = '||RangerDefs.cdr_category||'
                ) T
            where C.'|| v_aggregation_field ||' = T.aggregation_value
              and C.id = T.cdr_id
		and C.alert_id = T.alert_id
                and record_type in ('||RangerDefs.incoming||', '||RangerDefs.outgoing||', '||RangerDefs.forwarded||')
                )altemp
                on
                (
                        htmp.ID = altemp.ID
                )
                when matched then
					update set SUBSCRIBER_ID=altemp.SUBSCRIBER_ID
                when not matched then
                        insert ( ID, NETWORK_ID, CALLER_NUMBER, CALLED_NUMBER, FORWARDED_NUMBER, RECORD_TYPE,
                         DURATION, TIME_STAMP, EQUIPMENT_ID, IMSI_NUMBER, GEOGRAPHIC_POSITION, CALL_TYPE, SUBSCRIBER_ID,
                                VALUE, CDR_TYPE, SERVICE_TYPE, CDR_CATEGORY, IS_COMPLETE, IS_ATTEMPTED, SERVICE,
                                PHONE_NUMBER, DAY_OF_YEAR, HOUR_OF_DAY, OTHER_PARTY_COUNTRY_CODE, VPMN)
                        values (altemp.ID,   altemp.NETWORK_ID, altemp.CALLER_NUMBER, altemp.CALLED_NUMBER, altemp.FORWARDED_NUMBER, altemp.RECORD_TYPE,
           altemp.DURATION, altemp.TIME_STAMP, altemp.EQUIPMENT_ID, altemp.IMSI_NUMBER, altemp.GEOGRAPHIC_POSITION, altemp.CALL_TYPE, altemp.SUBSCRIBER_ID,
                       altemp.VALUE, altemp.CDR_TYPE, altemp.SERVICE_TYPE, altemp.CDR_CATEGORY, altemp.IS_COMPLETE, altemp.IS_ATTEMPTED, altemp.SERVICE,
                                altemp.PHONE_NUMBER, altemp.DAY_OF_YEAR, altemp.HOUR_OF_DAY, altemp.OTHER_PARTY_COUNTRY_CODE, altemp.VPMN) 
			' using summary_date,alarm_agg_record.aggregation_type ;
	commit ;
	exception
	when invalid_number then 
	null;
	end;
	end loop ;
	close alarm_agg_cursor ;


	open alarm_agg_cursor(RangerDefs.frd,summary_date) ;
	loop
	begin
		fetch alarm_agg_cursor into alarm_agg_record ;
		exit when alarm_agg_cursor%NOTFOUND ;
		v_aggregation_field := utility.GET_FIELD(alarm_agg_record.aggregation_type, RangerDefs.cdr_category) ;

		execute immediate '
		merge into temp_highrisk_dest_summary thds using
		(
			select
		  /*+ parallel */
				network_id, decode (record_type, '||RangerDefs.incoming||', 1, 2) as type_id,
				to_number (to_char (time_stamp, ''iw'')) week, geographic_position,
				decode (call_type, '||RangerDefs.international||',
					pkg_country.get_code (decode (record_type,
												'||RangerDefs.incoming||', caller_number,
												'||RangerDefs.outgoing||', called_number,
												'||RangerDefs.forwarded||', forwarded_number,
												null
												)
										),
					null
				) as country_code,
				decode (geographic_position, null,
					sum (decode (call_type, '||RangerDefs.international||', value, 0)),
					sum (value)
				) as total_value,
				decode (geographic_position, null,
					sum (decode (call_type, '||RangerDefs.international||', duration, 0)),
					sum (duration)
				) as total_duration,
				decode (geographic_position, null,
					count (distinct decode (call_type, '||RangerDefs.international||', id, 0))
						- max (distinct decode (call_type, '||RangerDefs.international||', 0, 1)),
					count (id)
				) as total_frd_cdr_count,
				decode (geographic_position, null,
					count (distinct decode (call_type, '||RangerDefs.international||', T.alert_id, 0))
						- max (distinct decode (call_type, '||RangerDefs.international||', 0, 1)),
					count (distinct T.alert_id)
				) as total_alert_count,
				decode (geographic_position, null,
					count (distinct decode (call_type, '||RangerDefs.international||', T.alarm_id, 0))
						- max (distinct decode (call_type, '||RangerDefs.international||', 0, 1)),
					count (distinct T.alarm_id)
				) as total_callers
			from highriskcdr_temp C,
				(
					select A.alert_id, B.alarm_id, A.cdr_id, B.aggregation_value, B.aggregation_type
					from alert_cdr A,
						(
							select id as alert_id, alarm_id, aggregation_value, aggregation_type
							from alerts
							where alarm_id in
								(
									select id
									from alarms
									where status = '||RangerDefs.frd||'
										and trunc (modified_date) = :SummaryDate
								)
							and aggregation_type = :AggregationType
						) B
					where A.alert_id = B.alert_id
					and A.record_category = '||RangerDefs.cdr_category||'
				) T
			where C.'|| v_aggregation_field ||' = T.aggregation_value
				and C.id = T.cdr_id
				and record_type in ('||RangerDefs.incoming||', '||RangerDefs.outgoing||', '||RangerDefs.forwarded||')
			group by network_id, decode (record_type, '||RangerDefs.incoming||', 1, 2), to_char (time_stamp, ''iw''),
				grouping sets
				(
					geographic_position,
					decode (call_type, '||RangerDefs.international||',
						pkg_country.get_code (decode (record_type,
													'||RangerDefs.incoming||', caller_number,
													'||RangerDefs.outgoing||', called_number,
													'||RangerDefs.forwarded||', forwarded_number,
													null
													)
											),
						null
					)
				)
		)thds1
		on (
			thds.NETWORK_ID = thds1.NETWORK_ID and
			thds.WEEK = thds1.WEEK and
			thds.TYPE_ID = thds1.TYPE_ID and 
			nvl(thds.GEOGRAPHIC_POSITION, ''NULL'') = nvl(thds1.GEOGRAPHIC_POSITION, ''NULL'') and
			nvl(thds.COUNTRY_CODE, ''NULL'') = nvl(thds1.COUNTRY_CODE, ''NULL'')
		)
		when matched then
			update set 
				TOTAL_VALUE = TOTAL_VALUE + thds1.TOTAL_VALUE,
				TOTAL_DURATION = TOTAL_DURATION + thds1.TOTAL_DURATION , 
				TOTAL_FRD_CDR_COUNT = TOTAL_FRD_CDR_COUNT + thds1.TOTAL_FRD_CDR_COUNT, 
				TOTAL_ALERT_COUNT = TOTAL_ALERT_COUNT + thds1.TOTAL_ALERT_COUNT,
				TOTAL_CALLERS = TOTAL_CALLERS + thds1.TOTAL_CALLERS
		when not matched then 
			insert	(NETWORK_ID, TYPE_ID, WEEK, GEOGRAPHIC_POSITION, COUNTRY_CODE, TOTAL_VALUE, 
					TOTAL_DURATION, TOTAL_FRD_CDR_COUNT, TOTAL_ALERT_COUNT, TOTAL_CALLERS)
			values ( thds1.NETWORK_ID, thds1.TYPE_ID, thds1.WEEK, thds1.GEOGRAPHIC_POSITION, 
				thds1.COUNTRY_CODE, thds1.TOTAL_VALUE, thds1.TOTAL_DURATION, thds1.TOTAL_FRD_CDR_COUNT, 
				thds1.TOTAL_ALERT_COUNT, thds1.TOTAL_CALLERS ) 
	' using summary_date, alarm_agg_record.aggregation_type;
	commit ;
	exception
	when invalid_number then
	null;
	end;
	end loop ;
	close alarm_agg_cursor ;

	merge into geographic_position_summary G
	using
	(
		select *
		from temp_highrisk_dest_summary
		where geographic_position is not null
	) S
	on
	(
		G.network_id = S.network_id
		and G.geographic_position = S.geographic_position
		and G.type_id = S.type_id
		and G.week = S.week
	)
	when matched then
		update set
			G.total_value = G.total_value +	S.total_value,
			G.total_duration = G.total_duration + S.total_duration,
			G.total_frd_cdr_count = G.total_frd_cdr_count +	S.total_frd_cdr_count,
			G.total_alert_count = G.total_alert_count + S.total_alert_count,
			G.total_callers = G.total_callers + S.total_callers,
			G.total_investigated_records = G.total_investigated_records + S.total_frd_cdr_count
	when not matched then
		insert values
		(
			S.network_id, S.geographic_position, S.type_id, S.week,
			S.total_value, S.total_duration, S.total_frd_cdr_count, S.total_alert_count, S.total_callers, S.total_frd_cdr_count
		) ;
	commit ;
	merge into country_summary C
	using
	(
		select *
		from temp_highrisk_dest_summary
		where country_code is not null
	) S
	on
	(
		C.network_id = S.network_id
		and C.country_code = S.country_code
		and C.type_id = S.type_id
		and C.week = S.week
	)
	when matched then
		update set
			C.total_value = C.total_value +	S.total_value,
			C.total_duration = C.total_duration + S.total_duration,
			C.total_frd_cdr_count = C.total_frd_cdr_count +	S.total_frd_cdr_count,
			C.total_alert_count = C.total_alert_count + S.total_alert_count,
			C.total_callers = C.total_callers + S.total_callers,
			C.total_investigated_records = C.total_investigated_records + S.total_frd_cdr_count
	when not matched then
		insert values
		(
			S.network_id, S.country_code, S.type_id, S.week,
			S.total_value, S.total_duration, S.total_frd_cdr_count, S.total_alert_count, S.total_callers, S.total_frd_cdr_count
		) ;
	commit;
	SummaryData.set_last_updated_info (l_summary_conf_id, summary_date) ;
	execute immediate 'truncate table temp_highrisk_dest_summary' ;
	execute immediate 'truncate table investigated_record' ;
	open alarm_agg_cursor(RangerDefs.nfr,summary_date) ;
	loop
	begin
		fetch alarm_agg_cursor into alarm_agg_record ;
		exit when alarm_agg_cursor%NOTFOUND ;
		v_aggregation_field := utility.GET_FIELD(alarm_agg_record.aggregation_type, RangerDefs.cdr_category) ;
		execute immediate '
		insert /*+ append */ into investigated_record
		(
			select 
	 		/*+ parallel */ 
				network_id, decode (record_type, '||RangerDefs.incoming||', 1, 2) as type_id,
				to_number (to_char (time_stamp, ''iw'')) as week, geographic_position,
				decode (call_type, '||RangerDefs.international||',
					pkg_country.get_code (decode (record_type,
												'||RangerDefs.incoming||', caller_number,
												'||RangerDefs.outgoing||', called_number,
												'||RangerDefs.forwarded||', forwarded_number,
												null
												)
										),
					null
				) as country_code,
				decode (geographic_position, null,
					count (distinct decode (call_type, '||RangerDefs.international||', id, 0))
						- max (distinct decode (call_type, '||RangerDefs.international||', 0, 1)),
					count (id)
				) as record_count
			from highriskcdr_temp C,
				(
					select A.alert_id, B.alarm_id, A.cdr_id, B.aggregation_value
					from alert_cdr A,
						(
							select id as alert_id, alarm_id, aggregation_value
							from alerts
							where alarm_id in
								(
									select id
									from alarms
									where status = '||RangerDefs.nfr||'
										and trunc (modified_date) = :SummaryDate
								)
							and aggregation_type = :AggregationType
						) B
					where A.alert_id = B.alert_id
					and A.record_category = '||RangerDefs.cdr_category||'
				) T
			where C.'|| v_aggregation_field ||' = T.aggregation_value
				and C.id = T.cdr_id
				and record_type in ('||RangerDefs.incoming||', '||RangerDefs.outgoing||', '||RangerDefs.forwarded||')
			group by network_id, decode (record_type, '||RangerDefs.incoming||', 1, 2), to_char (time_stamp, ''iw''),
				grouping sets
				(
					geographic_position,
					decode (call_type, '||RangerDefs.international||',
						pkg_country.get_code (decode (record_type,
													'||RangerDefs.incoming||', caller_number,
													'||RangerDefs.outgoing||', called_number,
													'||RangerDefs.forwarded||', forwarded_number,
													null
													)
											),
						null
					)
				)
		)' using summary_date, alarm_agg_record.aggregation_type;
	commit ;
	exception
	when invalid_number then
	null;
	end;
	end loop ;
	close alarm_agg_cursor ;

	update geographic_position_summary G
	set G.total_investigated_records =
		nvl((
			select G.total_investigated_records + record_count
			from investigated_record
			where geographic_position is not null
				and network_id = G.network_id
				and type_id = G.type_id
				and week = G.week
				and geographic_position = G.geographic_position
		), G.total_investigated_records) ;
	update country_summary C
	set C.total_investigated_records =
		nvl((
			select C.total_investigated_records + record_count
			from investigated_record
			where country_code is not null
				and network_id = C.network_id
				and type_id = C.type_id
				and week = C.week
				and country_code = C.country_code
		), C.total_investigated_records) ;
	commit ;
	execute immediate 'truncate table investigated_record' ;
end HighRiskDestSummary;
/
commit ;
