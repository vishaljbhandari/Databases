  CREATE OR REPLACE  PROCEDURE "SLEEP" (seconds IN BINARY_INTEGER) IS
BEGIN
    DBMS_LOCK.SLEEP (seconds) ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "DBLOG" (file_in IN VARCHAR2, message IN VARCHAR2 := NULL)
IS
	file_handle UTL_FILE.FILE_TYPE ;
BEGIN
	file_handle := UTL_FILE.FOPEN ('LOG_DIR', file_in, 'a') ;
	IF message IS NOT NULL
	THEN
		UTL_FILE.PUT_LINE (file_handle, message) ;
	ELSE
		UTL_FILE.PUT_LINE (file_handle, '') ;
	END IF ;
	UTL_FILE.FCLOSE (file_handle) ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "GETQUERYRESULT" (query_in IN VARCHAR2, result_out OUT VARCHAR2) IS
    curval  integer ;
    retval  integer ;
    length  integer ;
    ignore  integer ;
BEGIN
    curval := dbms_sql.open_cursor() ;
    dbms_sql.parse(curval, query_in, dbms_sql.native) ;
    dbms_sql.define_column(curval, 1, result_out, 1024) ;
    ignore := dbms_sql.execute(curval) ;
    retval := dbms_sql.fetch_rows(curval) ;
    if(retval > 0)
    then
     dbms_sql.column_value(curval, 1, result_out, retval, length) ;
    else
	result_out := NULL ;
    end if ;
    dbms_sql.close_cursor(curval) ;
END;
/
  CREATE OR REPLACE  PROCEDURE "ENCO" (input_string IN VARCHAR2, encrypted_raw IN OUT RAW) IS
    config_encryption_type   VARCHAR2 (256) ;
    key_bytes_raw	     RAW (2048) ;
    iv_bytes_raw	     RAW (2048) ;
    encryption_type	     PLS_INTEGER ;
BEGIN
    config_encryption_type := 'AES128' ;
    key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d6') ;
    iv_bytes_raw := hextoraw('96ff9997eefd8c2d47c3d1c303f617bc') ;
    encryption_type := DBMS_CRYPTO.ENCRYPT_AES128 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
    select DECODE(value, null, 'AES128', value) into config_encryption_type from configurations where config_key like '%ENCRYPTION_ALGORITHM%' ;
    IF config_encryption_type = 'AES192' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_AES192 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
    ELSIF config_encryption_type = 'AES256' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199a03ff1b373a1042d') ;
	ELSIF config_encryption_type = 'DES2' THEN
		encryption_type := DBMS_CRYPTO.ENCRYPT_DES + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
		key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
	ELSIF config_encryption_type = 'DES3' THEN
		encryption_type := DBMS_CRYPTO.ENCRYPT_3DES + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
		key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
    END IF ;
    encrypt(input_string, key_bytes_raw, iv_bytes_raw, encryption_type, encrypted_raw) ;
EXCEPTION
	WHEN NO_DATA_FOUND
    THEN
	encrypt(input_string, key_bytes_raw, iv_bytes_raw, encryption_type, encrypted_raw) ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "DECO" (encrypted_raw IN VARCHAR2,output_string IN OUT VARCHAR2) IS
    config_encryption_type   VARCHAR2 (256) ;
    key_bytes_raw	     RAW (2048) ;
    iv_bytes_raw	     RAW (2048) ;
    encryption_type	     PLS_INTEGER ;
BEGIN
    config_encryption_type := 'AES128' ;
    key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d6') ;
    iv_bytes_raw := hextoraw('96ff9997eefd8c2d47c3d1c303f617bc') ;
    encryption_type := DBMS_CRYPTO.ENCRYPT_AES128 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
    select DECODE(value, null, 'AES128', value) into config_encryption_type from configurations where config_key like '%ENCRYPTION_ALGORITHM%' ;
    IF config_encryption_type = 'AES192' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_AES192 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
    ELSIF config_encryption_type = 'AES256' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199a03ff1b373a1042d') ;
    ELSIF config_encryption_type = 'DES2' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_DES + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
    ELSIF config_encryption_type = 'DES3' THEN
	encryption_type := DBMS_CRYPTO.ENCRYPT_3DES + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5 ;
	key_bytes_raw := hextoraw('537b70597e5b2588cbfb91dc8312a4d645686d5b84af5199') ;
    END IF ;
    decrypt (encrypted_raw, key_bytes_raw, iv_bytes_raw, encryption_type, output_string) ;
EXCEPTION
    WHEN NO_DATA_FOUND
    THEN
	decrypt (encrypted_raw, key_bytes_raw, iv_bytes_raw, encryption_type, output_string) ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "MSK" (input IN VARCHAR2, positions IN VARCHAR2, output_string  IN OUT VARCHAR2) IS
	input_string VARCHAR2(4000) ;
    countofpositions binary_integer ;
    lengthofinputstring binary_integer ;
    array dbms_utility.lname_array ;
BEGIN
    dbms_utility.comma_to_table
    ( list   => regexp_replace(positions, '(^|,)', '\1x')
      , tablen => countofpositions
      , tab    => array
    ) ;
    input_string := input ;
    lengthofinputstring := length(input) ;
    IF lengthofinputstring IS NOT NULL THEN
	FOR i IN 1 .. countofpositions
	LOOP
	    IF substr(array(i), 2) < lengthofinputstring THEN
		output_string := regexp_replace(input_string, '[^,]', 'X', substr(array(i), 2) + 1, 1) ;
		input_string := output_string ;
	    END IF ;
	END LOOP;
    END IF ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "GETHSH" (key IN VARCHAR2, mod_cnt IN PLS_INTEGER, output IN OUT PLS_INTEGER) IS
    input_char char(1) ;
    input_length number := 0 ;
    cnt number := 0 ;
    hash number := 0 ;
BEGIN
    input_length := length(key) ;
    WHILE (cnt < input_length)
    LOOP
	cnt := cnt + 1 ;
	input_char := substr(key, cnt, 1) ;
	hash := 16777619 * hash ;
	hash := MOD(hash, 4294967296) ;
	hash := bitor(hash, ASCII(input_char)) - bitand(hash, ASCII(input_char)) ;
	hash := MOD(hash, 4294967296) ;
    END LOOP ;
    output := MOD(hash, mod_cnt) ;
EXCEPTION
    WHEN OTHERS THEN raise ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "MIGRATEDEFAULTROLESFORTASK" (task_id IN NUMBER) IS
	BEGIN
	    INSERT INTO ranger_groups_tasks(ranger_group_id, task_id)
		SELECT id, task_id FROM ranger_groups WHERE name IN ( 'radmin', 'default', 'nadmin' ) ;
	END ;
/
  CREATE OR REPLACE  PROCEDURE "TOKENIZER" ( iStart IN NUMBER, sPattern in VARCHAR2, sBuffer in VARCHAR2,
										 sResult OUT VARCHAR2, iNextPos OUT NUMBER)
AS
		nPos1 NUMBER;
		nPos2 NUMBER;
BEGIN
		nPos1 := INSTR (sBuffer ,sPattern ,iStart);
		IF nPos1 = 0 THEN
			sResult := NULL ;
		ELSE
			nPos2 := INSTR (sBuffer ,sPattern ,nPos1 + 1);
			IF nPos2 = 0 then
				sResult := Rtrim(Ltrim(Substr(sBuffer ,nPos1+1)));
				iNextPos := nPos2;
			ELSE
				sResult := Substr(sBuffer ,nPos1 + 1 , nPos2 - nPos1 - 1);
				iNextPos := nPos2;
			END IF;
		END IF;
END tokenizer ;
/
  CREATE OR REPLACE  PROCEDURE "INSERTCOLORINGRULE" ( ruleName in varchar2, userId in varchar2, color in varchar2, rightField in varchar2, leftField in varchar2, recordConfigId in number, filterDescription in varchar2 )
