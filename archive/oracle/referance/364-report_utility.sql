--/*******************************************************************************
-- * Copyright (c) Subex Systems Limited 2005. All rights reserved.	             *
-- * The copyright to the computer program(s) herein is the property of Subex    *
-- * Systems Limited. The program(s) may be used and/or copied with the written  *
-- * permission from Subex Systems Limited or in accordance with the terms and   *
-- * conditions stipulated in the agreement/contract under which the program(s)  *
-- * have been supplied.                                                         *
-- *******************************************************************************/
set serveroutput off ;
CREATE OR REPLACE PACKAGE ReportUtility
AS

    FUNCTION GetEffeciveWeekDay(day IN number) RETURN VARCHAR2 ;
	FUNCTION GetAlarmStatus(status IN number) RETURN VARCHAR2 ;
	FUNCTION GetStatsRuleExpressionByRuleID(input_rule_id IN VARCHAR2) return varchar2 ;

END ReportUtility ;
/

CREATE OR REPLACE PACKAGE BODY ReportUtility AS

    FUNCTION GetEffeciveWeekDay(day IN number) RETURN VARCHAR2
    AS
        position NUMBER(2) := 0 ;
        description VARCHAR2(256) := '' ;
    BEGIN
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
        RETURN description ;
    END GetEffeciveWeekDay ;
	
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

FUNCTION GetStatsRuleExpressionByRuleID(input_rule_id IN VARCHAR2) return varchar2
AS
	expression_string 	VARCHAR2(10000) := '' ;
	profile_field 		VARCHAR2(256) := '';
	entity_data_field_name 	VARCHAR2(100) := '';
	record_view_config_name VARCHAR2(100) := '' ;

	cursor formula_expressions_cursor is 
		select value, VALUE_FIELD_INDICATOR from formula_expressions 
			where FORMULA_ID =  (select formula_id from rule_formula_map where to_char(rule_id) = input_rule_id );
	formula_expressions_cursor_map  formula_expressions_cursor%ROWTYPE;

BEGIN
	open formula_expressions_cursor ;
	loop
	fetch formula_expressions_cursor into formula_expressions_cursor_map ;
	exit when formula_expressions_cursor%NOTFOUND ;
		if (formula_expressions_cursor_map.VALUE_FIELD_INDICATOR = 1033)
		then
			select distinct (NAME) into profile_field from profile_fields where to_char(profile_fields.RULE_KEY) = formula_expressions_cursor_map.VALUE ;
			select name into record_view_config_name from record_view_configs 
				where 
				RECORD_CONFIG_ID = (select distinct(record_config_id) from record_configs_rules, rules where record_configs_rules.rule_id = input_rule_id) 
				and rownum = 1;
			
			expression_string := expression_string || record_view_config_name|| '.'  || profile_field || ' ' ;
		elsif (formula_expressions_cursor_map.VALUE_FIELD_INDICATOR = 1041)
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
			expression_string := expression_string || formula_expressions_cursor_map.VALUE || ' ' ;
		end if;
	end loop ;

	close formula_expressions_cursor ;
	RETURN expression_string;

END GetStatsRuleExpressionByRuleID;

END ReportUtility ;
/

COMMIT ;
