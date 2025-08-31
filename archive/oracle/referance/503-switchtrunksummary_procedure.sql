/*******************************************************************************
 *	Copyright (c) Subex Systems Limited 2001. All rights reserved.	           *
 *	The copyright to the computer program(s) herein is the property of Subex   *
 *	Systems Limited. The program(s) may be used and/or copied with the written *
 *	permission from Subex Systems Limited or in accordance with the terms and  *
 *	conditions stipulated in the agreement/contract under which the program(s) *
 *	have been supplied.                                                        *
 *******************************************************************************/

CREATE OR REPLACE PROCEDURE SwitchTrunkSummary(summarydate in varchar2, current_day_of_year in number, current_hour_of_day in number)
IS
 NICKNAME				     constant varchar2(32) := 'Hot International' ;
 v_list_id					 number ;
 v_called_number			 varchar2(40) ;
 input_date					 date ;
 table_name					 varchar2(40) := 'temp_nicknames' ;

	cursor nickname_cursor is										
		select name,value as phone_number FROM temp_nicknames where name = NICKNAME ; 
	nickname_record	nickname_cursor%ROWTYPE;

	cursor portdetail_cursor(p_phone_number varchar2) is
		SELECT round(sum(duration)/60) as sum_duration, count(*) as total_calls, NVL(op_port,0) as port,
		op_orig_swicth as switch_id, op_trunk_group as trunk_id, called_number
		FROM cdr
		WHERE called_number LIKE p_phone_number
		AND day_of_year = current_day_of_year
		AND hour_of_day = current_hour_of_day
		GROUP BY op_orig_swicth, op_trunk_group, op_port ,called_number ;
		portdetail_record portdetail_cursor%ROWTYPE;


BEGIN

	if nvl(summarydate,' ') = ' ' then
		input_date := to_date(current_day_of_year,'ddd') ;
	else
		input_date := to_date(summarydate,'dd-mm-yyyy');
	end if;

	delete from temp_nicknames where name = NICKNAME ;
	select id into v_list_id from list_configs where name = NICKNAME ;
	PopulateNicknameValues(NICKNAME, v_list_id, table_name) ;
	open nickname_cursor ; 
	loop
		fetch nickname_cursor into nickname_record ;
		exit when nickname_cursor%NOTFOUND ;

		open portdetail_cursor(nickname_record.phone_number) ;
		loop
			fetch portdetail_cursor into portdetail_record ;
			exit when portdetail_cursor%NOTFOUND ;
			begin
				SELECT called_number into v_called_number from switchtrunk_summary
				WHERE called_number = nickname_record.phone_number 
				AND switch_id = portdetail_record.switch_id
				AND trunk_id = portdetail_record.trunk_id
				AND port = portdetail_record.port
				AND summary_date = input_date ;

				UPDATE switchtrunk_summary 
				SET no_of_calls_port = no_of_calls_port + portdetail_record.total_calls,
				duration_port = duration_port + portdetail_record.sum_duration 
				WHERE called_number = nickname_record.phone_number  
				AND switch_id = portdetail_record.switch_id
				AND trunk_id = portdetail_record.trunk_id
				AND port = portdetail_record.port
				AND summary_date = input_date ;
			exception
			when no_data_found then
				INSERT INTO switchtrunk_summary 
				VALUES(nickname_record.name, nickname_record.phone_number,
					portdetail_record.switch_id, portdetail_record.trunk_id, portdetail_record.port,
					portdetail_record.total_calls, portdetail_record.sum_duration,input_date) ; 
			end ;
		end loop ;
		close portdetail_cursor ;
	end loop;
	close nickname_cursor;
EXCEPTION
when no_data_found then
	dbms_output.put_line('No Values where found for Nickname: '||NICKNAME) ;
END SwitchTrunkSummary ; 
/
