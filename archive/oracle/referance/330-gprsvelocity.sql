SET FEEDBACK 0FF
set serveroutput off ;

SPOOL gprsvelocity.log 
 
CREATE OR REPLACE TRIGGER GPRS_RULE_IN_TRIGGER
   AFTER INSERT ON EVENT_INSTANCE
   REFERENCING NEW AS newRow
    FOR EACH ROW
    WHEN (newRow.ID > 1024)
	DECLARE
		RuleSeqID	  INT ;
		UDECount	  INT ;
    BEGIN
	SELECT COUNT(*) INTO UDECount FROM USER_DEFINED_EVENT UDE WHERE UDE.ID = :newRow.USER_DEFINED_EVENT_ID ;
	IF UDECount >= 1 THEN
		SELECT RULES_SEQ.NEXTVAL INTO RuleSeqID FROM dual ;

		INSERT INTO RULES(ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION, 
							IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, PROCESSOR_TYPE) 
			(SELECT RuleSeqID, 1,
			:newRow.ID, :newRow.DESCRIPTION, :newRow.EVENT_VERSION, 2, 
			(SELECT DECODE(UDE.ID,
						  2110, 50, 
						  2111, 49,
						  2112, 51,	
						  2005, 17, 
						  2101, 17, 
						  1025, 17,
						  2105, 49,
						  2104, 50,
						  2106, 51,
						  2107, 17,
						  2108, 17,
						  2109, 17,
						  2101, 17,
						  2102, 17,
						  2103, 17,
						  2010, 6, 
						  
					   		1  ) FROM USER_DEFINED_EVENT UDE where UDE.ID =  :newRow.USER_DEFINED_EVENT_ID),
			(SELECT DECODE(UDE.ID,
						2101, 2,
						1025, 2,
						2101, 2,
						2102, 2,
						2103, 2,
						2010, 5, 
					   1) FROM USER_DEFINED_EVENT UDE where UDE.ID =  :newRow.USER_DEFINED_EVENT_ID), :newRow.IS_ENABLED, :newRow.TIME_STAMP,
			:newRow.MODIFICATION_TIME, :newRow.SEVERITY, :newRow.USER_ID, 
			(SELECT DECODE(UDE.BASE_CODE,
						   80, 2, 
						   81, 2,
						   1) FROM USER_DEFINED_EVENT UDE where UDE.ID =  :newRow.USER_DEFINED_EVENT_ID)
			FROM dual) ;

		INSERT INTO RECORD_CONFIGS_RULES(RULE_ID, RECORD_CONFIG_ID) VALUES (RuleSeqID, DECODE(:newRow.USER_DEFINED_EVENT_ID,1025,1, 7)) ;

		INSERT INTO ACTIONS_RULES(RULE_ID, ACTION_ID) VALUES (RuleSeqID, 1) ;
	END IF ;
	EXCEPTION
		WHEN no_data_found THEN NULL ;
    END GPRS_RULE_IN_TRIGGER;
/

CREATE OR REPLACE TRIGGER RULE_UPDATE_TRIGGER
    AFTER UPDATE ON EVENT_INSTANCE
    REFERENCING NEW AS newRow
    FOR EACH ROW
    BEGIN
		UPDATE RULES R SET
			R.NAME = :newRow.DESCRIPTION,
			R.VERSION = :newRow.EVENT_VERSION,
			R.IS_ENABLED = :newRow.IS_ENABLED,
			R.MODIFICATION_TIME = :newRow.MODIFICATION_TIME,
			R.SEVERITY = :newRow.SEVERITY,
			R.USER_ID = :newRow.USER_ID
		WHERE
			R.KEY = :newRow.ID  
			AND R.VERSION  = :old.EVENT_VERSION;

    END RULE_UPDATE_TRIGGER;
/

