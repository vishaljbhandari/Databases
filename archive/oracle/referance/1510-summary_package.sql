--/*******************************************************************************
-- * Copyright (c) Subex Systems Limited 2005. All rights reserved.	             *
-- * The copyright to the computer program(s) herein is the property of Subex    *
-- * Systems Limited. The program(s) may be used and/or copied with the written  *
-- * permission from Subex Systems Limited or in accordance with the terms and   *
-- * conditions stipulated in the agreement/contract under which the program(s)  *
-- * have been supplied.                                                         *
-- *******************************************************************************/

create or replace package SummaryData
is
	function GetLastUpdatedWeek (ConfID	varchar2) return pls_integer ;
	procedure RemoveOldData (InputDate date, LastUpdatedWeekConfID varchar2, TableName varchar2, 
			MaxWeekStorage number default 5, TestRun number default 0) ; 

	procedure set_last_updated_info (p_conf_id varchar2, p_input_date date) ;
	procedure get_last_updated_info (p_conf_id varchar2, l_last_updated_week out pls_integer, l_last_updated_date out date) ;
	procedure delete_old_data (p_input_date date, p_summary_table_name varchar2, p_conf_id varchar2) ;

	max_storage_week_count		constant pls_integer := 5 ;
	summary_date_format			constant varchar2(16) := 'DD/MM/YYYY' ;
end SummaryData ;
/


create or replace package body SummaryData
is
	function GetLastUpdatedWeek (ConfID	varchar2)
		return pls_integer
	is
		LastUpdatedWeek		pls_integer ;
	begin
		select to_number (substr (value, 1, instr (value, ',') - 1))
			into LastUpdatedWeek 
		from configuration
		where id = ConfID ;

		return LastUpdatedWeek ;
	end ;

	procedure TruncatePartition (TableName varchar2, PartitionNumber pls_integer, TestRun number) 
	is
		PartitionName	varchar2 (32) ;
		TruncateSQL		varchar2 (256) ; 
	begin
		if TestRun = 1
		then
			TruncateSQL := 'delete from ' || TableName || ' where week = ' || PartitionNumber ;

			execute immediate TruncateSQL ;
		else
			PartitionName := 'P' || lpad(to_char(PartitionNumber), 3, 0) ; 
			
			TruncateSQL := 'alter table ' || TableName	
							|| ' truncate partition ' || PartitionName
							|| ' drop storage' ;

			execute immediate TruncateSQL ;
		end if ;
	end ;

	procedure RemoveOldData (InputDate date, LastUpdatedWeekConfID varchar2, TableName varchar2, 
								MaxWeekStorage number default 5, TestRun number default 0) 
	is
		InputWeek					pls_integer ;
		LastUpdatedWeek				pls_integer ;
		LastUpdatedDate				date ;
		ExpiredWeek					pls_integer ;
		TotalWeeksInPreviousYear	pls_integer	;
		LastDayOfPreviousYear		date ;
		ExpiredWeekCount			pls_integer ;
		
	begin
		get_last_updated_info (LastUpdatedWeekConfID, LastUpdatedWeek, LastUpdatedDate) ;

		InputWeek := to_number (to_char (InputDate, 'iw')) ;

		if (InputDate > LastUpdatedDate and InputWeek != LastUpdatedWeek)
		then
			LastDayOfPreviousYear := trunc (InputDate, 'year') - 1 ;
			TotalWeeksInPreviousYear := to_number (to_char (LastDayOfPreviousYear, 'iw')) ;

			ExpiredWeek := InputWeek - MaxWeekStorage ;
			if (ExpiredWeek <= 0)
			then
				ExpiredWeek := TotalWeeksInPreviousYear + ExpiredWeek ;  
			end if ;

			if (InputWeek > LastUpdatedWeek)
			then
				ExpiredWeekCount := InputWeek - LastUpdatedWeek ;
			else
				ExpiredWeekCount := (TotalWeeksInPreviousYear + InputWeek) - LastUpdatedWeek ;
			end if ;

			for k in 1..ExpiredWeekCount
			loop
				TruncatePartition (TableName, ExpiredWeek, TestRun) ;
				
				ExpiredWeek := ExpiredWeek - 1 ;
				if (ExpiredWeek = 0)
				then
					ExpiredWeek := TotalWeeksInPreviousYear ;
				end if ;
			end loop ;
		end if ;
	end ;


	procedure get_last_updated_info (p_conf_id varchar2, l_last_updated_week out pls_integer, l_last_updated_date out date)
	is
	begin
		select substr (value, 1, instr (value, ',') - 1), to_date (substr (value, instr (value, ',') + 1), summary_date_format)
			into l_last_updated_week, l_last_updated_date
		from configuration
		where id = p_conf_id ;
	end get_last_updated_info ;


	procedure set_last_updated_info (p_conf_id varchar2, p_input_date date)
	is
		l_last_updated_week				pls_integer ;
		l_last_updated_date				date ;

	begin
		get_last_updated_info (p_conf_id, l_last_updated_week, l_last_updated_date) ;

		if (p_input_date > l_last_updated_date)
		then
			update configuration 
			set value = to_char (p_input_date, 'iw') || ',' || to_char (p_input_date, summary_date_format) 
			where id = p_conf_id ;
		end if ;
	end set_last_updated_info ;
	

	procedure delete_old_data (p_input_date date, p_summary_table_name varchar2, p_conf_id varchar2)
	is
		l_last_updated_week				pls_integer ;
		l_last_updated_date				date ;
		l_input_week					pls_integer ;
		l_last_date_of_previous_year	date ;
		l_total_weeks_in_previous_year	pls_integer ;
		l_expired_week					pls_integer ;
		l_expired_week_count			pls_integer ;

	begin
		get_last_updated_info (p_conf_id, l_last_updated_week, l_last_updated_date) ;

		l_input_week := to_number (to_char (p_input_date, 'iw')) ;

		if (p_input_date > l_last_updated_date and l_input_week != l_last_updated_week)
		then
			l_last_date_of_previous_year := trunc (p_input_date, 'year') - 1 ;
			l_total_weeks_in_previous_year := to_number (to_char (l_last_date_of_previous_year, 'iw')) ;

			l_expired_week := l_input_week - max_storage_week_count ;
			if (l_expired_week <= 0)
			then
				l_expired_week := l_total_weeks_in_previous_year + l_expired_week ;  
			end if ;

			if (l_input_week > l_last_updated_week)
			then
				l_expired_week_count := l_input_week - l_last_updated_week ;
			else
				l_expired_week_count := (l_total_weeks_in_previous_year + l_input_week) - l_last_updated_week ;
			end if ;

			for k in 1..l_expired_week_count
			loop
				execute immediate 'delete from ' || p_summary_table_name || ' where week = :x'
				using l_expired_week ;
								
				l_expired_week := l_expired_week - 1 ;
				if (l_expired_week = 0)
				then
					l_expired_week := l_total_weeks_in_previous_year ;
				end if ;
			end loop ;
		end if ;
	end delete_old_data ;
