--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2006. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written *
-- *	permission from Subex Azure Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/

set serveroutput on ;
CREATE OR REPLACE PACKAGE CDRSummary
AS
	INROAMER				constant number  := 6 ; 
	OUTROAMER				constant number  := 5 ; 
	NRTRDE					constant number  := 9 ; 
	CDR_SUMMARY_TABLE_TYPE  constant number  := 1 ;

	current_week					 number  ;
	offpeak_band_id					 number  ;
	input_day_of_year				 number  ;
	fetched_sdr_value				 number  ;
	cdrsummary_band_id				 number  ;
	table_name						varchar2(50) := ' ' ;
	
	PROCEDURE Initialize(summary_date in varchar2) ; 
	PROCEDURE MergeIntoSummary(input_date in VARCHAR) ;
	PROCEDURE UpdateSummaryInfo(input_date in Date) ;
	PROCEDURE CleanUpOldRecords(input_date in Date) ;

END CDRSummary ;
/
show error;

CREATE OR REPLACE PACKAGE BODY CDRSummary AS

	PROCEDURE Initialize(summary_date in varchar2)
	AS
	BEGIN

		if (nvl(summary_date, ' ') = ' ') then
			current_week := to_number(to_char(sysdate-1, 'iw'));
		else
			current_week := to_number(to_char(to_date(summary_date, 'dd-mm-yyyy'), 'iw'));
		end if ;
	 
		begin
			select TABLE_NAME  into table_name from SUMMARY_MAPS where WEEK_OF_YEAR = current_week and TABLE_TYPE = CDR_SUMMARY_TABLE_TYPE;
		exception
			when no_data_found then
				table_name := ' ' ;
			WHEN OTHERS THEN
				table_name := ' ' ;
		end ;

		begin
			select sdr_value into fetched_sdr_value from sdr_rates
				where input_day_of_year >= to_number(to_char(start_date, 'ddd'))
				and rownum = 1 order by start_date desc;
		exception
			when no_data_found then
				fetched_sdr_value := 1 ;
		end ;
		
		begin
			select distinct id into offpeak_band_id from band
				where description = 'OFFPEAK.USAGE';
		exception
			when no_data_found then
				offpeak_band_id := 999 ;
		end ;

		begin
			select id into cdrsummary_band_id from band
				where description = 'CDRSUMMARY.DEFAULT';
		exception	
			when no_data_found then
				cdrsummary_band_id := 0 ;
		end ;

	END Initialize ;


	PROCEDURE MergeIntoSummary(input_date in VARCHAR)
	AS
		merge_query		varchar2(3000) := '' ;
	BEGIN
			
			merge_query := '' ;	
			merge_query := 'merge  /*+ append */ into ' || table_name || ' s ';
			merge_query := merge_query || '		using ';
			merge_query := merge_query || '			( ';
			merge_query := merge_query || '			  select ';
			merge_query := merge_query || '				 BAND_ID, ';
			merge_query := merge_query || '				 NETWORK_ID, ';
			merge_query := merge_query || '				 PHONE_NUMBER, ';
			merge_query := merge_query || '				 CALL_TYPE, ';
			merge_query := merge_query || '				 RECORD_TYPE, ';
			merge_query := merge_query || '			 CDR_TYPE , ';
			merge_query := merge_query || '			 SUBSCRIBER_ID, ';
			merge_query := merge_query || '			 sum(decode(cdr_type, ' || INROAMER || ', (total_value * ' || fetched_sdr_value || '), total_value)) as total_value, ';
			merge_query := merge_query || '			 sum(TOTAL_DURATION) as TOTAL_DURATION, ';
			merge_query := merge_query || '			 sum(TOTAL_COUNT) as TOTAL_COUNT, ';
			merge_query := merge_query || '			 VPMN ';
			merge_query := merge_query || '			from nik_merge_temp group by BAND_ID,NETWORK_ID,PHONE_NUMBER,CALL_TYPE,RECORD_TYPE,CDR_TYPE, SUBSCRIBER_ID,VPMN ';
			merge_query := merge_query || '		) mt ';
			merge_query := merge_query || '	on ( ';
			merge_query := merge_query || '				s.week = ' || current_week ;
			merge_query := merge_query || '				and s.band_id = mt.band_id ';
			merge_query := merge_query || '				and s.network_id = mt.network_id ';
			merge_query := merge_query || '				and s.phone_number = mt.phone_number ';
			merge_query := merge_query || '				and s.subscriber_id = mt.subscriber_id ';
			merge_query := merge_query || '				and s.cdr_type = mt.cdr_type ';
			merge_query := merge_query || '				and s.type_id = decode (mt.cdr_type, ' || OUTROAMER || ', 200 + mt.call_type, ' || INROAMER || ' , decode(mt.band_id, ' || cdrsummary_band_id || ', 300, 300 + mt.call_type), ' || NRTRDE || ', 400 + mt.call_type, mt.call_type) ';
			merge_query := merge_query || '				and s.record_type = mt.record_type ';
			merge_query := merge_query || '				and s.call_type = mt.call_type ';
			merge_query := merge_query || '		) ';
			merge_query := merge_query || '	when matched then ';
			merge_query := merge_query || '	update ';
			merge_query := merge_query || '	set     s.total_value     = mt.total_value + s.total_value, ';
			merge_query := merge_query || '			s.total_duration  = mt.total_duration + s.total_duration, ';
			merge_query := merge_query || '			s.total_count     = mt.total_count + s.total_count ';
			merge_query := merge_query || '	when not matched then ';
			merge_query := merge_query || '	insert ';
			merge_query := merge_query || '		( band_id, network_id, vpmn, cdr_type, phone_number, type_id, record_type, ';
			merge_query := merge_query || '		  subscriber_id, total_value, total_duration, total_count, week,call_type) ';
			merge_query := merge_query || '		values ';
			merge_query := merge_query || '		( mt.band_id, mt.network_id, mt.vpmn, mt.cdr_type, mt.phone_number, ';
			merge_query := merge_query || '		  decode(mt.cdr_type, ' || OUTROAMER || ', 200 + mt.call_type, ' || INROAMER || ', decode(mt.band_id, ' || cdrsummary_band_id || ', 300, 300 + mt.call_type), ' || NRTRDE || ', 400 +mt.call_type, mt.call_type), ';
			merge_query := merge_query || '		  mt.record_type, mt.subscriber_id, mt.total_value, mt.total_duration,
			mt.total_count, ' || current_week || ',mt.call_type ';
			merge_query := merge_query || '		) ';

			EXECUTE IMMEDIATE merge_query ;

				commit ;

				CDRSummary.CleanUpOldRecords(to_date(input_date, 'dd-mm-yyyy')) ;
				CDRSummary.UpdateSummaryInfo(to_date(input_date, 'dd-mm-yyyy')) ;

	END MergeIntoSummary ;

	PROCEDURE UpdateSummaryInfo(input_date in Date)
	AS
	BEGIN

		SummaryData.set_last_updated_info ('SUMMARY_LAST_UPDATED_WEEK', input_date) ;
		commit ;

	END UpdateSummaryInfo ;

	PROCEDURE CleanUpOldRecords(input_date in Date)
	   AS
	   BEGIN
	       SummaryData.delete_old_data(input_date, 'SUMMARY' , 'SUMMARY_LAST_UPDATED_WEEK') ;
	       commit ;
	   END CleanUpOldRecords ;

END CDRSummary ;
/
show error;