CREATE OR REPLACE TRIGGER RULE_DELETE_TRIGGER
    AFTER DELETE ON EVENT_INSTANCE
    FOR EACH ROW
	DECLARE
		v_RuleID	INT ;
		v_EventID	INT ;
    BEGIN
		SELECT ID INTO v_EventID FROM  USER_DEFINED_EVENT UDE
        			WHERE UDE.ID = :old.USER_DEFINED_EVENT_ID ;

		SELECT ID INTO v_RuleID FROM RULES 
					WHERE KEY = :old.ID AND VERSION = :old.EVENT_VERSION;
													
		DELETE FROM FILTERS_RULES WHERE RULE_ID = v_RuleID ;

		DELETE FROM FILTER_TOKENS WHERE FILTER_ID in ( select FILTER_ID FROM FILTERS_RULES WHERE  RULE_ID = v_RuleID) ; 

		DELETE FROM EXPRESSIONS WHERE ID NOT IN (select EXPRESSION_ID FROM FILTER_TOKENS) ;

		DELETE FROM FILTERS WHERE ID in ( select FILTER_ID FROM FILTERS_RULES WHERE  RULE_ID = v_RuleID ) ; 

		DELETE FROM ACTIONS_RULES WHERE RULE_ID = v_RuleID ;

		DELETE FROM THRESHOLDS WHERE RULE_KEY = :old.ID AND RULE_VERSION = :old.EVENT_VERSION;

		DELETE FROM RECORD_CONFIGS_RULES WHERE RULE_ID = v_RuleID ;
		DELETE FROM RULES WHERE ID = v_RuleID ;
	EXCEPTION
			WHEN no_data_found THEN
			NULL ;
END RULE_DELETE_TRIGGER;
/

CREATE OR REPLACE TRIGGER GPRS_VEL_RULE_IN_TRIGGER
   AFTER INSERT ON EVENT_INSTANCE
   REFERENCING NEW AS newRow
    FOR EACH ROW
    WHEN (newRow.NETWORK_ID = 1025 AND (newRow.ID = 201 OR newRow.ID = 202 OR newRow.ID = 203 OR newRow.ID = 16) )
    DECLARE
        RuleSeqID     INT ;
        UDECount      INT ;
    BEGIN
    SELECT COUNT(*) INTO UDECount FROM USER_DEFINED_EVENT UDE WHERE UDE.ID = :newRow.USER_DEFINED_EVENT_ID ;
    IF UDECount >= 1 THEN
        SELECT RULES_SEQ.NEXTVAL INTO RuleSeqID FROM dual ;

    INSERT INTO RULES(ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION, IS_ENABLED,
        CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, PROCESSOR_TYPE)
        (SELECT RuleSeqID, 1,
        :newRow.ID, :newRow.DESCRIPTION, :newRow.EVENT_VERSION, 2, DECODE(:newRow.ID,201,6,202,6,16, 6, 45) ,DECODE(:newRow.ID, 201,5,202,10,16,5,4) , :newRow.IS_ENABLED, :newRow.TIME_STAMP,
        :newRow.MODIFICATION_TIME, :newRow.SEVERITY, :newRow.USER_ID,1
        FROM dual
            WHERE EXISTS
                (SELECT ID FROM  USER_DEFINED_EVENT UDE
                    WHERE UDE.ID = :newRow.USER_DEFINED_EVENT_ID)) ;

    UPDATE RULES SET IS_ENABLED = 0 WHERE KEY = :newRow.ID AND VERSION <> :newRow.EVENT_VERSION ;

    INSERT INTO THRESHOLDS(ID, THRESHOLD_ID, AGGREGATION_TYPE, RULE_KEY, RULE_VERSION,
        VALUE, VERSION, DURATION, EFFECTIVE_TIME, EFFECTIVE_DAY,
        EFFECTIVE_WEEK_DAY, CHANGED_STATUS) VALUES
    (THRESHOLDS_SEQ.NEXTVAL, :newRow.ID, 2, :newRow.ID, :newRow.EVENT_VERSION,
        0, :newRow.EVENT_VERSION,864000 , 1, 1, 1, 0) ;

    INSERT INTO RECORD_CONFIGS_RULES(RULE_ID, RECORD_CONFIG_ID)
                    (SELECT RuleSeqID, DECODE(:newRow.ID,16,1,7) from dual
                             WHERE EXISTS
                            (SELECT ID FROM  USER_DEFINED_EVENT UDE
                                WHERE UDE.ID = :newRow.USER_DEFINED_EVENT_ID)) ;

        INSERT INTO ACTIONS_RULES(RULE_ID, ACTION_ID) VALUES (RuleSeqID, 1) ;
    END IF ;
    EXCEPTION
        WHEN no_data_found THEN NULL ;
    END GPRS_VEL_RULE_IN_TRIGGER;