IS
begin
	INSERT INTO rules (ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
		PSEUDO_FUNCTION_ID, IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, DESCRIPTION, PROCESSOR_TYPE,
		CATEGORY, IS_ACTIVE) VALUES (rules_seq.nextval, '999', rules_key_seq.nextval, ruleName, '0', '0', '0', '2', NULL,
		'1', sysdate, sysdate, '100', userId, NULL, '1', 'COLORING_RULES', '1');
	insert into rule_color_maps(id, rule_id, back_color) values (rule_color_maps_seq.nextval, rules_seq.currval, color) ;
	insert into filters(id, name, record_config_id, is_exception, network_id) values(filters_seq.nextval, null, recordConfigId, 0, 999) ;
	insert into filters_rules(filter_id, rule_id) values(filters_seq.currval, rules_seq.currval) ;
	insert into expressions(id, left_field, right_field, right_field_indicator, operator_id) values(expressions_seq.nextval, leftField, rightField, 1024, 6) ;
	insert into filter_tokens(id, filter_id, expression_id, description) values(filter_tokens_seq.nextval, filters_seq.currval, expressions_seq.currval, filterDescription) ;
	insert into record_configs_rules(rule_id, record_config_id) values (rules_seq.currval, recordConfigId) ;
end InsertColoringRule ;
/
  CREATE OR REPLACE  PROCEDURE "POPULATESUBSCRIBERS" (neural_prof_type IN NUMBER, nwk_ids IN VARCHAR) AS
