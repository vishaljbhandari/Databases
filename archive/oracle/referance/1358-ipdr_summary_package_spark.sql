--/*******************************************************************************
-- *	Copyright (c) Subex Azure Limited 2006. All rights reserved.	           *
-- *	The copyright to the computer program(s) herein is the property of Subex   *
-- *	Azure Limited. The program(s) may be used and/or copied with the written *
-- *	permission from Subex Azure Limited or in accordance with the terms and  *
-- *	conditions stipulated in the agreement/contract under which the program(s) *
-- *	have been supplied.                                                        *
-- *******************************************************************************/

SPOOL ipdr_summary_package.log
SET SERVEROUTPUT ON ;

CREATE OR REPLACE PACKAGE IPDRSummary
AS
	IPDR_SUMMARY_TABLE_TYPE  constant number  := 2 ;
    network_id                      NUMBER(20) ;
    subscriber_id                   NUMBER(20) ;
    phone_number                    VARCHAR(40) ;
    duration                        NUMBER(20) ;
    session_start_date              DATE ;
    session_end_date                DATE ;
    session_id                      VARCHAR(30) ;
    download_data_volume            VARCHAR(20) ;
    upload_data_volume              VARCHAR(20) ;
    ipdr_type                       NUMBER(10) ;
    user_name                       VARCHAR(20) ;
    value                           NUMBER(30,6) ;
	current_week					NUMBER(5) ;
	input_date						DATE  ;
	summary_table						varchar2(50) := ' ' ;


	PROCEDURE Initialize(summary_date varchar2) ;
	PROCEDURE MergeIntoSummary ;
	PROCEDURE UpdateSummaryInfo ;
	PROCEDURE CleanUpOldRecords ;
END IPDRSummary ;
/

CREATE OR REPLACE PACKAGE BODY IPDRSummary AS

	PROCEDURE Initialize(summary_date varchar2)
	AS
	BEGIN
		if (nvl(summary_date, ' ') = ' ') then
			current_week := to_number(to_char(sysdate-1, 'iw'));
			input_date := sysdate - 1 ;
		else
			current_week := to_number(to_char(to_date(summary_date, 'dd-mm-yyyy'), 'iw'));
			input_date := to_date(summary_date, 'dd-mm-yyyy') ;
		end if ;
    
		begin
			select TABLE_NAME  into summary_table from SUMMARY_MAPS where WEEK_OF_YEAR = current_week and TABLE_TYPE = IPDR_SUMMARY_TABLE_TYPE;
		exception
			when no_data_found then
				summary_table := ' ' ;
			WHEN OTHERS THEN
				summary_table := ' ' ;
		end ;

	END Initialize ;


	PROCEDURE MergeIntoSummary 
	AS
		query_part1		varchar2(3000) := '' ;
		query_part2		varchar2(3000) := '' ;
		table_part		varchar2(3000) := '' ;
		table_choice	number(10) := 1 ;
	BEGIN
		query_part1 := query_part1 || ' merge /*+ parallel(s,4), append */ into ' || summary_table || ' s';
		query_part1 := query_part1 || ' using ( ';
		query_part1 := query_part1 || ' 	select ';
		query_part1 := query_part1 || ' 				network_id,';
		query_part1 := query_part1 || ' 				subscriber_id,';
		query_part1 := query_part1 || ' 				phone_number,';
		query_part1 := query_part1 || ' 				session_start_date, ';
		query_part1 := query_part1 || ' 				session_end_date,';
		query_part1 := query_part1 || ' 				total_duration,';
		query_part1 := query_part1 || ' 				upload_data_volume, ';
		query_part1 := query_part1 || ' 				download_data_volume, ';
		query_part1 := query_part1 || ' 				ipdr_type, ';
		query_part1 := query_part1 || ' 				value,';
		query_part1 := query_part1 || ' 				user_name, ';
		query_part1 := query_part1 || ' 				session_id';
		table_part := table_part || '    	from nik_ipdr_merge_temp ';

		query_part2 := query_part2 || ' ) c ';
		query_part2 := query_part2 || ' on (';
		query_part2 := query_part2 || ' 			s.week = :current_week';
		query_part2 := query_part2 || ' 			and s.network_id = c.network_id';
		query_part2 := query_part2 || ' 			and s.phone_number = c.phone_number';
		query_part2 := query_part2 || ' 			and s.subscriber_id = c.subscriber_id';
	    query_part2 := query_part2 || '             AND s.session_id = c.session_id';
		query_part2 := query_part2 || ' 	)';
		query_part2 := query_part2 || ' when matched then';
		query_part2 := query_part2 || ' update set ';
		query_part2 := query_part2 || ' 		s.duration  = c.total_duration + s.duration,';
		query_part2 := query_part2 || ' 		s.value  = c.value + s.value,';
		query_part2 := query_part2 || ' 		s.upload_data_volume  = c.upload_data_volume + s.upload_data_volume,';
		query_part2 := query_part2 || ' 		s.download_data_volume  = c.download_data_volume + s.download_data_volume,';
		query_part2 := query_part2 || ' 		s.end_date = session_end_date';
		query_part2 := query_part2 || ' when not matched then';
		query_part2 := query_part2 || ' insert';
		query_part2 := query_part2 || ' (network_id, subscriber_id, phone_number, start_date, end_date,';
		query_part2 := query_part2 || '                                             duration, upload_data_volume, download_data_volume, ipdr_type, week,';
		query_part2 := query_part2 || ' 											value, user_name, session_id) values ';
		query_part2 := query_part2 || ' 	(c.network_id, c.subscriber_id, c.phone_number, c.session_start_date, c.session_end_date,';
		query_part2 := query_part2 || ' 	                                             c.total_duration, c.upload_data_volume, c.dOWNLOAD_DAta_volume, c.ipdr_type,';
		query_part2 := query_part2 || ' 												 :current_week, c.value, c.user_name, c.session_id) ';

		EXECUTE IMMEDIATE query_part1||table_part||query_part2 USING current_week, current_week ;
	COMMIT ;
	END MergeIntoSummary ;

	PROCEDURE UpdateSummaryInfo 
	AS
	BEGIN

		SummaryData.set_last_updated_info ('IPDR_SUMMARY_LAST_UPDATED_WEEK', input_date) ;
		commit ;

	END UpdateSummaryInfo ;

	PROCEDURE CleanUpOldRecords 
	AS
	BEGIN
		SummaryData.delete_old_data(input_date, 'IPDR_SESSION_SUMMARY' , 'IPDR_SUMMARY_LAST_UPDATED_WEEK') ;
		commit ;
	END CleanUpOldRecords ;

END IPDRSummary ;
/
sho err ;

commit ;