/
CREATE OR REPLACE TRIGGER GPRS_VEL_FIL_IN_TRIGGER
    AFTER INSERT ON FILTER
    REFERENCING NEW AS newRow
    FOR EACH ROW
    --WHEN ((newRow.EVENT_INSTANCE_ID = 201 OR newRow.EVENT_INSTANCE_ID = 202 OR newRow.EVENT_INSTANCE_ID = 203)  AND newRow.NETWORK_ID = 1025)
    WHEN ((newRow.EVENT_INSTANCE_ID = 202 OR newRow.EVENT_INSTANCE_ID = 203)  AND newRow.NETWORK_ID = 1025)
    DECLARE
        v_FilterID              INT ;
        v_ExpID                 INT ;
        v_CountFilter           INT ;
        v_DataType              INT ;
        v_RightField            VARCHAR(255) ;
        v_RightFieldIndicator   INT ;
        v_RuleID                INT ;
        v_ComparisionType       INT ;
    BEGIN
        SELECT ID INTO v_RuleID FROM RULES
                    WHERE KEY = :newRow.EVENT_INSTANCE_ID AND VERSION = :newRow.EVENT_VERSION;
        v_FilterID := 0 ;

        SELECT COUNT(*) INTO v_CountFilter
                FROM FILTERS WHERE NAME = :newRow.EVENT_INSTANCE_ID || '-' || :newRow.EVENT_VERSION
                ||'-' || :newRow.IS_EXCEPTION ;
        IF v_CountFilter = 0 THEN
            SELECT FILTERS_SEQ.NEXTVAL into v_FilterID from dual ;
            INSERT INTO FILTERS(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID)
            VALUES (v_FilterID, :newRow.EVENT_INSTANCE_ID || '-' || :newRow.EVENT_VERSION
                    || '-' || :newRow.IS_EXCEPTION, DECODE(:newRow.EVENT_INSTANCE_ID,3,1,7), :newRow.IS_EXCEPTION, :newRow.NETWORK_ID) ;

            INSERT INTO FILTERS_RULES(FILTER_ID, RULE_ID) (SELECT v_FilterID, v_RuleID FROM DUAL) ;
        END IF ;

        IF v_FilterID = 0 THEN
            SELECT FILTER_ID INTO v_FilterID FROM FILTERS_RULES F WHERE RULE_ID = v_RuleID
                    AND FILTER_ID
                        IN (select ID from filters where F.filter_id = ID and is_exception = :newRow.is_exception);
        END IF ;

        SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;

        INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES (v_ExpID,
            :newRow.FILTER_FIELD, 1, 1024, 6) ;

        INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID) (SELECT FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID ,
                        v_ExpID FROM DUAL) ;

		SELECT DATA_TYPE INTO v_DataType FROM DS_FIELD_CONFIG
            WHERE DS_FIELD_CONFIG.POSITION = :newRow.FILTER_FIELD
            AND DS_TYPE = (SELECT DECODE(:newRow.EVENT_INSTANCE_ID,3,1,8) FROM DUAL) ;

        IF :newRow.COMPARISION_TYPE = 8 OR :newRow.COMPARISION_TYPE = 9 THEN
            select to_char(id), list_type into v_RightField, v_RightFieldIndicator from list_configs
                where list_configs.name = :newRow.STRING_VALUE ;
        ELSIF :newRow.DATE_TIME_VALUE IS NOT NULL AND v_DataType = 4 THEN
            v_RightField := TO_CHAR(:newRow.DATE_TIME_VALUE, 'yyyy/mm/dd hh24:mi:ss') ;
            v_RightFieldIndicator := 1024 ;
        ELSIF :newRow.STRING_VALUE IS NOT NULL THEN
            v_RightField := :newRow.STRING_VALUE ;
            v_RightFieldIndicator := 1024 ;
        ELSIF :newRow.INTEGER_VALUE >= 0  AND v_DataType = 1 THEN
                v_RightField := TO_CHAR(:newRow.INTEGER_VALUE) ;
            IF :newRow.FILTER_FIELD = 18 OR :newRow.FILTER_FIELD = 20 THEN
                v_RightFieldIndicator := 1024 ;
            end if ;
        ELSIF :newRow.DOUBLE_VALUE >= 0.00 THEN
            v_RightField := TO_CHAR(:newRow.DOUBLE_VALUE) ;
            v_RightFieldIndicator := 1024 ;
        END IF;

		v_ComparisionType := :newRow.COMPARISION_TYPE ;
        IF :newRow.IS_EXCEPTION = 1 THEN
            CASE v_ComparisionType
                WHEN 0 THEN
                    v_ComparisionType := 1 ;
                WHEN 1 THEN
                    v_ComparisionType := 0 ;
                WHEN 2 THEN
                    v_ComparisionType := 5 ;
                WHEN 5 THEN
                    v_ComparisionType := 2 ;
                WHEN 3 THEN
                    v_ComparisionType := 4 ;
                WHEN 4 THEN
                    v_ComparisionType := 3 ;
                WHEN 6 THEN
                    v_ComparisionType := 7 ;
                WHEN 7 THEN
                    v_ComparisionType := 6 ;
                WHEN 8 THEN
                    v_ComparisionType := 9 ;
                WHEN 9 THEN
                    v_ComparisionType := 8 ;
            END CASE ;
        END IF ;

        SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;

        INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES (v_ExpID,
            :newRow.FILTER_FIELD, v_RightField, v_RightFieldIndicator, v_ComparisionType) ;

        INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID) (SELECT FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID ,
                        v_ExpID FROM DUAL) ;

    EXCEPTION
        when no_data_found then
            NULL ;
    END GPRS_VEL_FIL_IN_TRIGGER;
