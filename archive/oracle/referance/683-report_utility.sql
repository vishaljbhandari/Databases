set serveroutput off ;
CREATE OR REPLACE PACKAGE ReportUtility
AS

	FUNCTION GetEffeciveWeekDay(day IN number, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2 ;
	FUNCTION GetAlarmStatus(status IN number) RETURN VARCHAR2 ;
	FUNCTION GetEffeciveWeekDayString(days IN VARCHAR2, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2 ; 
	FUNCTION GetDateStringByCalendar(sqldate IN DATE, format IN VARCHAR2, calendar IN VARCHAR2) RETURN VARCHAR2 ;
	FUNCTION GetEffeciveMonthOfYearString(months IN VARCHAR2, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2 ;
	FUNCTION GetStatsRuleExpressionByRuleID(input_rule_id IN VARCHAR2) return varchar2 ; 
	FUNCTION GetDisplayThreshold(pseudo_func_id in number, threshold in number) RETURN VARCHAR2 ;
	FUNCTION GetDisplayRuleDuration(pseudo_func_id in number, duration in number) RETURN VARCHAR2 ;

END ReportUtility ;
/

CREATE OR REPLACE PACKAGE BODY ReportUtility AS

    FUNCTION GetEffeciveWeekDay(day IN number, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2
    AS
        position NUMBER(2) := 0 ;
        description VARCHAR2(256) := '' ;
    BEGIN
		IF (calendar = 'islamic') THEN
        	FOR i IN 1..7
			LOOP
				IF ((BITAND(day, power(2, i-1)) + 0) = power(2, i-1)) THEN
					SELECT (DECODE(description, NULL, '', description ||', ')|| DECODE(i, 
					 	1, CAST('al-ahad' AS VARCHAR2(10)), 
					 	2, 'al-ithnayn', 
					 	3, 'ath-thulaathaa', 
					 	4, 'al-arbia`aa', 
					 	5, 'al-khamis', 
					 	6, 'al-jumu`a', 
					 	7, 'as-sabt')) into description from dual ;
				END IF ;
			END LOOP ;
		ELSIF (calendar = 'jalaali') THEN
			FOR i IN 1..7
			LOOP
				IF ((BITAND(day, power(2, i-1)) + 0) = power(2, i-1)) THEN
					SELECT (DECODE(description, NULL, '', description ||', ')|| DECODE(i, 
					 	1, CAST('Yekshanbeh' AS VARCHAR2(10)), 
					 	2, 'Doshanbeh', 
					 	3, 'Seshhanbeh', 
					 	4, 'Chaharshanbeh', 
					 	5, 'Panjshanbeh', 
					 	6, 'Jomeh', 
					 	7, 'Shanbeh')) into description from dual ;
				END IF ;
			END LOOP ;
		ELSE
			FOR i IN 1..7
			LOOP
				IF ((BITAND(day, power(2, i-1)) + 0) = power(2, i-1)) THEN
					SELECT (DECODE(description, NULL, '', description ||', ')|| DECODE(i, 
					 	1, CAST('Sunday' AS VARCHAR2(10)), 
					 	2, 'Monday', 
					 	3, 'Tuesday', 
					 	4, 'Wednesday', 
					 	5, 'Thursday', 
					 	6, 'Friday', 
					 	7, 'Saturday')) into description from dual ;
				END IF ;
			END LOOP ;
		END IF ;
        RETURN description ;
    END GetEffeciveWeekDay ;

	FUNCTION GetEffeciveMonthOfYearString(months IN VARCHAR2, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2
    AS
        month_string VARCHAR2(300) := '' ;
        string_size NUMBER(2) := ceil(length(months)/2) ;
        temp_month VARCHAR2(30) ;
        counter NUMBER(2) := 1 ;
    BEGIN
        IF months = '-1' THEN
            RETURN 'All Months' ;
        END IF ;
		IF (calendar = 'islamic') THEN
        WHILE counter <= string_size
        LOOP
                select decode(counter, '1','Muharram',
                                       '2','Safar',
                                       '3','Rabi` I',
                                       '4','Rabi` II',
                                       '5','Jumada I',
                                       '6','Jumada II',
                                       '7','Rajab',
                                       '8','Sha`ban',
                                       '9','Ramadan',
                                       '10', 'Shawwal',
                                       '11', 'Du al-Qa`da',
                                       '0', 'Du al-Hijja',
                                       '12', 'Du al-Hijja') into temp_month from dual ;
                month_string := month_string||temp_month||', ' ;
            counter := counter + 1 ;
        END LOOP ;
		ELSIF (calendar = 'jalaali') THEN
        WHILE counter <= string_size
        LOOP
                select decode(counter, '1','Farvardin',
                                       '2','Ordibehest',
                                       '3','Xordad',
                                       '4','Tir',
                                       '5','Mordad',
                                       '6','Sahrivar',
                                       '7','Mehr',
                                       '8','Aban',
                                       '9','Azar',
                                       '10', 'Dey',
                                       '11', 'Bahman',
                                       '0', 'Esfand',
                                       '12', 'Esfand') into temp_month from dual ;
                month_string := month_string||temp_month||', ' ;
            counter := counter + 1 ;
        END LOOP ;
        ELSE
        WHILE counter <= string_size
        LOOP
                select decode(counter, '1','January',
                                       '2','Feburary',
                                       '3','March',
                                       '4','April',
                                       '5','May',
                                       '6','June',
                                       '7','July',
                                       '8','August',
                                       '9','September',
                                       '10', 'October',
                                       '11', 'November',
                                       '0', 'December',
                                       '12', 'December') into temp_month from dual ;
                month_string := month_string||temp_month||', ' ;
            counter := counter + 1 ;
        END LOOP ;
		END IF ;
        select trim(trailing ',' from trim(trailing ' ' from month_string )) into month_string from dual ;
        RETURN month_string ;
    END GetEffeciveMonthOfYearString ;

	FUNCTION GetEffeciveWeekDayString(days IN VARCHAR2, calendar IN VARCHAR DEFAULT NULL) RETURN VARCHAR2
    AS
        string_size NUMBER(2) := ceil(length(days)/2) ;
        days_string VARCHAR2(300) := '' ;
        temp_day VARCHAR2(30) ;
        counter NUMBER(2) := 1 ;
    BEGIN
        IF days = '-1' THEN
            RETURN 'All Days' ;
        END IF ;
		IF (calendar = 'islamic') THEN
        WHILE counter <= string_size
        LOOP
                select decode(counter, '0','al-ahad',
                                       '1','al-ithnayn',
                                       '2','ath-thulaathaa',
                                       '3','al-arbia`aa',
                                       '4','al-khamis',
                                       '5','al-jumu`a',
                                       '6','as-sabt',
                                       '7','al-ahad') into temp_day from dual ;
                days_string := days_string||temp_day||', ' ;
            counter := counter + 1 ;
        END LOOP ;
		ELSIF (calendar = 'jalaali') THEN
        WHILE counter <= string_size
        LOOP
                select decode(counter, '0','Yekshanbeh',
                                       '1','Doshanbeh',
                                       '2','Seshhanbeh',
                                       '3','Chaharshanbeh',
                                       '4','Panjshanbeh',
                                       '5','Jomeh',
                                       '6','Shanbeh',
                                       '7','Yekshanbeh') into temp_day from dual ;
                days_string := days_string||temp_day||', ' ;
            counter := counter + 1 ;
        END LOOP ;
        ELSE
        WHILE counter <= string_size
        LOOP
                select decode(counter, '0','Sunday',
                                       '1','Monday',
                                       '2','Tuesday',
                                       '3','Wednesday',
                                       '4','Thursday',
                                       '5','Friday',
                                       '7','Sunday',
                                       '6','Saturday') into temp_day from dual ;
                days_string := days_string||temp_day||', ' ;
            counter := counter + 1 ;
        END LOOP ;
		END IF ;
        select trim(trailing ',' from trim(trailing ' ' from days_string)) into days_string from dual;
      RETURN days_string ;
    END GetEffeciveWeekDayString ;
	
    FUNCTION GetAlarmStatus(status IN number) RETURN VARCHAR2
    AS
        description VARCHAR2(25) := '' ;
    BEGIN
		SELECT DECODE
			(
				status,
				0, CAST('Altered' AS VARCHAR2(25)),
				1, 'Available',
				2, 'Fraudulent',
				3, 'Under Investigation',
				4, 'Non-Fraudulent',
				5, 'Pending',
				6, 'New',
				7, 'Hold',
				8, 'Deleted'
			) INTO description from dual ;
	
	    RETURN description ;
    END GetAlarmStatus ;

    FUNCTION GetDateStringByCalendar(sqldate IN DATE, format IN VARCHAR2, calendar IN VARCHAR2) RETURN VARCHAR2
    AS
         description VARCHAR2(50) := '' ;
    BEGIN
		IF (calendar = 'islamic') THEN
			SELECT replace(to_char(sqldate, format,'nls_calendar=''english hijrah''' ), '  ', '') INTO description from dual ;
		ELSIF (calendar = 'jalaali') THEN
			SELECT replace(to_char(sqldate, format,'nls_calendar=''persian''' ), ' ', '') INTO description from dual ;
		ELSE
			SELECT to_char(sqldate, format,'nls_calendar=''gregorian''' ) INTO description from dual ;
		END IF ;
	    RETURN description ;
    END GetDateStringByCalendar ;

	FUNCTION GetDisplayThreshold(pseudo_func_id in number, threshold in number) RETURN VARCHAR2
    AS
		component_id NUMBER := 0 ;
    BEGIN

	    IF pseudo_func_id = 8 OR pseudo_func_id = 70 
		THEN
			RETURN TO_CHAR(threshold/86400) || ' days' ;
		END IF ;

		SELECT component_id INTO component_id FROM components_pseudo_functions 
			WHERE pseudo_function_id = pseudo_func_id ;
							  
 		IF component_id = 2
		THEN
			RETURN utility.seconds_to_time_string(threshold) ;
		ELSIF component_id = 3
		THEN
			RETURN utility.threshold_seconds_to_string(threshold) ;
		ELSE
			RETURN to_char(threshold) ;
		END IF ;

    END GetDisplayThreshold ;

	FUNCTION GetDisplayRuleDuration(pseudo_func_id in number, duration in number) RETURN VARCHAR2
    AS
	    display_duration VARCHAR2(100) ;
    BEGIN
	    IF duration = 0 OR pseudo_func_id = 8 OR pseudo_func_id = 70
		THEN
			RETURN '-' ;
		END IF ;
		RETURN Utility.seconds_to_time_string(duration) ; 
    END GetDisplayRuleDuration ;

FUNCTION GetStatsRuleExpressionByRuleID(input_rule_id IN VARCHAR2) return varchar2
AS
	expression_string 	VARCHAR2(10000) := '' ;
	profile_field 		VARCHAR2(256) := '';
	entity_data_field_name 	VARCHAR2(100) := '';
	record_view_config_name VARCHAR2(100) := '' ;
	i integer := 1;
	offset integer :=1;
	prev_offset integer  := 1;
	srvname 		varchar2(100) := '';
	drvname			varchar2(100) :='' ;
	token			varchar2(100) :='' ;
	dvid			integer :=0;
	svid 			integer :=0;
	var_field_id  integer := 0 ;

	cursor formula_expressions_cursor is 
		select value, VALUE_FIELD_INDICATOR, ELEMENT_ID from (
		select fe.id, fe.value, fe.VALUE_FIELD_INDICATOR, fa.ELEMENT_ID from formula_expressions fe, FORMULA_ADDITIONALS fa
		 where fe.FORMULA_ID = (select formula_id from rule_formula_map where to_char(rule_id) = input_rule_id)
		 and fe.VALUE_FIELD_INDICATOR in (1033,1034) and fe.value = to_char(fa.id)
		 union all
		 select fe.id, fe.value, fe.VALUE_FIELD_INDICATOR, 0 from formula_expressions fe
		  where fe.FORMULA_ID = (select formula_id from rule_formula_map where to_char(rule_id) = input_rule_id)
		  and fe.VALUE_FIELD_INDICATOR not in (1033,1034)
		  ) order by id ;
	formula_expressions_cursor_map  formula_expressions_cursor%ROWTYPE;

BEGIN
	open formula_expressions_cursor ;
	loop
	fetch formula_expressions_cursor into formula_expressions_cursor_map ;
	exit when formula_expressions_cursor%NOTFOUND ;
		if (formula_expressions_cursor_map.VALUE_FIELD_INDICATOR = 1033)
		then
			select distinct (NAME) into profile_field from fp_elements where to_char(fp_elements.RULE_KEY) = formula_expressions_cursor_map.ELEMENT_ID ;
			select name into record_view_config_name from record_view_configs 
				where 
				RECORD_CONFIG_ID = (select distinct(record_config_id) from record_configs_rules, rules where record_configs_rules.rule_id = input_rule_id) 
				and rownum = 1;
			if (record_view_config_name  = '' or record_view_config_name  = ' ' )
			then
				expression_string := expression_string || profile_field || ' ' ;
			else
				expression_string := expression_string || record_view_config_name|| '.'  || profile_field || ' ' ;
			end if ;
		elsif (formula_expressions_cursor_map.VALUE_FIELD_INDICATOR = 1041)
		then
			prev_offset := 1 ;
			offset := 1 ;
			offset := INSTR(formula_expressions_cursor_map.VALUE,'.',offset,1) ;
				
			if (offset = 0)
			then
				select NAME into entity_data_field_name from field_configs 
					where 
					field_id = formula_expressions_cursor_map.VALUE 
					and record_config_id = (select distinct(record_config_id) from record_configs_rules, rules where record_configs_rules.rule_id = input_rule_id);
				select name into record_view_config_name from record_view_configs 
					where RECORD_CONFIG_ID = (select distinct(record_config_id) from record_configs_rules, rules where record_configs_rules.rule_id = input_rule_id) 
				and rownum = 1;
				expression_string := expression_string || record_view_config_name|| '.' || entity_data_field_name || ' ' ;
		 	else
				while offset <> 0
				loop
					if (prev_offset = 1) 
					then
						token := SUBSTR(formula_expressions_cursor_map.VALUE,prev_offset,offset - prev_offset) ;
					else
						token := SUBSTR(formula_expressions_cursor_map.VALUE,prev_offset + 1,offset - prev_offset - 1) ;
					end if;
					if (prev_offset = 1)
					then 
		    			select source_view_id,dest_view_id into svid,dvid from expandable_field_maps where id = to_number(token) ;
						select name into srvname from record_view_configs where id = svid ;
						select name into drvname from record_view_configs where id = dvid ;
						expression_string := expression_string || srvname || '.' || drvname ;
					else
						select dest_view_id into dvid from expandable_field_maps where id = to_number(token) ;
						select name into drvname from record_view_configs  where id = dvid ;
						expression_string := expression_string || '.'|| drvname ;
					end if ;
					prev_offset := offset ;
					offset := INSTR(formula_expressions_cursor_map.VALUE,'.', offset + 1,1) ;
				end loop;
				var_field_id := SUBSTR(formula_expressions_cursor_map.VALUE, prev_offset + 1) ;
				
				select NAME into entity_data_field_name from field_configs where field_id = var_field_id  and
				record_config_id = (select record_config_id from record_view_configs where id=dvid) ;
				expression_string := expression_string || '.' || entity_data_field_name || ' ' ;
			end if ;
		else
				if ( formula_expressions_cursor_map.VALUE = 'DIV' )
				then
					expression_string := expression_string || '/' || ' ' ;
				else
					expression_string := expression_string || formula_expressions_cursor_map.VALUE || ' ' ;
				end if ;
		end if;
	end loop ;

	close formula_expressions_cursor ;
	RETURN expression_string;

END GetStatsRuleExpressionByRuleID;

END ReportUtility ;
/

COMMIT ;
