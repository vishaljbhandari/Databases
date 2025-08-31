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

	procedure set_last_updated_info (p_conf_id varchar2, p_input_date date) ;
	procedure get_last_updated_info (p_conf_id varchar2, l_last_updated_week out pls_integer, l_last_updated_date out date) ;
	procedure delete_old_data (p_input_date date, p_summary_table_name varchar2, p_conf_id varchar2) ;

	max_storage_week_count		constant pls_integer := 5 ;
	summary_date_format			constant varchar2(16) := 'DD/MM/YYYY' ;
end SummaryData ;
/

show error;

create or replace package body SummaryData
is
	procedure get_last_updated_info (p_conf_id varchar2, l_last_updated_week out pls_integer, l_last_updated_date out date)
	is
	begin
		select substr (value, 1, instr (value, ',') - 1), to_date (substr (value, instr (value, ',') + 1), summary_date_format)
			into l_last_updated_week, l_last_updated_date
		from nik_configurations
		where config_key = p_conf_id ;
	end get_last_updated_info ;


	procedure set_last_updated_info (p_conf_id varchar2, p_input_date date)
	is
		l_last_updated_week				pls_integer ;
		l_last_updated_date				date ;

	begin
		get_last_updated_info (p_conf_id, l_last_updated_week, l_last_updated_date) ;

		if (p_input_date > l_last_updated_date)
		then
			update nik_configurations 
			set value = to_char (p_input_date, 'iw') || ',' || to_char (p_input_date, summary_date_format) 
			where config_key = p_conf_id ;
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
		summary_table					varchar2(50) := '' ;
		b_find_table_name				boolean ;
		vTable_type						number ;
		CDR_SUMMARY_TABLE_TYPE  constant number  := 1 ;
		IPDR_SUMMARY_TABLE_TYPE  constant number  := 2 ;
		summ_query     varchar2(3000) := '' ;

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
			b_find_table_name := false ;
			if (p_summary_table_name like 'SUMMARY')
			then
				b_find_table_name := true ;
				vTable_type := CDR_SUMMARY_TABLE_TYPE ;
			end if ;

			if (p_summary_table_name like 'IPDR_SESSION_SUMMARY')
			then
				b_find_table_name := true ;
				vTable_type := IPDR_SUMMARY_TABLE_TYPE ;
			end if ;
				
			summary_table := p_summary_table_name ;

			for k in 1..l_expired_week_count
			loop
				if (b_find_table_name)
				then
					select TABLE_NAME  into summary_table from NIK_SUMMARY_MAPS where WEEK_OF_YEAR = l_expired_week and TABLE_TYPE = vTable_type;
				end if ;
				
				summ_query := 'delete from ' || summary_table || ' where week = ' || l_expired_week ;
				execute immediate summ_query ;
				commit ;
								
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
show error;