/

CREATE OR REPLACE TRIGGER FILTER_INSERT_TRIGGER
    AFTER INSERT ON FILTER
    REFERENCING NEW AS newRow
    FOR EACH ROW
    WHEN (newRow.EVENT_INSTANCE_ID > 1025)
	DECLARE
		v_FilterID 				INT ;
		v_ExpID 				INT ;
		v_CountFilter 			INT ;
		v_DataType 				INT ;
		v_RightField    		VARCHAR(255) ;
		v_RightFieldIndicator   INT ;
		v_RuleID				INT ;
		v_ComparisionType		INT ;
    BEGIN
		SELECT ID INTO v_RuleID FROM RULES 
					WHERE KEY = :newRow.EVENT_INSTANCE_ID AND VERSION = :newRow.EVENT_VERSION;
		v_FilterID := 0 ; 											

		SELECT COUNT(*) INTO v_CountFilter 
				FROM FILTERS WHERE NAME = :newRow.EVENT_INSTANCE_ID || '-' || :newRow.EVENT_VERSION 
				||'-' || :newRow.IS_EXCEPTION ;
		IF v_CountFilter = 0 THEN
			SELECT FILTERS_SEQ.NEXTVAL into v_FilterID from dual ; 
			INSERT INTO FILTERS(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID) 
			VALUES (v_FilterID, :newRow.EVENT_INSTANCE_ID || '-' || :newRow.EVENT_VERSION 
					|| '-' || :newRow.IS_EXCEPTION, 7,
--					DECODE((SELECT USER_DEFINED_EVENT_ID FROM EVENT_INSTANCE WHERE ID = :newRow.EVENT_INSTANCE_ID), 1025, 1 ,7),
			:newRow.IS_EXCEPTION, :newRow.NETWORK_ID) ;

			INSERT INTO FILTERS_RULES(FILTER_ID, RULE_ID) (SELECT v_FilterID, v_RuleID FROM DUAL) ;

				IF :newRow.NETWORK_ID != 0
				THEN
					SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;
				
					INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES (v_ExpID,
						2, :newRow.NETWORK_ID, 1024, 6) ;

					INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID) (SELECT FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID , 
								v_ExpID FROM DUAL) ;
				END IF ;
		END IF ;

		IF v_FilterID = 0 THEN
			SELECT FILTER_ID INTO v_FilterID FROM FILTERS_RULES F WHERE RULE_ID = v_RuleID
					AND FILTER_ID 
						IN (select ID from filters where F.filter_id = ID and is_exception = :newRow.is_exception);
		END IF ;
		
		SELECT DATA_TYPE INTO v_DataType FROM DS_FIELD_CONFIG
			WHERE DS_FIELD_CONFIG.POSITION = :newRow.FILTER_FIELD
			AND DS_TYPE = 8 ;
		
		IF :newRow.COMPARISION_TYPE = 8 OR :newRow.COMPARISION_TYPE = 9 THEN
			IF :newRow.FILTER_FIELD = 3 OR :newRow.FILTER_FIELD = 4 OR :newRow.FILTER_FIELD = 5 OR :newRow.FILTER_FIELD = 22 THEN
			BEGIN
				select to_char(id) into v_RightField from list_configs
					where list_configs.name = :newRow.STRING_VALUE ;
				v_RightFieldIndicator := 1030 ;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					v_RightField := :newRow.STRING_VALUE ;
					v_RightFieldIndicator := 1024 ;
			END ;
			ELSE
				v_RightFieldIndicator := 1024 ;
				CASE v_DataType
					WHEN 1 THEN
			            v_RightField := TO_CHAR(:newRow.INTEGER_VALUE) ; 
					WHEN 2 THEN  
	    		        v_RightField := TO_CHAR(:newRow.DOUBLE_VALUE) ; 
					WHEN 3 THEN  
			            v_RightField := :newRow.STRING_VALUE ;
					WHEN 4 THEN  
	    		        v_RightField := TO_CHAR(:newRow.DATE_TIME_VALUE, 'yyyy/mm/dd hh24:mi:ss') ;
				END CASE ;
			END IF ;
		ELSIF :newRow.DATE_TIME_VALUE IS NOT NULL AND v_DataType = 4 THEN
            v_RightField := TO_CHAR(:newRow.DATE_TIME_VALUE, 'yyyy/mm/dd hh24:mi:ss') ;
			v_RightFieldIndicator := 1024 ;
		ELSIF :newRow.STRING_VALUE IS NOT NULL THEN
            v_RightField := :newRow.STRING_VALUE ;
			v_RightFieldIndicator := 1024 ;
        ELSIF :newRow.INTEGER_VALUE >= 0  AND v_DataType = 1 THEN
	            v_RightField := TO_CHAR(:newRow.INTEGER_VALUE) ;
			IF :newRow.FILTER_FIELD = 18 OR :newRow.FILTER_FIELD = 20 THEN
				v_RightFieldIndicator := 1024 ;
			end if ;
        ELSIF :newRow.DOUBLE_VALUE >= 0.00 THEN
            v_RightField := TO_CHAR(:newRow.DOUBLE_VALUE) ;
			v_RightFieldIndicator := 1024 ;
        END IF;

		v_ComparisionType := :newRow.COMPARISION_TYPE ;
		IF :newRow.IS_EXCEPTION = 1 THEN
			CASE v_ComparisionType
				WHEN 0 THEN
					v_ComparisionType := 1 ;
				WHEN 1 THEN
					v_ComparisionType := 0 ;
				WHEN 2 THEN
					v_ComparisionType := 5 ;
				WHEN 5 THEN
					v_ComparisionType := 2 ;
				WHEN 3 THEN
					v_ComparisionType := 4 ;
				WHEN 4 THEN
					v_ComparisionType := 3 ;
				WHEN 6 THEN
					v_ComparisionType := 7 ;
				WHEN 7 THEN
					v_ComparisionType := 6 ;
				WHEN 8 THEN
					v_ComparisionType := 9 ;
				WHEN 9 THEN
					v_ComparisionType := 8 ;
			END CASE ;
		END IF ;
			

		SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;
		
        INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES (v_ExpID,
            :newRow.FILTER_FIELD, v_RightField, v_RightFieldIndicator, v_ComparisionType) ;

		INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID) (SELECT FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID , 
						v_ExpID FROM DUAL) ;

	EXCEPTION
		when no_data_found then
			NULL ;
	END FILTER_INSERT_TRIGGER;