BEGIN
	IF neural_prof_type = 3
	THEN
		INSERT INTO subscr_neural_voice_profile (subscriber_id, phone_number, network_id, profile_type)
			(SELECT id, phone_number, network_id, neural_prof_type FROM subscriber WHERE id > 1024
			 AND (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0')
			 AND status IN (1,2)
			 AND EXISTS (SELECT aig.name FROM ai_groups aig WHERE CompareCSV(aig.name, subscriber.groups) > 0)
			 MINUS
			 SELECT subscriber_id, phone_number, network_id,profile_type FROM subscriber_neural_profile WHERE
			 (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0'));
	ELSIF neural_prof_type = 5
	THEN
		INSERT INTO subscr_neural_data_profile (subscriber_id, phone_number, network_id, profile_type)
			(SELECT id, phone_number, network_id, neural_prof_type FROM subscriber WHERE id > 1024
			 AND (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0')
			 AND status IN (1,2)
			 AND EXISTS (SELECT aig.name FROM ai_groups aig WHERE CompareCSV(aig.name, subscriber.groups) > 0)
			 MINUS
			 SELECT subscriber_id, phone_number, network_id,profile_type FROM subscriber_neural_profile WHERE
			 (instr(nwk_ids,network_id) > 0 OR nwk_ids = '0'));
	END IF ;
	COMMIT ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "POPULATEPARTITIONLOOKUP"
IS
	CURSOR GET_TNAMES IS SELECT * FROM RECORD_CONFIGS WHERE IS_PARTITIONED=1;
	RC GET_TNAMES%rowtype;
BEGIN
	FOR RC IN GET_TNAMES
	LOOP
		dbms_output.put_line('Inserting into PARTITION_LOOKUP for table : '||RC.tname);
		MERGE INTO PARTITION_LOOKUP P USING
		(
		 SELECT TABLE_NAME, PARTITION_NAME, GetHighValueAsString(TABLE_NAME, PARTITION_NAME) HIGH_VALUE FROM USER_TAB_PARTITIONS U WHERE U.TABLE_NAME = RC.TNAME
		) U
		ON
		(
	 P.TABLE_NAME = U.TABLE_NAME AND
		 P.PARTITION_NAME = U.PARTITION_NAME
		)
		WHEN NOT MATCHED THEN
			INSERT VALUES
			(
				U.TABLE_NAME, U.PARTITION_NAME, U.HIGH_VALUE
			);
		COMMIT;
	END LOOP;
END PopulatePartitionLookup;
/
  CREATE OR REPLACE  PROCEDURE "HIGHRISKDESTSUMMARY" (summary_run_date in date)
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
	execute immediate 'alter table alarms parallel 4'  ;
	execute immediate 'alter table alerts parallel 4'  ;
	execute immediate 'alter table alert_cdr parallel 4'  ;
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
			 C.XDR_ID AS ID,
			C.NETWORK_ID,C.CALLER_NUMBER,C.CALLED_NUMBER,C.FORWARDED_NUMBER,C.RECORD_TYPE,
			C.DURATION,C.TIME_STAMP,C.EQUIPMENT_ID,C.IMSI_NUMBER,C.GEOGRAPHIC_POSITION,C.CALL_TYPE,C.SUBSCRIBER_ID,
			 C.VAL AS VALUE,
			C.CDR_TYPE,C.SERVICE_TYPE,C.CDR_CATEGORY,C.IS_COMPLETE,C.IS_ATTEMPTED,C.SERVICE,C.PHONE_NUMBER,C.DAY_OF_YEAR,C.HOUR_OF_DAY,
			C.OTHER_PARTY_COUNTRY_CODE,C.VPMN,C.SERVICE_NUMBER_TYPE
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
	      and C.xdr_id = T.cdr_id
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
				PHONE_NUMBER, DAY_OF_YEAR, HOUR_OF_DAY, OTHER_PARTY_COUNTRY_CODE, VPMN, SERVICE_NUMBER_TYPE)
			values (altemp.ID,   altemp.NETWORK_ID, altemp.CALLER_NUMBER, altemp.CALLED_NUMBER, altemp.FORWARDED_NUMBER, altemp.RECORD_TYPE,
	   altemp.DURATION, altemp.TIME_STAMP, altemp.EQUIPMENT_ID, altemp.IMSI_NUMBER, altemp.GEOGRAPHIC_POSITION, altemp.CALL_TYPE, altemp.SUBSCRIBER_ID,
		       altemp.VALUE, altemp.CDR_TYPE, altemp.SERVICE_TYPE, altemp.CDR_CATEGORY, altemp.IS_COMPLETE, altemp.IS_ATTEMPTED, altemp.SERVICE,
				altemp.PHONE_NUMBER, altemp.DAY_OF_YEAR, altemp.HOUR_OF_DAY, altemp.OTHER_PARTY_COUNTRY_CODE, altemp.VPMN, altemp.SERVICE_NUMBER_TYPE)
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
	execute immediate 'alter table alarms noparallel'  ;
	execute immediate 'alter table alerts noparallel'  ;
	execute immediate 'alter table alert_cdr noparallel'  ;
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
  CREATE OR REPLACE  PROCEDURE "POPULATENICKNAMEVALUES" (name in varchar2, list_id in number, table_name in varchar2)
IS
	value number ;
	dynsql varchar(100) ;
	cursor list_values_cursor is
		SELECT value, value_type
		FROM list_details
		WHERE list_config_id = list_id
		AND value_type in (0,1) ;
	list_value list_values_cursor%ROWTYPE;
BEGIN
	open list_values_cursor ;
	loop
		fetch list_values_cursor into list_value ;
		exit when list_values_cursor%NOTFOUND ;
		if (list_value.value_type = 1) then
			value := to_number(list_value.value) ;
			dynsql := 'call PopulateNicknameValues(''' || name || ''',''' || value || ''',''' || table_name || ''')' ;
			execute immediate dynsql ;
		else
			execute immediate 'insert into ' ||table_name|| ' values (:name, :list_value)' using name, list_value.value ;
		end if ;
	end loop ;
	close list_values_cursor ;
EXCEPTION
when no_data_found then
	dbms_output.put_line('No Values where found for Nickname: '||name||' and ID: '||list_id) ;
END PopulateNicknameValues ;
/
  CREATE OR REPLACE  PROCEDURE "ALARMLINKALARMCDRS" AS
CURSOR alarmcursor IS
	SELECT id,reference_value,reference_type,status
	FROM alarms
	WHERE modified_date >= to_date( (SELECT value FROM configurations WHERE config_key='ALARMLINK.LASTRUNTIME') , 'dd/mm/yyyy hh24:mi:ss')
	AND status not in (4, 8) ;
CURSOR alarmlinkenabled IS
	SELECT lookup_table_name, record_config_id
	from alarm_xdr_maps a
    where instr((select category from record_configs where id = a.record_config_id), 'ALARM_LINK') != 0 ;
alarmcur alarmcursor%ROWTYPE ;
alarmlinkcur alarmlinkenabled%ROWTYPE;
query varchar2(4000) := '' ;
BEGIN
	FOR alarmcur IN alarmcursor
	LOOP
		delete from alarm_link_cdr_details where alarm_id = alarmcur.id and value_type in (0,1);
		delete from alarm_link_cdr_details_temp ;
		FOR alarmlinkcur IN alarmlinkenabled
		LOOP
			query := 'insert into alarm_link_cdr_details_temp';
		query := query || ' ( select decode('||alarmlinkcur.lookup_table_name||'.record_type,1,'||alarmlinkcur.lookup_table_name||'.called_number, 2,'||alarmlinkcur.lookup_table_name||'.caller_number , 3,'||alarmlinkcur.lookup_table_name||'.forwarded_number ), equipment_id from ' || alarmlinkcur.lookup_table_name || ' WHERE  PHONE_NUMBER = '''||alarmcur.reference_value||''' and ';
			query := query || ' xdr_id ';
			query := query || ' in ( select distinct(alert_cdr.cdr_id) from alerts,alert_cdr where alert_cdr.alert_id = alerts.id AND alerts.alarm_id = '||alarmcur.id||' AND alert_cdr.record_category='||alarmlinkcur.record_config_id||'))';
		execute immediate query;
		END LOOP;
	insert into alarm_link_cdr_details
	(select alarmcur.id,other_number,count(other_number),0,sysdate,1 from alarm_link_cdr_details_temp
		where other_number is not null
		group by other_number
	union
		select distinct alarmcur.id,imei,0,1,sysdate,1 from alarm_link_cdr_details_temp
		where imei is not null
	) ;
	END LOOP ;
	update configurations set value = to_char(sysdate-1,'dd/mm/yyyy hh24:mi:ss')  where config_key = 'ALARMLINK.LASTRUNTIME' ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "NICKNAME_SETUP" (p_nickname in varchar2, p_nickname_type in varchar2, p_field_category_id in number,
			p_validity_period in number, p_value_type in number, p_list_type in number)
IS
	field_category_name		varchar2(200) ;
	list_config_id			number(20) ;
	network_id				number(20) := 999 ;
	nickname_found			number(2) := 0 ;
BEGIN
	select name into field_category_name from field_categories where field_categories.id = p_field_category_id ;
	select count(id) into nickname_found from custom_nicknames
		where nickname = p_nickname ||'_' ||  field_category_name and field_category_id = p_field_category_id ;
	if nickname_found = 1
	then
		update custom_nicknames set nickname_type = p_nickname, no_of_days = p_validity_period
			where nickname = p_nickname ||'_' ||  field_category_name and field_category_id = p_field_category_id ;
	else
		insert into custom_nicknames (id, nickname, nickname_type, no_of_days, field_category_id, network_id)
			values (custom_nicknames_seq.nextval, p_nickname ||'_' ||  field_category_name, p_nickname_type, p_validity_period, p_field_category_id, network_id) ;
	    insert into list_configs(id, name, list_type, data_type, field_category_id)
   	     select list_configs_seq.nextval, p_nickname ||'_' ||  field_category_name ,
	    	p_list_type, field_categories.data_type, field_categories.id from
    		    field_categories  where field_categories.id = p_field_category_id  ;
		insert into list_configs_networks (network_id,list_config_id) (select network_id, lc.id from list_configs lc where lc.name = p_nickname ||'_' ||  field_category_name) ;
		select list_configs_seq.currval into list_config_id from dual ;
		insert into list_details(id, list_config_id, value_type, value)
				(select list_details_seq.nextval, lc.id, p_value_type,
				  'SELECT value FROM custom_nickname_values WHERE custom_nickname_id = ' || custom_nicknames_seq.currval from list_configs lc where lc.id > 1023 and lc.category is null and lc.id = list_config_id ) ;
	end if;
EXCEPTION
	when no_data_found then
		dbms_output.put_line('No Data Found Error. ' || sqlerrm) ;
	when others then
		dbms_output.put_line('Error: ' || sqlerrm) ;
END NICKNAME_SETUP ;
/
  CREATE OR REPLACE  PROCEDURE "ONEALARMMLH" (req_analyst_id in VARCHAR2,req_alarm_id in NUMBER)
AS
 total_alarm_cost NUMBER ;
 new_alarm_cost NUMBER ;
 acc_entity_type VARCHAR2(1):='A' ;
 subs_entity_type VARCHAR2(1):='S' ;
 par_id_alarm_acc_id NUMBER ;
 alarm_acc_id  NUMBER ;
 test_var NUMBER ;
 mlh_max_level NUMBER ;
 mlh_curr_level NUMBER ;
BEGIN
      delete from analyst_alarm_mlhs where analyst_id=req_analyst_id ;
	select reference_id into test_var from alarms where id=req_alarm_id ;
	select PARENT_ID into test_var from account where id=test_var ;
      select PARENT_ID,ID into par_id_alarm_acc_id,alarm_acc_id from account where id in ( select reference_id from alarms where id=req_alarm_id) ;
	SELECT 10 into mlh_max_level from dual ;
      insert into analyst_alarm_mlhs (ENTITY_COUNT,ENTITY_COST,ENTITY_ID,ANALYST_ID,ENTITY_TYPE) (select count(distinct(alert_cdr.cdr_id)),SUM(alert_cdr.CDR_VALUE),owner_id,req_analyst_id,'S' from alerts,alert_cdr where alert_cdr.alert_id = alerts.id AND alerts.alarm_id = req_alarm_id and alert_cdr.record_category=1 and owner_id!=0 group by owner_id) ;
	update analyst_alarm_mlhs A set parent_entity_id=(select ACCOUNT_ID from subscriber_mlh where id=A.ENTITY_ID) WHERE ENTITY_TYPE=subs_entity_type and parent_entity_id is NULL and ANALYST_ID=req_analyst_id;
	update analyst_alarm_mlhs A set entity_value=(select phone_number from subscriber_mlh where id=A.ENTITY_ID) WHERE ENTITY_TYPE=subs_entity_type and entity_value is NULL and ANALYST_ID=req_analyst_id;
	insert into analyst_alarm_mlhs (ENTITY_COST,ENTITY_COUNT,ENTITY_ID,ANALYST_ID,ENTITY_TYPE) ( select SUM(ENTITY_COST),SUM(ENTITY_COUNT),parent_entity_id  ,analyst_id, 'A' entity_type from analyst_alarm_mlhs where ENTITY_TYPE=subs_entity_type and ANALYST_ID=req_analyst_id group by parent_entity_id,analyst_id ) ;
	update analyst_alarm_mlhs A set parent_entity_id=(select PARENT_ID from ACCOUNT where id=A.ENTITY_ID) WHERE ENTITY_TYPE!=subs_entity_type and parent_entity_id is NULL	and ANALYST_ID=req_analyst_id;
	update analyst_alarm_mlhs A set entity_value=(select ACCOUNT_NAME from ACCOUNT where id=A.ENTITY_ID) WHERE ENTITY_TYPE!=subs_entity_type and entity_value is NULL  and ANALYST_ID=req_analyst_id ;
	mlh_curr_level:=1 ;
	select SUM(ENTITY_COST) into total_alarm_cost from analyst_alarm_mlhs where ENTITY_TYPE=subs_entity_type and ANALYST_ID=req_analyst_id ;
	LOOP
	merge into analyst_alarm_mlhs AAM
	USING
	( select  SUM(ENTITY_COST) QRY_COST,SUM(ENTITY_COUNT) QRY_COUNT ,parent_entity_id  ,analyst_id, 'A' entity_type from analyst_alarm_mlhs where ANALYST_ID=req_analyst_id and parent_entity_id!=par_id_alarm_acc_id group by parent_entity_id  ,analyst_id ) QRY_AAM
	ON ( AAM.analyst_id=QRY_AAM.analyst_id and AAM.ENTITY_ID=QRY_AAM.parent_entity_id and AAM.entity_type=acc_entity_type )
	WHEN MATCHED THEN
		UPDATE SET AAM.ENTITY_COST=QRY_AAM.QRY_COST,AAM.ENTITY_COUNT=QRY_AAM.QRY_COUNT
	WHEN NOT MATCHED THEN
		insert (AAM.ENTITY_COST,AAM.ENTITY_COUNT,AAM.ENTITY_ID,AAM.ANALYST_ID,AAM.ENTITY_TYPE)	values (QRY_AAM.QRY_COST, QRY_AAM.QRY_COUNT , QRY_AAM.parent_entity_id	,QRY_AAM.analyst_id,QRY_AAM.entity_type) ;
	update analyst_alarm_mlhs A set parent_entity_id=(select PARENT_ID from ACCOUNT where id=A.ENTITY_ID) WHERE ENTITY_TYPE!=subs_entity_type and parent_entity_id is NULL and ANALYST_ID=req_analyst_id;
	update analyst_alarm_mlhs A set entity_value=(select ACCOUNT_NAME from ACCOUNT where id=A.ENTITY_ID) WHERE ENTITY_TYPE!=subs_entity_type and entity_value is NULL and ANALYST_ID=req_analyst_id;
	mlh_curr_level:=mlh_curr_level + 1 ;
	EXIT WHEN total_alarm_cost<=new_alarm_cost OR mlh_curr_level=mlh_max_level;
	END LOOP;
	EXCEPTION
		WHEN OTHERS THEN
		dbms_output.put_line(SQLERRM) ;
		ROLLBACK ;
END
;
/
  CREATE OR REPLACE  PROCEDURE "FRAUDLOSSAVOIDANCESUMMARY" as
	Last_processed_Alarm_id 				NUMBER(10)  ;
	Previous_BlackList_Close_Date 			date;
	Total_Value					NUMBER(16, 6) ;
	Num_of_Days					NUMBER ;
	AvgSubscriberUsage					NUMBER(16, 6) ;
	First_DataStream_Time	       			Date ;
		rs_str									varchar2(300) ;
		rs_str1									varchar2(1000) ;
		Value_field								varchar2(100) ;
		Phone_Number_DBField					varchar2(100) ;
		AGG_VALUE								varchar2(40) ;
		Qry										varchar2(200) ;
		getvalue				varchar2(1024);
		AlarmCleanupConfigValue					NUMBER ;
		MOBILE_SERVICE							NUMBER(2) := 1;
		LTE_SERVICE			   					NUMBER(2) := 2;
		WIFI_SERVICE							NUMBER(2) := 3;
		CURSOR DATA_STREAM IS select RC.ID as ID, RC.TNAME as tname, NVL(A.lookup_table_name, RC.TNAME) as lookup_tname from (SELECT DISTINCT tname, ID FROM record_configs WHERE id IN (SELECT record_config_id FROM record_configs_rules WHERE rule_id IN (SELECT id FROM rules WHERE category IS NULL )) AND (SELECT REPLACE(','||joinmanyrowsin1(RECORD_CONFIGS)||',',' ','') FROM service_number_types)||'29,30,' LIKE '%,'||ID||',%' ) RC, alarm_xdr_maps A where RC.ID=A.RECORD_CONFIG_ID (+);
		CURSOR Black_Listed_Subscribers (Last_processed_BlackList Date) IS
			SELECT S.ACCOUNT_NAME, S.PHONE_NUMBER, S.NETWORK_ID, A.VALUE, A.CREATED_DATE, A.MODIFIED_DATE, A.REFERENCE_ID AS SUBSCRIBER_ID, A.ID, A.DISPLAY_VALUE AS FRAUD_TYPE, S.SERVICE_NUMBER_TYPE AS SERVICE_NUMBER_TYPE
			FROM SUBSCRIBER S, ALARMS A
			WHERE S.SUBSCRIBER_TYPE = 1
			AND S.ID = A.REFERENCE_ID
			AND A.REFERENCE_TYPE=1
			AND A.MODIFIED_DATE >= to_date(to_char(Last_processed_BlackList,'dd-mm-yyyy hh24:mi:ss'),'dd-mm-yyyy hh24:mi:ss')
			ORDER BY MODIFIED_DATE ASC;
		BEGIN
			SELECT to_number(value) into AlarmCleanupConfigValue FROM configurations WHERE config_key='CLEANUP.ALARMS.INTERVAL_IN_DAYS' ;
		DELETE FROM fraudulent_info WHERE alarm_modified_date < (SYSDATE - AlarmCleanupConfigValue);
			BEGIN
		SELECT VALUE INTO Last_processed_Alarm_id  FROM Configurations WHERE CONFIG_KEY = 'LAST_PROCESSED_BLACKLIST_ALARM_ID' ;
			EXCEPTION
			WHEN OTHERS THEN
			Last_processed_Alarm_id := 1025 ;
		END ;
		BEGIN
		SELECT modified_date INTO Previous_BlackList_Close_Date  FROM ALARMS  WHERE ID = Last_processed_Alarm_id and status=2;
			EXCEPTION
			WHEN OTHERS THEN
			SELECT to_date ('01/01/1970' ,'dd/mm/yyyy') INTO Previous_BlackList_Close_Date FROM DUAL ;
		END ;
			BEGIN
				FOR subscriber IN Black_Listed_Subscribers (Previous_BlackList_Close_Date)
				LOOP
				BEGIN
					AvgSubscriberUsage := 0 ;
			       	IF subscriber.Fraud_Type = 'Subscription Fraud' THEN
					BEGIN
						FOR datastream IN DATA_STREAM
						LOOP
						BEGIN
							rs_str:='SELECT ID FROM service_number_types WHERE ID = '||subscriber.SERVICE_NUMBER_TYPE||' AND REPLACE('',''||RECORD_CONFIGS||'','','' '','''') LIKE ''%,'||datastream.ID||',%'' ';
							getqueryresult(rs_str,Value_field );
							IF (subscriber.SERVICE_NUMBER_TYPE = Value_field ) THEN
							BEGIN
						 		rs_str:='select database_field from field_configs where record_config_id='||datastream.ID||' and field_id = ( select FIELD_ASSOCIATION from field_record_config_maps where FIELD_CATEGORY_ID = 17 and RECORD_CONFIG_ID='||datastream.ID||')';
								getqueryresult(rs_str,Value_field );
								rs_str:='select database_field from field_configs where record_config_id='||datastream.ID||' and field_id = ( select FIELD_ASSOCIATION from field_record_config_maps where FIELD_CATEGORY_ID = 2 and RECORD_CONFIG_ID='||datastream.ID||')';
								getqueryresult(rs_str,Phone_Number_DBField );
								rs_str:='SELECT nvl(trunc(SUM('||Value_field||')/(COUNT(DISTINCT Day_of_Year)),4),0) FROM (SELECT day_of_year AS Day_of_Year,SUM('||Value_field||') AS '||Value_field||' FROM '||datastream.lookup_tname||' WHERE '||Phone_Number_DBField||'='||subscriber.Phone_Number||' AND subscriber_id='||subscriber.subscriber_id||' GROUP BY day_of_year)' ;
								getqueryresult(rs_str,getvalue );
								Total_Value := to_number(getvalue) ;
								AvgSubscriberUsage := AvgSubscriberUsage + Total_Value ;
								EXCEPTION
									WHEN NO_DATA_FOUND THEN
									NULL ;
							END;
							END IF;
						END ;
						END LOOP ;
						INSERT INTO FRAUDULENT_INFO (ACCOUNT_NAME, PHONE_NUMBER, NETWORK_ID , FRAUD_TYPE, ALARM_MODIFIED_DATE, AVERAGE_USAGE_PER_DAY, FIRST_CDR_TIME, ALARM_CREATED_DATE, ALARM_VALUE) VALUES (subscriber.Account_name, subscriber.Phone_number, subscriber.network_id , subscriber.Fraud_Type, subscriber.modified_date, AvgSubscriberUsage, sysdate, subscriber.Created_Date, 0) ;
						commit ;
					END ;
					ELSE
					BEGIN
						FOR datastream IN DATA_STREAM
						LOOP
						BEGIN
								rs_str:='SELECT ID FROM service_number_types WHERE ID = '||subscriber.SERVICE_NUMBER_TYPE||' AND REPLACE('',''||RECORD_CONFIGS||'','','' '','''') LIKE ''%,'||datastream.ID||',%'' ';
								getqueryresult(rs_str,Value_field );
							IF (Value_field = subscriber.SERVICE_NUMBER_TYPE  ) THEN
							BEGIN
								rs_str:='select A.Aggregation_Type from '||datastream.lookup_tname||' T, ALERTS A, Alert_CDR AC WHERE A.ID=AC.Alert_ID AND AC.Record_category='||datastream.ID||' AND A.Alarm_ID='||subscriber.ID||' AND T.ID=AC.CDR_ID' ;
								getqueryresult(rs_str, getvalue) ;
							  	rs_str1:='select distinct A.Aggregation_Value from ALERTS A, '||datastream.lookup_tname||' T, Alert_CDR AC where A.Aggregation_Type = (select id from aggregation_types where id = '||getvalue||' ) AND A.ID=AC.Alert_ID AND AC.Record_category='||datastream.ID||' AND A.Alarm_ID='||subscriber.ID||' AND T.ID=AC.CDR_ID AND T.DAY_OF_YEAR >= A.START_DAY AND T.DAY_OF_YEAR <= A.END_DAY AND T.ALERT_ID=AC.Alert_ID ';
								getqueryresult(rs_str1 ,AGG_VALUE );
								rs_str1:='select min(time_stamp) From (select min(T.time_stamp) AS time_stamp FROM '||datastream.lookup_tname||' T,Alerts A WHERE A.Aggregation_Value='''||AGG_VALUE||''')' ;
								 getqueryresult(rs_str1 ,First_DataStream_Time);
								 INSERT INTO FRAUDULENT_INFO (ACCOUNT_NAME, PHONE_NUMBER, NETWORK_ID, FRAUD_TYPE, ALARM_MODIFIED_DATE, AVERAGE_USAGE_PER_DAY, FIRST_CDR_TIME, ALARM_CREATED_DATE, ALARM_VALUE) VALUES (subscriber.Account_name, subscriber.Phone_number, subscriber.network_id, subscriber.Fraud_Type, subscriber.modified_date, 0, First_DataStream_Time, subscriber.Created_Date, subscriber.Value) ;
								 EXCEPTION
								 WHEN OTHERS THEN
									NULL ;
							END;
							END IF;
						END ;
						commit ;
						END LOOP ;
					END ;
					END IF ;
			END ;
				UPDATE configurations
				SET Value = TO_CHAR (subscriber.id)
				WHERE config_key = 'LAST_PROCESSED_BLACKLIST_ALARM_ID' ;
			END LOOP ;
			END ;
	commit;
    END ;
/
  CREATE OR REPLACE  PROCEDURE "DELETEOLDDATA"
is
PRAGMA AUTONOMOUS_TRANSACTION ;
begin
	delete from temp_rule_stat ;
	commit ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "SAVERULEINFO" (current_rule_key in number,total_alarms_for_rule in number,total_open_alarms in number,total_closed_alarms in number,total_nfr_alarm in number,total_frd_alarm in number,total_nfr_value in number,total_frd_value in number,current_network in number,total_declared_frd_value in number)
is
PRAGMA AUTONOMOUS_TRANSACTION ;
begin
	insert into temp_rule_stat (rule_key, rule_name,  total_alarms, total_open_alarms, total_closed_alarms, total_nfr_alarms, total_frd_alarms, total_nfr_value, total_frd_value, network_id, total_declared_frd_value)
		values(current_rule_key, GetRuleNameByRuleKey(current_rule_key), total_alarms_for_rule, total_open_alarms, total_closed_alarms, total_nfr_alarm, total_frd_alarm, total_nfr_value, total_frd_value , current_network, total_declared_frd_value) ;
	commit ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "TEMPRULESTAT" (start_date in Date, end_date in Date)
is
PRAGMA AUTONOMOUS_TRANSACTION ;
	begin
		insert into TEMP_RULE_STAT (
			RULE_KEY, RULE_NAME, TOTAL_ALARMS, TOTAL_OPEN_ALARMS, TOTAL_CLOSED_ALARMS,
			TOTAL_NFR_ALARMS, TOTAL_FRD_ALARMS, TOTAL_NFR_VALUE, TOTAL_FRD_VALUE, TOTAL_DECLARED_FRD_VALUE, NETWORK_ID)
		select	R.key, GetRuleNameByRuleKey(R.key), count(1),
		     sum(decode(status, 2, 0, 4, 0, 1)), sum(decode(status, 2,1, 4,1,0)),
		     sum(decode(status, 4, 1, 0)) , sum(decode(status, 2, 1, 0)),
		     sum(decode(status, 4, A.value, 0)), sum(decode(status, 2, A.value, 0)),
		     sum(A.declared_fraud_value) as total_declared_frd_value,
		     A.network_id
		from Rules R, Alarms A, Alerts T
		where A.ID = T.alarm_id and
		TRUNC(A.created_date) between TRUNC(start_date) and TRUNC(end_date) and
		T.event_instance_id = R.key and
				R.parent_id <> 1000 and
				R.smart_pattern_id = 0 and
		R.is_active = 1 and
				A.status <> 8
		group by R.key,  A.network_id ;
		commit ;
	end ;
/
  CREATE OR REPLACE  PROCEDURE "ADDRULESWITHOUTALARMS"
is
PRAGMA AUTONOMOUS_TRANSACTION ;
	begin
		insert into temp_rule_stat(
		select
				r.key , GetRuleNameByRuleKey(r.key), 0 ,0 ,0 ,0 ,0 ,0 ,0, nr.network_id, null
		from
				rules r,rule_tags_v rt, rule_networks_v rn, rule_datastreams_v rd, networks_rules nr
		WHERE
				r.key >= 1024 and
				r.parent_id not in (0, 1000)  and
				r.smart_pattern_id = 0 and
				nr.rule_id = r.id and
				(r.category is null or r.category in ('SMART_PATTERN','CalledToCalledBy')) and
				r.id = rt.rule_id and
				r.id = rn.rule_id and
				r.id = rd.rule_id and
				r.is_active = 1 and
				r.key not in ( select rule_key from temp_rule_stat where network_id = nr.network_id ) ) ;
		commit ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "DELETERULE" (p_rule_id in number) AS
	ExpressionIds DeleteRuleVars.array_ExpressionId ;
	FilterIds DeleteRuleVars.array_FilterId ;
	ListConfigIds DeleteRuleVars.array_ListConfigId ;
	p_rule_key	number(20) ;
	p_rule_version number(20) ;
begin
	select key, version into p_rule_key, p_rule_version from rules where id = p_rule_id ;
	delete from match_list_configurations where match_config_id = (select id from match_configurations where  rule_id = p_rule_id) ;
	delete from match_field_configurations mfc
		where exists (select 1 from match_configurations
						where id = mfc.match_config_id and rule_id = p_rule_id) ;
	delete from match_configurations where rule_id = p_rule_id ;
	select id bulk collect into ListConfigIds from list_configs lc, list_configs_rules lcr
		where lc.name is null
		and lc.id = lcr.list_config_id
		and lcr.rule_id = p_rule_id ;
	forall l_i in 1 .. ListConfigIds.count
		delete from list_details where list_config_id = ListConfigIds(l_i) ;
	forall l_i in 1 .. ListConfigIds.count
		delete from list_configs_networks where list_config_id = ListConfigIds(l_i) ;
	delete from list_configs_rules where rule_id = p_rule_id ;
	forall l_i in 1 .. ListConfigIds.count
		delete from list_configs where id = ListConfigIds(l_i) ;
	select ft.expression_id bulk collect into ExpressionIds from filter_tokens ft, filters_rules fr
		where ft.filter_id = fr.filter_id
		and fr.rule_id = p_rule_id
		and ft.expression_id is not null ;
	select filter_id bulk collect into FilterIds from filters_rules where rule_id = p_rule_id ;
	forall l_i in 1 .. FilterIds.count
		delete from filter_tokens where filter_id = FilterIds(l_i) ;
	forall l_i in 1 .. ExpressionIds.count
		delete from expressions where id = ExpressionIds(l_i) ;
	delete from filters_rules where rule_id = p_rule_id ;
	forall l_i in 1 .. FilterIds.count
		delete from filters where id = FilterIds(l_i) ;
	delete from rule_priority_maps where rule_id = p_rule_id ;
	delete from rules_schedulers where rule_id = p_rule_id ;
	delete from rules_subscriber_groups where rule_id = p_rule_id ;
	delete from rules_tags where rule_id = p_rule_id ;
	delete from autothreshold_usage_ranges where rule_id = p_rule_id ;
	delete from match_configurations where rule_id = p_rule_id ;
	delete from record_configs_rules where rule_id = p_rule_id ;
	delete from actions_rules where rule_id = p_rule_id ;
	delete from networks_rules where rule_id = p_rule_id ;
	delete from rule_notification_maps where rule_id = p_rule_id ;
	delete from rule_color_maps where rule_id = p_rule_id ;
	delete from hotlist_rules where rule_id = p_rule_id ;
	delete from analyst_actions_rules where rule_id = p_rule_id ;
	delete from negative_rule_queries where rule_id = p_rule_id ;
	delete from fraud_types_rules where rule_id = p_rule_id ;
	delete from negative_rule_exec_status where rule_id = p_rule_id ;
	delete from thresholds where rule_key = p_rule_key and rule_version = p_rule_version ;
	delete from rules where id = p_rule_id ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "DISABLERULE" (v_rule_id in number) AS
	v_rule_key  number(20) ;
	v_rule_version number(20) ;
	v_rule_category varchar(50) ;
	v_rule_mode varchar(50) ;
	v_run_id varchar(50) ;
	v_match_config_id number(20);
	v_is_enable number(20);
begin
	SELECT key, version ,category ,rule_mode INTO v_rule_key,v_rule_version ,v_rule_category, v_rule_mode FROM rules WHERE id=v_rule_id ;
	select is_enabled into v_is_enable from rules where key= v_rule_key and version = (select max(version) from rules where key = v_rule_key);
	if (v_is_enable=1) then
	UPDATE RULES SET is_active=0 where id = v_rule_id;
	INSERT INTO rules(id,user_id,is_active,is_enabled,parent_id,key,name,version,aggregation_type,accumulation_field,pseudo_function_id,
				accumulation_function,created_time, modification_time,severity,description,processor_type,category,
				is_smart_pattern,rule_mode,smart_pattern_id)
		select rules_seq.nextval,'system',1,0,parent_id,key,name,version+1,aggregation_type,accumulation_field,pseudo_function_id,
			accumulation_function,created_time, modification_time,severity,description,processor_type,category,
			is_smart_pattern,rule_mode,smart_pattern_id
		from rules
		where id=v_rule_id;
	if v_rule_category ='SMART_PATTERN' then
			UPDATE RULES SET is_enabled=0 , smart_pattern_id=rules_seq.currval where smart_pattern_id=v_rule_id;
		insert into sp_blocks(id,template_id,rule_name,rule_id,block_id,block_type,duration,xpos,ypos)
	select sp_blocks_seq.nextval,rules_seq.currval,rule_name,rule_id,block_id,block_type,duration,xpos,ypos
		from sp_blocks where template_id= v_rule_id;
		insert into sp_connections (id,template_id,source_block,target_block,duration)
	    select sp_connections_seq.nextval,rules_seq.currval,source_block,target_block,duration
		from sp_connections where template_id= v_rule_id;
    end if;
	insert into FILTERS_RULES(rule_id ,filter_id)
		select rules_seq.currval ,filter_id
			from filters_rules
			where rule_id=v_rule_id;
	insert into NETWORKS_RULES(rule_id ,network_id)
		select rules_seq.currval ,network_id
			from networks_rules
			where rule_id=v_rule_id;
	insert into RECORD_CONFIGS_RULES(rule_id , record_config_id,granularity)
		select rules_seq.currval , record_config_id, granularity
			from record_configs_rules
			where rule_id=v_rule_id;
	insert into RULES_SUBSCRIBER_GROUPS(rule_id ,subscriber_group_id)
		select rules_seq.currval ,subscriber_group_id
			from RULES_SUBSCRIBER_GROUPS
			where rule_id=v_rule_id;
	insert into RULE_PRIORITY_MAPS(id, rule_id , priority)
		select rule_priority_maps_seq.nextval,rules_seq.currval ,priority
			from RULE_PRIORITY_MAPS
			where rule_id=v_rule_id;
	insert into ANALYST_ACTIONS_RULES(rule_id ,analyst_action_id)
		select rules_seq.currval,analyst_action_id
			from ANALYST_ACTIONS_RULES
			where rule_id=v_rule_id;
	insert into ACTIONS_RULES(rule_id ,action_id)
		select rules_seq.currval,action_id
			from ACTIONS_RULES
			where rule_id=v_rule_id;
	insert into FRAUD_TYPES_RULES(rule_id ,fraud_type_id)
		select rules_seq.currval,fraud_type_id
			from FRAUD_TYPES_RULES
			where rule_id=v_rule_id;
	insert into RULE_NOTIFICATION_MAPS(id,rule_id ,rule_group,notification_pack_id)
		select rule_notification_maps_seq.nextval,rules_seq.currval,rule_group,notification_pack_id
			from RULE_NOTIFICATION_MAPS
			where rule_id=v_rule_id;
	insert into RULES_TAGS(rule_id ,tag_id)
		select rules_seq.currval,tag_id
			from RULES_TAGS
			where rule_id=v_rule_id;
	insert into NEGATIVE_RULE_QUERIES(id,rule_id,query,rewritten_query)
		select negative_rule_queries_seq.nextval,rules_seq.currval,query,rewritten_query
			from NEGATIVE_RULE_QUERIES
			where rule_id=v_rule_id;
	insert into HOTLIST_RULES(id,rule_id,entity_id,filter_token_id,hotlist_group_id,category)
		select hotlist_rules_seq.nextval,rules_seq.currval,entity_id,filter_token_id,hotlist_group_id,category
			from HOTLIST_RULES
			where rule_id=v_rule_id;
	insert into LIST_CONFIGS_RULES(rule_id ,list_config_id)
		select rules_seq.currval,list_config_id
			from LIST_CONFIGS_RULES
			where rule_id=v_rule_id;
	INSERT INTO thresholds (id,threshold_id,aggregation_type,reference_id,aggregation_value,rule_key,
				rule_version,value,version,start_date,end_date,start_time,end_time,duration,effective_time,
				effective_day,effective_week_day,is_active,changed_status,expiry_date,modified_date,duration_type_id)
		select thresholds_seq.nextval,threshold_id,aggregation_type,reference_id,aggregation_value,rule_key,rule_version+1,
			value,version,start_date,end_date,start_time,end_time,duration,effective_time,effective_day,effective_week_day,
			is_active,changed_status,expiry_date,modified_date,duration_type_id
		from thresholds
		where rule_key=v_rule_key and rule_version=v_rule_version;
	if (v_rule_category = 'STATISTICAL_RULE' OR v_rule_category = 'STATISTICAL_ONLINE')
	then
		INSERT INTO formulas (id, description)
			values (formulas_seq.nextval, null) ;
		INSERT INTO rule_formula_map (id, rule_id, formula_id)
			values(rule_formula_map_seq.nextval, rules_seq.currval, formulas_seq.currval) ;
		INSERT INTO formula_expressions (id, formula_id, sequence, value, value_field_indicator, value_data_type, indents, newlines)
			select formula_expressions_seq.nextval, formulas_seq.currval, sequence, value, value_field_indicator, value_data_type, indents,newlines
			from formula_expressions where formula_id = (select formula_id from rule_formula_map where rule_id = v_rule_id) ;
		INSERT INTO formula_additionals (id, element_id, hierarchy_path_id, duration, duration_type_id, stat_function_id, stat_duration, start_date,
			end_date, start_time, end_time, effective_time, effective_day, effective_week_day)
		select formula_additionals_seq.nextval, element_id, hierarchy_path_id, duration, duration_type_id, stat_function_id, stat_duration,
			start_date, end_date, start_time, end_time, effective_time, effective_day, effective_week_day
		from formula_additionals where to_char(id) in (select value from formula_expressions
			where formula_id = (select formula_id from rule_formula_map where rule_id = v_rule_id) and value_field_indicator in (1033,1034)) ;
	end if ;
		begin
		if (v_rule_mode=3) then
		select id into v_run_id
			from rtf_test_runs
		 	where rule_id=v_rule_id;
		INSERT into rtf_test_runs (id,pseudo_function_id,rule_id,seq_run_id,rule_mode,dataset_type,dataset_start_time,dataset_end_time,
			total_entities,user_id,run_status,scheduler_id,ref_dataset_type)
				select rtf_test_runs_seq.nextval,pseudo_function_id,rules_seq.currval,seq_run_id+1,rule_mode,dataset_type,dataset_start_time,
					dataset_end_time,total_entities,user_id,run_status,scheduler_id,ref_dataset_type
			from rtf_test_runs
			where rule_id=v_rule_id;
		insert into rtf_test_run_entity_results (run_id,entity_group_id	)
				select rtf_test_runs_seq.currval,entity_group_id from rtf_test_run_entity_results where run_id=v_run_id;
		insert into rtf_test_run_results(run_id,run_start_time,run_end_time)
					select rtf_test_runs_seq.currval, run_start_time,run_end_time from rtf_test_run_results where run_id=v_run_id;
		end if;
		exception
		when no_data_found then
		return;
		end;
begin
		SELECT id INTO v_match_config_id
		from match_configurations
		where rule_id=v_rule_id;
		INSERT INTO match_configurations (id,rule_id,exclude_word_length,min_match_percentage,min_match_records,restrict_participated_records)
		select match_configurations_seq.nextval,rules_seq.currval,exclude_word_length,min_match_percentage,min_match_records,restrict_participated_records
			from match_configurations
			where rule_id=v_rule_id;
		INSERT INTO match_field_configurations (id,match_config_id,field_id,weightage,is_field_checked,is_exact,is_phonetic,
				is_substring,is_word,is_fuzzy,minimum_percentage_match,exclude_words,cross_match_fields,display_in_view)
		select match_field_configurations_seq.nextval,match_configurations_seq.currval,field_id,weightage,is_field_checked,
			is_exact,is_phonetic,is_substring,is_word,is_fuzzy,minimum_percentage_match,exclude_words,cross_match_fields,display_in_view
		from match_field_configurations
		where match_config_id=v_match_config_id;
		exception
		when no_data_found then
		return;
end;
	commit;
	end if;
end;
/
  CREATE OR REPLACE  PROCEDURE "EXECUTEALARMLINK" AS
	BEGIN
		alarmlinkalarmcdrs ;
	EXCEPTION
	   when others then
	   dbms_output.put_line('ERROR:' ||SQLERRM) ;
	END ;
/
  CREATE OR REPLACE  PROCEDURE "GENERATERTFACTIVEENTITY" (p_entity_record_config_id in number, table_name in varchar2, p_service_num_type IN NUMBER) AS
	group_table_name		varchar(100) ;
	grp_primary_where_clause    varchar2(4000) ;
	RTF_DST_ACTIVE_ENTITY		number := 1 ;
	v_where_clause				varchar(100) ;
	SUBSCRIBER_RC_ID			number := 3 ;
begin
		select tname into group_table_name from record_configs
			where id = p_entity_record_config_id ;
		select nvl(where_clause,'1=1') into grp_primary_where_clause from record_view_configs
			where record_config_id = p_entity_record_config_id
			and is_primary_view = 1 ;
		if p_entity_record_config_id = SUBSCRIBER_RC_ID then
			v_where_clause := ' AND service_number_type='||p_service_num_type ;
		else
			v_where_clause := '' ;
		end if ;
		for rtf_entity_group in (select id,name from rtf_entity_groups_v where entity_type = p_entity_record_config_id and dataset_type = RTF_DST_ACTIVE_ENTITY)
		loop
			execute immediate 'insert /*+ append nologging*/ into ' || table_name
						|| '(id, group_id, reference_id, record_config_id, dataset_type, service_number_type)
						select rownum, :GroupID, id, :RecordConfigId, :DatasetType, :ServiceNumberType from '
						|| group_table_name || ' where CompareCSV(groups, :GroupName) > 0'
						|| ' and ' ||grp_primary_where_clause || v_where_clause
						using rtf_entity_group.id, p_entity_record_config_id, RTF_DST_ACTIVE_ENTITY, p_service_num_type, rtf_entity_group.name ;
		commit ;
		end loop ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "GENERATERTFDECISIONEDENTITY" (p_entity_record_config_id in number, p_dataset_type in number,table_name in varchar2, p_service_num_type IN NUMBER) AS
		RTF_DST_ARCHIVED_NFR_FRD 	number := 4 ;
		alarm_table					varchar2(100) ;
		cleanup_relation			char(3) ;
begin
	if p_dataset_type = RTF_DST_ARCHIVED_NFR_FRD then
		alarm_table := 'archived_alarms_v' ;
		cleanup_relation := '<' ;
	else
		alarm_table := 'alarm_views' ;
		cleanup_relation := '>=' ;
	end if ;
		for rtf_entity_group in (select id,name from rtf_entity_groups_v where entity_type = p_entity_record_config_id and dataset_type = p_dataset_type)
		loop
			execute immediate 'insert /*+ append nologging*/ into '|| table_name || '(id, group_id, reference_id, record_config_id, dataset_type, service_number_type)
						select rownum, :GroupID, id, :RecordConfigId, :DatasetType, :ServiceNumberType from
							(select distinct a.reference_id as id from
							'|| alarm_table ||' a,reference_types rt,rtf_entity_groups g
							where a.reference_id != 0
							and a.status = g.group_reference
							and a.reference_type = rt.id
							and a.service_number_type = :ServiceNumberType
							and rt.record_config_id is not null
							and rt.record_config_id = g.entity_type
							and g.id = :GroupID
							and a.modified_date ' || cleanup_relation || ' ((select trunc(to_date(value, ''YYYY/MM/DD HH24:MI:SS'')) from
								configurations	where config_key=''CLEANUP.ALARMS.LAST_RUN_DATE'') - (select to_number(value) from configurations
								where config_key = ''CLEANUP.ALARMS.INTERVAL_IN_DAYS'')))'
						using rtf_entity_group.id, p_entity_record_config_id, p_dataset_type, p_service_num_type, p_service_num_type, rtf_entity_group.id ;
		commit ;
		end loop ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "GENERATERTFENTITYSUMMARY" (p_entity_record_config_id in number, p_dataset_type in number, p_service_num_type IN NUMBER) AS
		RTF_DST_ACTIVE_ENTITY		number := 1 ;
		RTF_DST_NFR_FRD 			number := 3 ;
		RTF_DST_ARCHIVED_NFR_FRD 	number := 4 ;
		RC_DATASET_TABLE_MAP	    varchar(30)  ;
		RC_DATASET_INDEX	varchar(30) ;
	begin
		select table_name into RC_DATASET_TABLE_MAP from RTF_RECORDCONFIG_DATASET_MAP where RECORD_CONFIG_ID = p_entity_record_config_id and DATASET_TYPE = p_dataset_type ;
		select index_name into RC_DATASET_INDEX from user_indexes where table_name = RC_DATASET_TABLE_MAP ;
		execute immediate 'alter index ' || RC_DATASET_INDEX || '  unusable';
		EXECUTE IMMEDIATE 'DELETE FROM ' || RC_DATASET_TABLE_MAP || ' WHERE service_number_type = ' || p_service_num_type || ' and dataset_type = ' || p_dataset_type ;
		if p_dataset_type = RTF_DST_ACTIVE_ENTITY then
			GenerateRTFActiveEntity(p_entity_record_config_id,RC_DATASET_TABLE_MAP, p_service_num_type) ;
		else
			GenerateRTFDecisionedEntity(p_entity_record_config_id, p_dataset_type,RC_DATASET_TABLE_MAP, p_service_num_type) ;
		end if;
		execute immediate 'alter index '|| RC_DATASET_INDEX|| ' rebuild';
		delete from rtf_entity_group_summary where record_config_id = p_entity_record_config_id and dataset_type = p_dataset_type and service_number_type = p_service_num_type ;
		insert into rtf_entity_group_summary(group_id, group_count, dataset_type, record_config_id, service_number_type)
			select group_id, count(id), dataset_type, record_config_id,service_number_type from rtf_entity_group_map_V
				where record_config_id = p_entity_record_config_id
					and dataset_type = p_dataset_type
					and service_number_type = p_service_num_type
				group by group_id, dataset_type, record_config_id, service_number_type ;
	commit ;
	end ;
/
  CREATE OR REPLACE  PROCEDURE "ASSIGN_INTUSER_TASKS" (ranger_group_id in NUMBER)
AS
	CURSOR ranger_parent_tasks IS
	SELECT id
	FROM tasks
	WHERE name in ('Alarm Management', 'Rule Management', 'Fingerprint Management', 'User Management', 'Internal User View')
	and parent_id = 1;
	rparenttask ranger_parent_tasks%ROWTYPE ;
	CURSOR ranger_sub_tasks IS
	SELECT distinct id
	FROM tasks
	WHERE name != 'Allow For All Roles'
	start with id = rparenttask.id
	connect by prior id = parent_id ;
	rsubtask ranger_sub_tasks%ROWTYPE ;
	CURSOR ranger_selected_tasks IS
	SELECT id
	FROM tasks
	WHERE name in ('Record View', 'Adjustment Logs', 'CRM Logs');
	rselectedtask ranger_selected_tasks%ROWTYPE ;
BEGIN
   OPEN ranger_parent_tasks;
   LOOP
   		FETCH ranger_parent_tasks into rparenttask;
   		EXIT WHEN ranger_parent_tasks%NOTFOUND;
   		OPEN ranger_sub_tasks;
   		LOOP
			FETCH ranger_sub_tasks into rsubtask;
			EXIT WHEN ranger_sub_tasks%NOTFOUND;
			insert into ranger_groups_tasks values (ranger_group_id, rsubtask.id) ;
		END LOOP;
		CLOSE ranger_sub_tasks;
	END LOOP;
	COMMIT;
	CLOSE ranger_parent_tasks;
	OPEN ranger_selected_tasks;
	LOOP
		FETCH ranger_selected_tasks into rselectedtask;
		EXIT WHEN ranger_selected_tasks%NOTFOUND;
		insert into ranger_groups_tasks values (ranger_group_id, rselectedtask.id) ;
	END LOOP
	COMMIT;
	CLOSE ranger_selected_tasks;
END assign_intuser_tasks;
/
  CREATE OR REPLACE  PROCEDURE "ADDAUTOTHRESHOLD" (thrs_id IN NUMBER, ref_id IN NUMBER, agg_val in VARCHAR2, val IN NUMBER)
AS
    old_version NUMBER(10) := -1 ;
    old_val NUMBER(16,6) ;
	old_modified_date DATE ;
	old_expiry_date DATE ;
	old_status NUMBER(3) ;
	old_threshold_active_param NUMBER(3) ;
	threshold_rule_key NUMBER(20) ;
	old_threshold_version NUMBER(10) := 0;
	new_threshold_version NUMBER(10) := 0;
	status NUMBER(1) := 0;
BEGIN
 SAVEPOINT ATE_SAVE_POINT ;
	BEGIN
			begin
		    	select	is_active into old_threshold_active_param from auto_thresholds where threshold_id = thrs_id and reference_id = ref_id and aggregation_value = agg_val ;
				status := old_threshold_active_param ;
			exception
    			when no_data_found then
					status := 1 ;
			end ;
			begin
				select rule_key into threshold_rule_key from thresholds where id = thrs_id ;
			exception
    			when no_data_found then
					ROLLBACK TO SAVEPOINT ATE_SAVE_POINT ;
					RAISE ;
			end ;
			insert into archived_thresholds ( id, threshold_id, reference_id, aggregation_value, value, threshold_version, modified_date, changed_status, expiry_date, is_active) select archived_thresholds_seq.nextval, threshold_id, reference_id, aggregation_value, value, threshold_version, modified_date, changed_status, expiry_date, 0 from auto_thresholds where aggregation_value = agg_val and reference_id = ref_id and threshold_id in ( select id from thresholds where rule_key = threshold_rule_key and threshold_id = 0) ;
			delete from auto_thresholds where aggregation_value = agg_val and reference_id = ref_id and threshold_id in ( select id from thresholds where rule_key = threshold_rule_key and threshold_id = 0) ;
			begin
				select max(threshold_version) into old_threshold_version from ARCHIVED_THRESHOLDS AT, THRESHOLDS T
				where 	AT.reference_id = ref_id
				and 	AT.aggregation_value = agg_val
				and 	T.rule_key = threshold_rule_key
				and 	T.id = AT.THRESHOLD_ID ;
				if old_threshold_version is null
				then
					new_threshold_version := 1 ;
				else
					new_threshold_version := old_threshold_version + 1 ;
				end if ;
			exception
    			when no_data_found then
					new_threshold_version := 1 ;
			end ;
   			INSERT INTO auto_thresholds(id, threshold_id, reference_id, aggregation_value,value, threshold_version, modified_date, is_active, changed_status) values (auto_thresholds_seq.nextval, thrs_id, ref_id, agg_val, val, new_threshold_version, sysdate, status, 1) ;
			commit ;
	EXCEPTION
    	when others then
			ROLLBACK TO SAVEPOINT ATE_SAVE_POINT ;
			RAISE ;
    END ;
EXCEPTION
    when others then
			dbms_output.put_line('Error 4 ' || SQLCODE ||  ': ' ||SQLERRM);
		ROLLBACK TO SAVEPOINT ATE_SAVE_POINT ;
		RAISE ;
end AddAutoThreshold ;
/
  CREATE OR REPLACE  PROCEDURE "FP_TABLE_VIEW_MUL_INST" (offline_id in number, v_instance_id in number) IS
	v_entity_type number(5) ;
	v_entity_id number(5) ;
	v_counter_category number(5) ;
	create_sql varchar2 (32000) ;
begin
if (v_instance_id != 0)
then
	select counter_category into v_counter_category from in_memory_counter_details where id = offline_id and counter_instance_id = 0 ;
    if ( v_counter_category in (5))
    then
		begin
			select entity_type into v_entity_id from profile_manager_entity_configs where OFFLINE_COUNTER_ID = offline_id ;
			select entity_type into v_entity_type from fp_entities where  id = v_entity_id and category like '%FP%' ;
			create_sql := '' ;
			create_sql := 'create table FP_PROFILES_'||v_entity_type||'_'||v_instance_id||'_2
			TABLESPACE no28_TS_FP_PROFILES
			as select * from FP_PROFILES where 1=0
			' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||' CREATE INDEX IX_FP_PROF_ENT_ID_'||v_entity_type||'_'||v_instance_id||'_2 ON ' ;
			create_sql := create_sql||'FP_PROFILES_'||v_entity_type||'_'||v_instance_id||'_2("PROFILED_ENTITY_ID")
			TABLESPACE no28_TS_FP_PROFILESIND
			' ;
			execute immediate create_sql ;
			select entity_type into v_entity_type from fp_entities where  id = v_entity_id and category like '%FP%' ;
			create_sql := 'create table FP_PROFILES_'||v_entity_type||'_'||v_instance_id||'_3
			TABLESPACE no28_TS_FP_PROFILES
			as select * from FP_PROFILES where 1=0
			' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||' CREATE INDEX IX_FP_PROF_ENT_ID_'||v_entity_type||'_'||v_instance_id||'_3 ON ' ;
			create_sql := create_sql||'FP_PROFILES_'||v_entity_type||'_'||v_instance_id||'_3("PROFILED_ENTITY_ID")
			TABLESPACE no28_TS_FP_PROFILESIND
			' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_PROFILES_MAP_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER != -1) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_MATCH_TYPE_0_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1,0)) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_MATCH_TYPE_0_'||v_entity_type||'_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1,0) and entity_id = v_entity_id) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
			create_sql := '' ;
			create_sql := create_sql||'CREATE OR REPLACE VIEW FP_ENTITYID_'||v_entity_type||'_V AS (';
			for i in (select tname from FP_PROFILES_DATASET_MAP where RUN_IDENTIFIER not in (-1) and entity_id = v_entity_id) loop
				create_sql := create_sql||'SELECT * FROM '||i.tname||' UNION ALL ' ;
			end loop ;
			SELECT SUBSTR(create_sql, 1, INSTR(create_sql, 'UNION ALL', -1)-1) INTO create_sql FROM dual ;
			create_sql := create_sql||')' ;
			execute immediate create_sql ;
		exception
		when no_data_found then
			v_entity_type := 0 ;
		end ;
	end if ;
end if ;
end ;
/
  CREATE OR REPLACE  PROCEDURE "ENCRYPT" (input_string IN VARCHAR2 , key_bytes_raw IN RAW, iv_bytes_raw IN RAW, encryption_type IN PLS_INTEGER, encrypted_raw IN OUT RAW) IS
BEGIN
	encrypted_raw := DBMS_CRYPTO.ENCRYPT
    (
     src => UTL_I18N.STRING_TO_RAW (input_string,  'AL32UTF8'),
     typ => encryption_type,
     key => key_bytes_raw,
     iv => iv_bytes_raw
    ) ;
END ;
/
  CREATE OR REPLACE  PROCEDURE "DECRYPT" (encrypted_raw IN VARCHAR2 , key_bytes_raw IN RAW, iv_bytes_raw IN RAW, encryption_type IN PLS_INTEGER, output_string IN OUT VARCHAR2) IS
  decrypted_raw RAW (2048) ;
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT
    (
     src => encrypted_raw,
     typ => encryption_type,
     key => key_bytes_raw,
     iv => iv_bytes_raw
     ) ;
    output_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8') ;
EXCEPTION
WHEN OTHERS
THEN
	output_string := NULL ;
END ;
/
