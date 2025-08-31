-- ********************************************************************************
-- *  Copyright(c) Subex Systems Limited 2014. All Rights Reserved.               *
-- *  The copyright to the Computer Program(s) herein is the property of Subex    *
-- *  systems limited. the program(s) may be used and/or copied with the written  *
-- *  permission from subex systems limited or in accordance with the terms and   *
-- *  conditions stipulated in the agreement/contract under which the program(s)  *
-- *  have been supplied.                                                         *
-- ********************************************************************************

SPOOL ranger-new-db.alarm_view.log 
SET FEEDBACK OFF;
set SERVEROUTPUT OFF;

CREATE OR REPLACE  VIEW ALARM_VIEWS  AS(
	SELECT A.NETWORK_ID, 
		A.ID, 
		A.REFERENCE_ID, 
		A.CASE_ID, 
		A.ALERT_COUNT, 
		A.CREATED_DATE, 
		A.MODIFIED_DATE, 
		A.STATUS, 
		A.USER_ID as USER_ID, 
		A.OWNER_TYPE as OWNER_TYPE,
		A.SCORE, 
		A.VALUE, 
		A.CDR_COUNT, 
		DECODE(A.PENDING_TIME, 
			to_date('01-01-1970', 'dd-mm-yyyy'), 
			to_date('','dd-mm-yyyy'), 
			A.PENDING_TIME
		) AS PENDING_TIME, 
		A.REFERENCE_TYPE, 
		A.REFERENCE_VALUE, 
		A.IS_VISIBLE, 
		S.ACCOUNT_NAME as ACCOUNT_NAME, 
		LTRIM(	AC.FIRST_NAME 
			|| 
			DECODE(	AC.MIDDLE_NAME, 
				NULL, 
				'', 
				' '||AC.MIDDLE_NAME 
			) 
			|| 
			DECODE( AC.LAST_NAME, 
				NULL, 
				'', 
				' '||AC.LAST_NAME 
			) 
		) as SUBSCRIBER_NAME, 
		S.GROUPS, 
		0.0 as OUTSTANDING_AMOUNT, 
		A.DISPLAY_VALUE, 
		A.RULE_IDS, 
		S.ACCOUNT_ID AS PARENT_ID, 
		decode( A.REFERENCE_ID, 
			4, 
			4, 
			2, 
			2, 
			0, 
			0, 
			AC.HIERARCHY_ID 
		) AS HIERARCHY_ID, 
		A.FRAUD_TYPES AS FRAUD_TYPES, 
		A.RULE_TAGS AS RULE_TAGS, 
		ASSIGNED_DATE, 
		ROUND(	DECODE( A.ASSIGNED_DATE, 
				NULL, 
				0, 
				(
					CASE WHEN A.STATUS IN (2,4,8) THEN 
						(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400 
					ELSE 
						(SYSDATE - A.ASSIGNED_DATE) * 86400 
					END 
				) 
			) 
		) AS ANALYSIS_DURATION, 
		A.WF_ASSIGNED_DATE, 
		A.WF_MODIFIED_DATE 
	FROM 	ALARMS A, 
		SUBSCRIBER S, 
		ACCOUNT AC 
	WHERE A.REFERENCE_ID = S.ID 
		AND s.subscriber_type in (0,1) 
		AND S.ACCOUNT_ID = AC.ID 
		AND AC.ACCOUNT_TYPE in (0,1) 
		AND ( A.REFERENCE_ID > 1024 
			OR 
			A.REFERENCE_ID in (2,4) 
		) 
		AND A.IS_VISIBLE = 1 
		AND A.STATUS NOT IN (7) 
		AND A.REFERENCE_TYPE = 1 
UNION ALL
	SELECT 	A.NETWORK_ID, 
		A.ID, 
		A.REFERENCE_ID, 
		A.CASE_ID, 
		A.ALERT_COUNT, 
		A.CREATED_DATE, 
		A.MODIFIED_DATE, 
		A.STATUS, 
		A.USER_ID as USER_ID, 
		A.OWNER_TYPE as OWNER_TYPE, 
		A.SCORE, 
		A.VALUE, 
		A.CDR_COUNT, 
		decode(	A.PENDING_TIME, 
			to_date('01-01-1970', 'dd-mm-yyyy'), 
			to_date('','dd-mm-yyyy'), 
			A.PENDING_TIME 
		) AS PENDING_TIME, 
		A.REFERENCE_TYPE, 
		A.REFERENCE_VALUE, 
		A.IS_VISIBLE, 
		AC.ACCOUNT_NAME as ACCOUNT_NAME, 
		LTRIM( AC.FIRST_NAME 
			|| 
			DECODE( AC.MIDDLE_NAME, 
				NULL, 
				'', 
				' '||AC.MIDDLE_NAME 
			) 
			|| 
			DECODE(	AC.LAST_NAME, 
				NULL, 
				'', 
				' '||AC.LAST_NAME 
			) 
		) SUBSCRIBER_NAME, 
		'', 
		0.0 as OUTSTANDING_AMOUNT, 
		A.DISPLAY_VALUE, 
		A.RULE_IDS, 
		AC.PARENT_ID AS PARENT_ID, 
		AC.HIERARCHY_ID AS HIERARCHY_ID, 
		A.FRAUD_TYPES AS FRAUD_TYPES, 
		A.RULE_TAGS AS RULE_TAGS, 
		ASSIGNED_DATE, 
		ROUND(	DECODE(	A.ASSIGNED_DATE, 
				NULL, 
				0, 
				( 
					CASE WHEN A.STATUS IN (2,4,8) THEN 
						(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400 
					ELSE 
						(SYSDATE - A.ASSIGNED_DATE) * 86400 
					END 
				) 
			) 
		) AS ANALYSIS_DURATION, 
		A.WF_ASSIGNED_DATE, 
		A.WF_MODIFIED_DATE 
	FROM 	ALARMS A, 
		ACCOUNT AC 
	WHERE 	A.REFERENCE_ID = AC.ID 
		AND AC.ACCOUNT_TYPE in (0,1) 
		AND (	A.REFERENCE_ID > 1024 
			OR 
			A.REFERENCE_ID in (2,4) 
		) 
		AND A.IS_VISIBLE = 1 
		AND A.STATUS NOT IN (7) 
		AND A.REFERENCE_TYPE = 3 
UNION ALL 
	SELECT	A.NETWORK_ID, 
		A.ID, 
		A.REFERENCE_ID, 
		A.CASE_ID, 
		A.ALERT_COUNT, 
		A.CREATED_DATE, 
		A.MODIFIED_DATE, 
		A.STATUS, 
		A.USER_ID as USER_ID, 
		A.OWNER_TYPE as OWNER_TYPE, 
		A.SCORE, 
		A.VALUE, 
		A.CDR_COUNT, 
		decode(	A.PENDING_TIME, 
			to_date('01-01-1970', 'dd-mm-yyyy'), 
			to_date('','dd-mm-yyyy'), 
			A.PENDING_TIME 
		) AS PENDING_TIME, 
		A.REFERENCE_TYPE,  
		A.REFERENCE_VALUE, 
		A.IS_VISIBLE, 
		'Not Applicable', 
		'Not Applicable', 
		'Not Applicable', 
		0.0, 
		A.DISPLAY_VALUE, 
		A.RULE_IDS, 
		0 AS PARENT_ID, 
		4 AS HIERARCHY_ID, 
		A.FRAUD_TYPES AS FRAUD_TYPES, 
		A.RULE_TAGS AS RULE_TAGS, 
		ASSIGNED_DATE,
		ROUND(	DECODE(	A.ASSIGNED_DATE, 
				NULL, 
				0, 
				(
					CASE WHEN A.STATUS IN (2,4,8) THEN 
						(A.MODIFIED_DATE - A.ASSIGNED_DATE) * 86400 
				        ELSE 
					        (SYSDATE - A.ASSIGNED_DATE) * 86400 
				        END 
				) 
			) 
		) AS ANALYSIS_DURATION, 
		A.WF_ASSIGNED_DATE, 
		A.WF_MODIFIED_DATE 
	FROM	ALARMS A 
	WHERE ( A.REFERENCE_TYPE NOT IN (1,3) OR A.REFERENCE_ID = 0 ) 
		AND A.IS_VISIBLE = 1 
		AND A.STATUS NOT IN (7) 
);

COMMIT;