/

CREATE OR REPLACE TRIGGER FILTER_DELETE_TRIGGER
	AFTER DELETE ON FILTER
    FOR EACH ROW
	DECLARE
		v_RuleID	INT ;
		v_EventID	INT ;
    BEGIN
		SELECT ID into v_RuleID FROM RULES WHERE KEY = :old.EVENT_INSTANCE_ID AND VERSION = :old.EVENT_VERSION ;
		DELETE FROM FILTER_TOKENS WHERE FILTER_ID in ( select FILTER_ID FROM FILTERS_RULES WHERE  RULE_ID = v_RuleID ) ; 

		DELETE FROM EXPRESSIONS WHERE ID NOT IN (select EXPRESSION_ID FROM FILTER_TOKENS) ;

		DELETE FROM FILTERS WHERE ID in ( select FILTER_ID FROM FILTERS_RULES WHERE  RULE_ID = v_RuleID ) ;
	EXCEPTION
			WHEN no_data_found THEN
			NULL ;
	END FILTER_DELETE_TRIGGER;
/

CREATE OR REPLACE TRIGGER THRESHOLD_INSERT_TRIGGER
    AFTER INSERT ON THRESHOLD
    REFERENCING NEW AS newRow
    FOR EACH ROW
    WHEN (newRow.event_instance_id > 1024)
	DECLARE
	v_EventID	INT ;
    BEGIN
		select id into v_EventID from event_instance E
				WHERE E.ID = :newRow.EVENT_INSTANCE_ID
				AND	E.EVENT_VERSION = :newRow.EVENT_VERSION
		        AND EXISTS
	                (SELECT ID FROM  USER_DEFINED_EVENT UDE
				                    WHERE UDE.ID = E.USER_DEFINED_EVENT_ID) ;
													
        INSERT INTO THRESHOLDS(ID, THRESHOLD_ID, AGGREGATION_TYPE, AGGREGATION_VALUE, RULE_KEY, RULE_VERSION,
            VALUE, VERSION, START_DATE, END_DATE, START_TIME, END_TIME, DURATION, EFFECTIVE_TIME, EFFECTIVE_DAY,
            EFFECTIVE_WEEK_DAY, CHANGED_STATUS)
        (SELECT THRESHOLDS_SEQ.NEXTVAL, :newRow.THRESHOLD_ID, 2,
            DECODE(:newRow.PHONE_NUMBER, '0', NULL, :newRow.PHONE_NUMBER), :newRow.EVENT_INSTANCE_ID, :newRow.EVENT_VERSION,
            :newRow.VALUE, :newRow.THRESHOLD_VERSION, :newRow.START_DATE, :newRow.END_DATE, :newRow.START_TIME,
            :newRow.END_TIME, :newRow.DURATION, :newRow.EFFECTIVE_TIME, :newRow.EFFECTIVE_DAY,
            :newRow.EFFECTIVE_WEEK_DAY, :newRow.CHANGED_STATUS FROM dual) ;
	EXCEPTION
		WHEN no_data_found THEN
			NULL ;
    END THRESHOLD_INSERT_TRIGGER;
