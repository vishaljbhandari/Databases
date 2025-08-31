--/*******************************************************************************
-- * Copyright (c) Subex Systems Limited 2009. All rights reserved.	             *
-- * The copyright to the computer program(s) herein is the property of Subex    *
-- * Systems Limited. The program(s) may be used and/or copied with the written  *
-- * permission from Subex Systems Limited or in accordance with the terms and   *
-- * conditions stipulated in the agreement/contract under which the program(s)  *
-- * have been supplied.                                                         *
-- *******************************************************************************/
SPOOL session_summary_proc.log
set serveroutput off 
SET FEEDBACK OFF 
CREATE OR REPLACE PROCEDURE SessionSummary(summary_date_str in varchar2) AS
	network_id						NUMBER(20);
	subscriber_id					NUMBER(20);
    phone_no                        VARCHAR(30);
    cumulative_duration             NUMBER(20);
    cumulative_volume		        NUMBER(20);
    session_start_date              DATE;
    session_end_date                DATE;
    charging_id                     VARCHAR(30);
	input_day_of_year				NUMBER(10);
	record_count					NUMBER(10) := 0;
	max_weeks_of_storage			NUMBER(10) := 5;
	acceptable_session_limit		number(10) := 1;
	input_day						date ;
	table_choice					varchar2(50) ;
	range_choice					varchar2(50) ;
	offline_range					varchar2(50) ;
	online_range					varchar2(50) ;
	start_day_of_year				number(10);

	start_1							number(10) := 0 ;
	end_1							number(10) := 0 ;
	start_2							number(10) := 0 ;
	end_2							number(10) := 0 ;

	OFFLINE_TABLE_INDICATOR			varchar2(2) := '0' ;
	ONLINE_TABLE_INDICATOR			varchar2(2) := '1' ;
	DOY_SEPARATOR					varchar2(2) := ',' ;
	RANGE_SEPARATOR					varchar2(2) := ';' ;


    CURSOR closed_gprs_session(input_day_of_year NUMBER) IS
        SELECT  phone_number, charging_id
        FROM gprs_cdr
        WHERE session_status = 1
		AND service_type = 1
		AND cdr_type != 5
		AND day_of_year = input_day_of_year
		GROUP BY phone_number, charging_id;

    CURSOR closed_offline_gprs_session(input_day_of_year NUMBER) IS
        SELECT  phone_number, charging_id
        FROM offline_gprs_cdr
        WHERE session_status = 1
		AND service_type = 1
		AND cdr_type != 5
		AND day_of_year = input_day_of_year
		GROUP BY phone_number, charging_id;

