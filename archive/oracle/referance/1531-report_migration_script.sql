DROP TABLE TEMP_NICKNAMES ;
DROP TABLE HIGHCOST_SUMMARY ;
DROP TABLE SWITCHTRUNK_SUMMARY ;

DROP TABLE INVESTIGATED_RECORD ;
DROP TABLE TEMP_HIGHRISK_DEST_SUMMARY ;

CREATE TABLE TEMP_NICKNAMES(
	NAME		VARCHAR2(32),
	VALUE		VARCHAR2(40)) ;

CREATE TABLE HIGHCOST_SUMMARY(
	NICKNAME        VARCHAR2(32),
	PHONE_NUMBER    VARCHAR2(40),
	CALLED_NUMBER   VARCHAR2(40),
	NO_OF_CALLS     NUMBER,
	DURATION        NUMBER,
	SUMMARY_DATE	DATE NOT NULL);

CREATE TABLE SWITCHTRUNK_SUMMARY(
	NICKNAME        VARCHAR2(32),
	CALLED_NUMBER   VARCHAR2(40),
	SWITCH_ID   NUMBER,
	TRUNK_ID    NUMBER,
	PORT        NUMBER,
	NO_OF_CALLS_PORT     NUMBER,
	DURATION_PORT        NUMBER,
	SUMMARY_DATE	DATE NOT NULL);


CREATE TABLE INVESTIGATED_RECORD
(
    NETWORK_ID              NUMBER(16),
    TYPE_ID                 NUMBER(8),
    WEEK                    NUMBER(8),
    GEOGRAPHIC_POSITION     VARCHAR2(32),
    COUNTRY_CODE            VARCHAR2(32),
    RECORD_COUNT            NUMBER(16)
) ;

CREATE TABLE TEMP_HIGHRISK_DEST_SUMMARY
(
    NETWORK_ID                      NUMBER(20),
    TYPE_ID                         NUMBER(20),
    WEEK                            NUMBER(20),
    GEOGRAPHIC_POSITION             VARCHAR2(40),
    COUNTRY_CODE                    VARCHAR2(40),
    TOTAL_VALUE                     NUMBER(16,6),
    TOTAL_DURATION                  NUMBER(20),
    TOTAL_FRD_CDR_COUNT             NUMBER(20),
    TOTAL_ALERT_COUNT               NUMBER(20),
    TOTAL_CALLERS                   NUMBER(20)
) ;

update configurations set value = value || ',highcostsummary.sh,switchtrunksummary.sh' where config_key = 'SUMMARY_SCRIPTS' ; 
@populatenicknamevalues_procedure.sql
@generatehighcostsummary_procedure.sql
@switchtrunksummary_procedure.sql
@mcn_summary_package.sql