/

CREATE OR REPLACE TRIGGER THRESHOLD_UPDATE_TRIGGER
    AFTER UPDATE ON THRESHOLD
    REFERENCING NEW AS newRow
    FOR EACH ROW
    WHEN (newRow.event_instance_id > 1024)
    BEGIN
        update THRESHOLDS t
            set t.AGGREGATION_VALUE = DECODE(:newRow.PHONE_NUMBER, '0', NULL, :newRow.PHONE_NUMBER),
                t.VALUE = :newRow.VALUE,
                t.VERSION = :newRow.threshold_version,
                t.start_date = :newRow.START_DATE,
                t.end_date = :newRow.END_DATE,
                t.start_time = :newRow.START_TIME,
                t.end_time = :newRow.END_TIME,
                t.duration = :newRow.DURATION,
                t.effective_time = :newRow.EFFECTIVE_TIME,
                t.effective_day = :newRow.EFFECTIVE_DAY,
                t.effective_week_day = :newRow.EFFECTIVE_WEEK_DAY,
                t.is_active = :newRow.IS_ACTIVE,
                t.changed_status = :newRow.CHANGED_STATUS
            where
                t.threshold_id = :newRow.threshold_id
            and t.rule_key = :newRow.event_instance_id  ;
    END THRESHOLD_UPDATE_TRIGGER;
/

CREATE OR REPLACE TRIGGER GPRS_INV_SUBS_RULE_IN_TRI
   AFTER INSERT ON EVENT_INSTANCE
   REFERENCING NEW AS newRow
    FOR EACH ROW
	WHEN (newRow.NETWORK_ID = 1025 AND newRow.ID = 211)
	DECLARE
		RuleSeqID	  INT ;
		UDECount	  INT ;
		v_FilterID    INT ;
		v_ExpID       INT ;
    BEGIN
		SELECT RULES_SEQ.NEXTVAL INTO RuleSeqID FROM dual ;
				
		INSERT INTO RULES(ID, PARENT_ID, KEY, NAME, VERSION, AGGREGATION_TYPE, ACCUMULATION_FIELD, ACCUMULATION_FUNCTION,
							IS_ENABLED, CREATED_TIME, MODIFICATION_TIME, SEVERITY, USER_ID, PROCESSOR_TYPE) VALUES
						(RuleSeqID, 1, :newRow.ID, :newRow.DESCRIPTION, :newRow.EVENT_VERSION, 2, 17, 1,
					 		:newRow.IS_ENABLED, :newRow.TIME_STAMP, :newRow.MODIFICATION_TIME, :newRow.SEVERITY, 
							:newRow.USER_ID,1) ;

		UPDATE RULES SET IS_ENABLED = 0 WHERE KEY = :newRow.ID AND VERSION <> :newRow.EVENT_VERSION ;

		INSERT INTO RECORD_CONFIGS_RULES(RULE_ID, RECORD_CONFIG_ID) VALUES (RuleSeqID, 7) ;

		INSERT INTO ACTIONS_RULES(RULE_ID, ACTION_ID) VALUES (RuleSeqID, 1) ;

		SELECT FILTERS_SEQ.NEXTVAL into v_FilterID from dual ; 
		SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;

		INSERT INTO FILTERS(ID, NAME, RECORD_CONFIG_ID, IS_EXCEPTION, NETWORK_ID) VALUES(v_FilterID, 'Invalid Subscriber', 7, 0, 0) ;
		INSERT INTO FILTERS_RULES(FILTER_ID, RULE_ID) VALUES(v_FilterID, RuleSeqID) ;
		INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES(v_ExpID, '15', '7', 1024, 6);
		INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID, CONTAINED_FILTER_ID) VALUES(FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID, v_ExpID, null) ;

		SELECT EXPRESSIONS_SEQ.NEXTVAL INTO v_ExpID FROM DUAL ;
		
		INSERT INTO EXPRESSIONS(ID, LEFT_FIELD, RIGHT_FIELD, RIGHT_FIELD_INDICATOR, OPERATOR_ID) VALUES (v_ExpID,
			2, :newRow.NETWORK_ID, 1024, 6) ;

		INSERT INTO FILTER_TOKENS(ID, FILTER_ID, EXPRESSION_ID) (SELECT FILTER_TOKENS_SEQ.NEXTVAL, v_FilterID , 
					v_ExpID FROM DUAL) ;

	EXCEPTION
		WHEN no_data_found THEN NULL ;
    END GPRs_INV_SUBS_RULE_IN_TRI;