BEGIN
	BEGIN
		IF NVL(summary_date_str,'') = 'empty' THEN
			input_day_of_year := TO_NUMBER(TO_CHAR(SYSDATE - 1,'DDD'));
		ELSE
			input_day_of_year := TO_NUMBER(TO_CHAR(TO_DATE(summary_date_str,'DD/MM/YYYY'),'DDD'));
		END IF;	

		EXCEPTION
		WHEN OTHERS THEN
			COMMIT;
			raise_application_error (-20001,'Invalid DATE : summary_date_str, expected format (DD-MM-YYYY).');
	END;

	BEGIN
		SELECT value INTO acceptable_session_limit FROM configurations WHERE config_key = 'ACCEPTABLE_SESSION_LIMIT' ;

		acceptable_session_limit := acceptable_session_limit - 1 ;
		input_day := TO_DATE(input_day_of_year, 'DDD') ;

		IF input_day > SYSDATE THEN
			input_day := input_day - TO_NUMBER(TO_CHAR(TO_DATE('31-12-'||(TO_CHAR(SYSDATE,'YYYY')), 'DD-MM-YYYY'),'DDD')) ;
		END IF ;

		start_day_of_year := TO_NUMBER(TO_CHAR((input_day - acceptable_session_limit), 'DDD')) ;
	EXCEPTION
		WHEN OTHERS THEN
			start_day_of_year := input_day_of_year ;
	END ;

	BEGIN
		SELECT Utility.GetTableChoice(input_day_of_year, 7) INTO table_choice FROM DUAL ;
		SELECT Utility.GetTableChoiceByRange(start_day_of_year, input_day_of_year, 7) INTO range_choice FROM DUAL ;

		IF range_choice = OFFLINE_TABLE_INDICATOR THEN
			start_1 := start_day_of_year ;
			end_1 := input_day_of_year ;
			start_2 := 0 ;
			end_2 := 0 ;
		ELSIF range_choice = ONLINE_TABLE_INDICATOR THEN
			start_1 := 0 ;
			end_1 := 0 ;
			start_2 := start_day_of_year ;
			end_2 := input_day_of_year ;
		ELSE
			offline_range := Split(range_choice, 1, RANGE_SEPARATOR) ;
			start_1 := Split(offline_range, 1, DOY_SEPARATOR) ;
			end_1 := Split(offline_range, 4, DOY_SEPARATOR) ;
			IF end_1 IS NULL THEN
				end_1 := Split(offline_range, 2, DOY_SEPARATOR) ;
			END IF ;

			online_range := Split(range_choice, 2, RANGE_SEPARATOR) ;
			start_2 := Split(online_range, 1, DOY_SEPARATOR) ;
			end_2 := Split(online_range, 4, DOY_SEPARATOR) ;
			IF end_2 IS NULL THEN
				end_2 := Split(online_range, 2, DOY_SEPARATOR) ;
			END IF ;
		END IF ;
	EXCEPTION
		WHEN OTHERS THEN
			NULL ;
	END ;

	DELETE FROM session_summary 
	WHERE TRUNC(end_date) < TRUNC(TO_DATE(input_day_of_year,'DDD'), 'WW') - 7 * max_weeks_of_storage; 

	DELETE FROM session_summary
	WHERE TO_NUMBER(TO_CHAR(end_date, 'DDD')) = input_day_of_year;

	COMMIT;

	IF table_choice = OFFLINE_TABLE_INDICATOR THEN
		FOR gprs_session IN closed_offline_gprs_session(input_day_of_year) LOOP
			BEGIN
				SELECT network_id, subscriber_id, phone_number, MIN(time_stamp), MAX(time_stamp),
						SUM(duration), SUM(upload_data_volume + download_data_volume)
				INTO network_id, subscriber_id, phone_no, session_start_date, session_end_date, cumulative_duration, cumulative_volume
				FROM (
					SELECT offline_gprs_cdr.network_id, offline_gprs_cdr.subscriber_id, phone_number,
							time_stamp, duration, upload_data_volume, download_data_volume
						FROM offline_gprs_cdr
						WHERE offline_gprs_cdr.phone_number = gprs_session.phone_number
							AND offline_gprs_cdr.charging_id = gprs_session.charging_id
							AND ((day_of_year >= start_1 AND day_of_year <= end_1) OR
								(start_1 > end_1 AND ((day_of_year >= start_1 AND day_of_year <= 366) OR
													  	(day_of_year >= 1 AND day_of_year <= end_1))))
					UNION ALL
					SELECT gprs_cdr.network_id, gprs_cdr.subscriber_id, phone_number,
							time_stamp, duration, upload_data_volume, download_data_volume
						FROM gprs_cdr
						WHERE gprs_cdr.phone_number = gprs_session.phone_number
							AND gprs_cdr.charging_id = gprs_session.charging_id
							AND ((day_of_year >= start_2 AND day_of_year <= end_2) OR
								(start_2 > end_2 AND ((day_of_year >= start_2 AND day_of_year <= 366) OR
													  	(day_of_year >= 1 AND day_of_year <= end_2))))
				)
				GROUP BY network_id, subscriber_id, phone_number ;

			EXCEPTION
				WHEN NO_DATA_FOUND THEN
				COMMIT;
				NULL;
			END;

			INSERT INTO session_summary(network_id, subscriber_id, phone_number, start_date, end_date, duration, volume)
			 VALUES (network_id, subscriber_id, phone_no, session_start_date, session_end_date, cumulative_duration, cumulative_volume);

			record_count := record_count + 1;

			IF record_count = 100 THEN
				COMMIT;
				record_count := 0;
			END IF;

		END LOOP;
	ELSE
		FOR gprs_session IN closed_gprs_session(input_day_of_year) LOOP
			BEGIN
				SELECT network_id, subscriber_id, phone_number, MIN(time_stamp), MAX(time_stamp),
						SUM(duration), SUM(upload_data_volume + download_data_volume)
				INTO network_id, subscriber_id, phone_no, session_start_date, session_end_date, cumulative_duration, cumulative_volume
				FROM (
					SELECT offline_gprs_cdr.network_id, offline_gprs_cdr.subscriber_id, phone_number,
							time_stamp, duration, upload_data_volume, download_data_volume
						FROM offline_gprs_cdr
						WHERE offline_gprs_cdr.phone_number = gprs_session.phone_number
							AND offline_gprs_cdr.charging_id = gprs_session.charging_id
							AND ((day_of_year >= start_1 AND day_of_year <= end_1) OR
								(start_1 > end_1 AND ((day_of_year >= start_1 AND day_of_year <= 366) OR
													  	(day_of_year >= 1 AND day_of_year <= end_1))))
					UNION ALL
					SELECT gprs_cdr.network_id, gprs_cdr.subscriber_id, phone_number,
							time_stamp, duration, upload_data_volume, download_data_volume
						FROM gprs_cdr
						WHERE gprs_cdr.phone_number = gprs_session.phone_number
							AND gprs_cdr.charging_id = gprs_session.charging_id
							AND ((day_of_year >= start_2 AND day_of_year <= end_2) OR
								(start_2 > end_2 AND ((day_of_year >= start_2 AND day_of_year <= 366) OR
													  	(day_of_year >= 1 AND day_of_year <= end_2))))
				)
				GROUP BY network_id, subscriber_id, phone_number ;

			EXCEPTION
				WHEN NO_DATA_FOUND THEN
				COMMIT;
				NULL;
			END;

			INSERT INTO session_summary(network_id, subscriber_id, phone_number, start_date, end_date, duration, volume)
			 VALUES (network_id, subscriber_id, phone_no, session_start_date, session_end_date, cumulative_duration, cumulative_volume);

			record_count := record_count + 1;

			IF record_count = 100 THEN
				COMMIT;
				record_count := 0;
			END IF;

		END LOOP;
	END IF ;

	COMMIT;
END;
/
