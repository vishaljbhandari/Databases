/*******************************************************************************
 *	Copyright (c) Subex Systems Limited 2001. All rights reserved.	           *
 *	The copyright to the computer program(s) herein is the property of Subex   *
 *	Systems Limited. The program(s) may be used and/or copied with the written *
 *	permission from Subex Systems Limited or in accordance with the terms and  *
 *	conditions stipulated in the agreement/contract under which the program(s) *
 *	have been supplied.                                                        *
 *******************************************************************************/

CREATE OR REPLACE PROCEDURE GenerateHighCostSummary(summarydate in varchar2, current_day_of_year in number, current_hour_of_day in number)
IS
 NICKNAME				     constant varchar2(32) := 'High Cost' ;
 v_list_id					 number ;
 v_called_number			 varchar2(32) ;
 input_date					 date ;
 table_name					 varchar2(40) := 'temp_nicknames' ;

	cursor nickname_cursor is										
		select name,value as phone_number FROM temp_nicknames where name = NICKNAME ; 
	nickname_record	nickname_cursor%ROWTYPE;

	cursor cdrdetail_cursor(p_phone_number varchar2) is										
 		SELECT round(sum(duration)/60,2) as sum_duration, called_number, count(*) as total_calls 
		FROM cdr 
		WHERE called_number LIKE p_phone_number 
		AND day_of_year = current_day_of_year
		AND hour_of_day = current_hour_of_day
		GROUP BY called_number;
	cdrdetail_record cdrdetail_cursor%ROWTYPE;

BEGIN
	delete from temp_nicknames where name = NICKNAME ;
	select id into v_list_id from list_configs where name = NICKNAME ;
	PopulateNicknameValues(NICKNAME, v_list_id, table_name) ;

	if nvl(summarydate,' ') = ' ' then
		input_date := to_date(current_day_of_year,'ddd') ;
	else
		input_date := to_date(summarydate,'dd-mm-yyyy');
	end if;

	open nickname_cursor ; 
	loop
		fetch nickname_cursor into nickname_record ;
		exit when nickname_cursor%NOTFOUND ;
		open cdrdetail_cursor(nickname_record.phone_number) ;
		loop
			fetch cdrdetail_cursor into cdrdetail_record ;
			exit when cdrdetail_cursor%NOTFOUND ;
			begin
				SELECT called_number into v_called_number from highcost_summary
				WHERE called_number = cdrdetail_record.called_number  
				AND summary_date = input_date ;
				
				UPDATE highcost_summary 
				SET no_of_calls = no_of_calls + cdrdetail_record.total_calls ,
					duration = duration + cdrdetail_record.sum_duration 
				WHERE called_number = cdrdetail_record.called_number  
				AND summary_date = input_date ;
				exception
				when no_data_found then
					INSERT INTO highcost_summary
					VALUES(nickname_record.name, nickname_record.phone_number, cdrdetail_record.called_number,
						 cdrdetail_record.total_calls, cdrdetail_record.sum_duration, input_date);
				end ;
		end loop;
		close cdrdetail_cursor;
	end loop;
	close nickname_cursor;
EXCEPTION
when no_data_found then
	dbms_output.put_line('No Values where found for Nickname: '||NICKNAME) ;
END GenerateHighCostSummary ; 
/