/

CREATE OR REPLACE TRIGGER GPRS_INV_SUBS_THR_IN_TRI
   AFTER INSERT ON INVALID_SUBSCRIBER_CONFIG
   REFERENCING NEW AS newRow
    FOR EACH ROW
	WHEN (newRow.NETWORK_ID = 1025 AND newRow.EVENT_INSTANCE_ID = 200)
    BEGIN
        INSERT INTO THRESHOLDS(ID, THRESHOLD_ID, AGGREGATION_TYPE, AGGREGATION_VALUE, RULE_KEY, RULE_VERSION,
            VALUE, VERSION, START_DATE, END_DATE, START_TIME, END_TIME, DURATION, EFFECTIVE_TIME, EFFECTIVE_DAY,
            EFFECTIVE_WEEK_DAY, IS_ACTIVE, CHANGED_STATUS) 
		VALUES (THRESHOLDS_SEQ.NEXTVAL, 0, 2, NULL, 1, :newRow.EVENT_VERSION, :newRow.THRESHOLD, 0, '','', '', '', 7776000, 1, 1, 0, 1, 0) ;

	EXCEPTION
		WHEN no_data_found THEN NULL ;
    END GPRS_INV_SUBS_THR_IN_TRI;
/

CREATE OR REPLACE TRIGGER UPDATE_LAST_GPRS_CONFIG_TRI
    AFTER INSERT ON GPRS_CDR
    REFERENCING NEW AS newRow
    FOR EACH ROW
	DECLARE
		v_Value 				VARCHAR2(1024) ;

    BEGIN
		v_Value := to_char(:newRow.TIME_STAMP,'DD/MM/YYYY HH24:MI:SS') || ',' ;
		v_Value := v_Value || lpad(:newRow.PHONE_NUMBER,20,' ') || ',1,' || to_char(sysdate,'DD/MM/YYYY HH24:MI:SS') ;
		
		UPDATE CONFIGURATION SET VALUE = v_Value WHERE ID LIKE 'LAST_GPRS_CDR_TIME%' ;   

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			NULL ;
	END ; 
/

CREATE OR REPLACE TRIGGER CUST_NICK_PH_INS_TRIG
AFTER INSERT ON CUSTOM_NICKNAME_PHONE_NUMBERS
	FOR EACH ROW
	DECLARE
		v_ListConfigId 		INT ;
	BEGIN
		BEGIN
			SELECT ID INTO v_ListConfigId FROM LIST_CONFIGS WHERE NAME = :new.NICKNAME AND LIST_TYPE = 0 ;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			SELECT LIST_CONFIGS_SEQ.NEXTVAL INTO v_ListConfigId FROM DUAL ;
			INSERT INTO LIST_CONFIGS(ID, NAME, LIST_TYPE, DATA_TYPE) VALUES (v_ListConfigId, :new.NICKNAME, 0, 3) ;
		END;
		INSERT INTO LIST_DETAILS(ID, LIST_ID, VALUE, VALUE_TYPE) VALUES (LIST_DETAILS_SEQ.NEXTVAL, v_ListConfigId, :new.PHONE_NUMBER, 0) ; 
	END CUST_NICK_INS_TRIG ;