end SummaryData ;
/

create or replace package SummaryReport
is
	function GetYearWrapStartWeek (start_date date, end_date date) return number ;
	function GetYearWrapEndWeek (start_date date, end_date date) return number ;
	function GetStartDate (StartWeek number, ConfigID varchar2) return date ;
	function GetEndDate (EndWeek number, ConfigID varchar2) return date ;
end ;
/

create or replace package body SummaryReport
is
	function GetYearWrapStartWeek (start_date date, end_date date) return number is
	begin
		if start_date > end_date
		then
			return to_number(to_char(start_date,'IW')) ;
		else
			return 54 ;
		end if ;
	end ;

	function GetYearWrapEndWeek (start_date date, end_date date) return number is
	begin
		if start_date > end_date
		then
			return to_number(to_char(end_date,'IW')) ;
		else
			return 0 ;
		end if ;
	end ;

	function GetStartDate (StartWeek number, ConfigID varchar2) return date is
		StartDate	date ;
	begin
		select TRUNC(TRUNC(sysdate, 'YYYY') + ((TO_NUMBER(SUBSTR(value, 1, INSTR(value, ',') - 1))-1) - (5 - StartWeek))*7, 'IW') 
			into StartDate from configuration
			where id = ConfigID ;
		return StartDate ;
	end ;

	function GetEndDate (EndWeek number, ConfigID varchar2) return date is
		EndDate		date ;
	begin
		select DECODE(EndWeek, 5, TO_DATE(SUBSTR(value, INSTR(value, ',') + 1), 'DD/MM/YYYY'), TRUNC(TRUNC(sysdate, 'YYYY') +
						(TO_NUMBER(SUBSTR(value, 1, INSTR(value, ',')-1)) - (5 - EndWeek))*7, 'IW') - 1) 
			into EndDate from configuration
			where id = ConfigID ;
		return EndDate ;
	end ;
end ;
/