/

CREATE OR REPLACE TRIGGER CUST_NICK_PH_DEL_TRIG 
AFTER DELETE ON CUSTOM_NICKNAME_PHONE_NUMBERS
FOR EACH ROW
BEGIN
	DELETE FROM LIST_DETAILS WHERE VALUE = :old.PHONE_NUMBER 
								AND LIST_ID IN (SELECT ID FROM LIST_CONFIGS WHERE NAME = :old.NICKNAME
													 								AND LIST_TYPE = 0) ;
END;
/

CREATE OR REPLACE TRIGGER CUST_NICK_DEL_TRIG 
AFTER DELETE ON CUSTOM_NICKNAME
FOR EACH ROW
DECLARE
	v_ListConfigId INT ;
BEGIN
	SELECT ID INTO v_ListConfigId FROM LIST_CONFIGS WHERE NAME = :old.NICKNAME AND LIST_TYPE = 0 ;
	DELETE FROM LIST_DETAILS WHERE LIST_ID = v_ListConfigID ;
	DELETE FROM  LIST_CONFIGS WHERE ID = v_ListConfigID ;
EXCEPTION
	WHEN NO_DATA_FOUND THEN NULL ;
END;
/

CREATE OR REPLACE TRIGGER STD_NICK_PH_INS_TRIG
AFTER INSERT ON NICKNAME_PHONE_NUMBER
	FOR EACH ROW
	DECLARE
		v_ListConfigId 		INT ;
		v_Value				VARCHAR2(1024) ;
		v_ValueType			INT ;
	BEGIN
		BEGIN
			SELECT ID INTO v_ListConfigId FROM LIST_CONFIGS 
											WHERE NAME = (SELECT NAME FROM NICKNAME WHERE ID = :new.NICKNAME_ID) 
											AND LIST_TYPE = 1 ;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			SELECT LIST_CONFIGS_SEQ.NEXTVAL INTO v_ListConfigId FROM DUAL ;
			INSERT INTO LIST_CONFIGS(ID, NAME, LIST_TYPE, DATA_TYPE) VALUES 
									(v_ListConfigId, (SELECT NAME FROM NICKNAME WHERE ID = :new.NICKNAME_ID), 1, 3) ;
		END;

		v_Value := :new.PHONE_NUMBER ;
		SELECT DECODE((SUBSTR(:new.PHONE_NUMBER, 0, 1)), '+', 0 ,1) INTO v_ValueType FROM DUAL ;
		
		IF v_ValueType = 1 THEN
			SELECT TO_CHAR(ID) INTO v_Value FROM LIST_CONFIGS WHERE NAME = v_Value ;
		ELSE
			v_Value := REPLACE(v_Value,'%','.*') ;
			v_Value := REPLACE(v_Value, '_','.') ;
		END IF ;
		
		INSERT INTO LIST_DETAILS(ID, LIST_ID, VALUE, VALUE_TYPE) VALUES (LIST_DETAILS_SEQ.nextval, v_ListConfigID,
							v_Value, v_ValueType) ;
	END STD_NICK_INS_TRIG ;
/

CREATE OR REPLACE TRIGGER STD_NICK_PH_DEL_TRIG 
AFTER DELETE ON NICKNAME_PHONE_NUMBER
FOR EACH ROW
BEGIN
	DELETE FROM LIST_DETAILS WHERE VALUE = :old.PHONE_NUMBER 
								AND LIST_ID IN (SELECT ID FROM LIST_CONFIGS WHERE NAME = (SELECT NAME FROM NICKNAME
																								WHERE ID = :old.NICKNAME_ID)
													 								AND LIST_TYPE = 1) ;
END;
/

CREATE OR REPLACE TRIGGER STD_NICK_DEL_TRIG 
AFTER DELETE ON NICKNAME
FOR EACH ROW
DECLARE
	v_ListConfigID 	INT ;
BEGIN
	SELECT ID INTO v_ListConfigID FROM LIST_CONFIGS WHERE NAME = :old.NAME AND LIST_TYPE = 1 ;
	DELETE FROM LIST_DETAILS WHERE LIST_ID = v_ListConfigID ;
	DELETE FROM  LIST_CONFIGS WHERE ID = v_ListConfigID ;
EXCEPTION
	WHEN NO_DATA_FOUND THEN NULL ;
END;
/
COMMIT ;

