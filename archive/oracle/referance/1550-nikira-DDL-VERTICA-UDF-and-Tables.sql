
CREATE SCHEMA IF NOT EXISTS Utility;

CREATE OR REPLACE FUNCTION Utility.GetDateStringByCalendar(sqldate DATE, format VARCHAR2, calendar VARCHAR2) RETURN VARCHAR2
AS BEGIN
    return to_char(sqldate, format);
END ;

CREATE OR REPLACE FUNCTION Utility.GetDateStringByCalendar(sqldate TIMESTAMP, format VARCHAR2, calendar VARCHAR2) RETURN VARCHAR2
AS BEGIN
    return to_char(sqldate, format);
END ;

CREATE OR REPLACE FUNCTION GetStartDayOfWeek(time_stamp timestamp) RETURN DATE
AS BEGIN
    return (CASE WHEN ( to_char(time_stamp,'d') = 1 ) THEN (time_stamp - 6) ELSE (time_stamp - ((to_char(time_stamp,'d')) - 2)) END );
END ;

CREATE OR REPLACE FUNCTION OffpeakCheck(from_value VARCHAR2, to_value VARCHAR2, time_stamp TIMESTAMP) RETURN VARCHAR2
AS BEGIN
    return (
			CASE WHEN ( from_value < to_value and (to_char(time_stamp,'hh24mi') BETWEEN from_value AND to_value) ) 
			THEN 
				('true') 
			ELSE (CASE WHEN (from_value > to_value and ((to_char(time_stamp,'hh24mi') BETWEEN from_value and '2359') or (to_char(time_stamp,'hh24mi') BETWEEN '0000' and to_value)))
					THEN ('true')
					ELSE ('false')
					END )
			END );
END ;
 

create table nik_gprs_cdr_summary
(
 TSR_FROM_DTTM                              TIMESTAMP(6)   ,
 TSR_TO_DTTM								  TIMESTAMP(6)   ,
 NETWORK_ID                                 NUMBER(10)     ,
 SUM_DURATION                               NUMBER(19)     ,
 PHONE_NUMBER                               VARCHAR2(255)  ,
 SUM_DATA_VOLUME                            NUMBER(19)     ,
 CHARGING_ID                                VARCHAR2(255)  ,
 MIN_TIME_STAMP                             TIMESTAMP(6)   ,
 MAX_TIME_STAMP                             TIMESTAMP(6)   ,
 ACCOUNT_NAME                               VARCHAR2(255)  ,
 FIRST_NAME                                 VARCHAR2(255)  ,
 MIDDLE_NAME                                VARCHAR2(255)  ,
 LAST_NAME                                  VARCHAR2(255)  ,
 IMSI                                       VARCHAR2(255)  ,
 PRODUCT_TYPE                               NUMBER(10)     ,
 SUBSCRIBER_TYPE                            NUMBER(10)     ,
 SUBSCRIBER_ID                              NUMBER(20)     ,
 SUBSCRIBER_STATUS                          NUMBER(20)     ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;


create table nik_ipdr_summary
(
 TSR_FROM_DTTM                              TIMESTAMP(6)   ,
 TSR_TO_DTTM								 TIMESTAMP(6)   ,
 NETWORK_ID                                 NUMBER(10)     ,
 PHONE_NUMBER                               VARCHAR2(255)  ,
 MIN_TIME_STAMP                             TIMESTAMP(6)   ,
 MAX_TIME_STAMP                             TIMESTAMP(6)   ,
 SUM_DURATION                               NUMBER(19)     ,
 SUM_UPLOAD_DATA_VOLUME                     NUMBER(19)     ,
 SUM_DOWNLOAD_DATA_VOLUME                   NUMBER(19)     ,
 IPDR_TYPE                                  NUMBER(10)     ,
 SUM_VAL                                    NUMBER(19)     ,
 USER_NAME                                  VARCHAR2(255)  ,
 SESSION_ID                                 VARCHAR2(255)  ,
 ACCOUNT_NAME                               VARCHAR2(255)  ,
 FIRST_NAME                                 VARCHAR2(255)  ,
 MIDDLE_NAME                                VARCHAR2(255)  ,
 LAST_NAME                                  VARCHAR2(255)  ,
 IMSI                                       VARCHAR2(255)  ,
 PRODUCT_TYPE                               NUMBER(10)     ,
 SUBSCRIBER_TYPE                            NUMBER(10)     ,
 SUBSCRIBER_ID                              NUMBER(20)     ,
 SUBSCRIBER_STATUS                          NUMBER(20)     ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;


create table nik_cdr_per_call_summary
(
 TSR_FROM_DTTM                              TIMESTAMP(6)    ,
 TSR_TO_DTTM								   TIMESTAMP(6)    ,
 BAND_ID                                    NUMBER(10)      ,
 NETWORK_ID                                 NUMBER(10)      ,
 PHONE_NUMBER                               VARCHAR2(255)   ,
 RECORD_TYPE                                NUMBER(10)      ,
 CDR_TYPE                                   NUMBER(10)      ,
 CALL_TYPE                                  NUMBER(10)      ,
 SUM_DURATION                               NUMBER(19)      ,
 SUM_VAL                                    NUMBER(19)      ,
 COUNT_XDR_ID                               NUMBER(19)      ,
 ACCOUNT_NAME                               VARCHAR2(255)   ,
 FIRST_NAME                                 VARCHAR2(255)   ,
 MIDDLE_NAME                                VARCHAR2(255)   ,
 LAST_NAME                                  VARCHAR2(255)   ,
 IMSI                                       VARCHAR2(255)   ,
 PRODUCT_TYPE                               NUMBER(19)      ,
 SUBSCRIBER_TYPE                            NUMBER(19)      ,
 SUBSCRIBER_ID                              NUMBER(20)      ,
 SUBSCRIBER_STATUS                          NUMBER(20)      ,
 WEEK_OF_YEAR                               NUMBER(10)	   ,
 VPMN 									   VARCHAR2(255)
)
;


create table nik_cdr_offpeak_summary
(
 TSR_FROM_DTTM                              TIMESTAMP(6)    ,
 TSR_TO_DTTM								   TIMESTAMP(6)    ,
 BAND_ID                                    NUMBER(10)      ,
 NETWORK_ID                                 NUMBER(10)      ,
 PHONE_NUMBER                               VARCHAR2(255)   ,
 RECORD_TYPE                                NUMBER(10)      ,
 CDR_TYPE                                   NUMBER(10)      ,
 CALL_TYPE                                  NUMBER(10)      ,
 SUM_DURATION                               NUMBER(19)      ,
 SUM_VAL                                    NUMBER(19)      ,
 COUNT_XDR_ID                               NUMBER(19)      ,
 ACCOUNT_NAME                               VARCHAR2(255)   ,
 FIRST_NAME                                 VARCHAR2(255)   ,
 MIDDLE_NAME                                VARCHAR2(255)   ,
 LAST_NAME                                  VARCHAR2(255)   ,
 IMSI                                       VARCHAR2(255)   ,
 PRODUCT_TYPE                               NUMBER(19)      ,
 SUBSCRIBER_TYPE                            NUMBER(19)      ,
 SUBSCRIBER_ID                              NUMBER(20)      ,
 SUBSCRIBER_STATUS                          NUMBER(20)      ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;


create table nik_recharge_log_summary
(
 TSR_FROM_DTTM                              TIMESTAMP(6)   ,
 TSR_TO_DTTM								  TIMESTAMP(6)   ,
 NETWORK_ID                                 NUMBER(10)     ,
 PHONE_NUMBER                               VARCHAR2(255)  ,
 ACCOUNT_NAME                               VARCHAR2(255)  ,
 TOTAL_VALUE                                NUMBER(19)     ,
 RECHARGE_COUNT                             NUMBER(19)     ,
 SUBSCRIBER_ID                              NUMBER(20)     ,
 SUBSCRIBER_STATUS                          NUMBER(20)     ,
 WEEK_OF_YEAR                               NUMBER(10)
)
; 

create table gprs_ts_temp
(
 TSR_FROM_DTTM                              TIMESTAMP(6) ,
 TSR_TO_DTTM                              TIMESTAMP(6) ,
 NETWORK_ID                                 NUMBER(10)   ,
 SUM_DURATION                               NUMBER(19)   ,
 PHONE_NUMBER                               VARCHAR2(255),                                                                                           
 SUM_DATA_VOLUME                            NUMBER(19)   ,                                                                                           
 CHARGING_ID                                VARCHAR2(255),                                                                                           
 MIN_TIME_STAMP                             TIMESTAMP(6) ,                                                                                           
 MAX_TIME_STAMP                             TIMESTAMP(6) ,                                                                                           
 ACCOUNT_NAME                               VARCHAR2(255),                                                                                           
 FIRST_NAME                                 VARCHAR2(255),                                                                                           
 MIDDLE_NAME                                VARCHAR2(255),                                                                                           
 LAST_NAME                                  VARCHAR2(255),                                                                                           
 IMSI                                       VARCHAR2(255),                                                                                           
 PRODUCT_TYPE                               NUMBER(10)   ,                                                                                           
 SUBSCRIBER_TYPE                            NUMBER(10)   , 
 SUBSCRIBER_ID                              NUMBER(20)   ,
 SUBSCRIBER_STATUS                          NUMBER(20)   ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;

create table ipdr_ts_temp
(
 TSR_FROM_DTTM                              TIMESTAMP(6)   ,
 TSR_TO_DTTM                              TIMESTAMP(6)   ,
 NETWORK_ID                                 NUMBER(10)     ,
 PHONE_NUMBER                               VARCHAR2(255)  ,
 MIN_TIME_STAMP                             TIMESTAMP(6)   ,
 MAX_TIME_STAMP                             TIMESTAMP(6)   ,
 SUM_DURATION                               NUMBER(19)     ,
 SUM_UPLOAD_DATA_VOLUME                     NUMBER(19)     ,
 SUM_DOWNLOAD_DATA_VOLUME                   NUMBER(19)     ,
 IPDR_TYPE                                  NUMBER(10)     ,
 SUM_VAL                                    NUMBER(19)     ,
 USER_NAME                                  VARCHAR2(255)  ,
 SESSION_ID                                 VARCHAR2(255)  ,
 ACCOUNT_NAME                               VARCHAR2(255)  ,
 FIRST_NAME                                 VARCHAR2(255)  ,
 MIDDLE_NAME                                VARCHAR2(255)  ,
 LAST_NAME                                  VARCHAR2(255)  ,
 IMSI                                       VARCHAR2(255)  ,
 PRODUCT_TYPE                               NUMBER(10)     ,
 SUBSCRIBER_TYPE                            NUMBER(10)     ,
 SUBSCRIBER_ID                              NUMBER(20)     ,
 SUBSCRIBER_STATUS                          NUMBER(20)     ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;

create table recharge_log_ts_temp
(
 TSR_FROM_DTTM                              TIMESTAMP(6)   ,
 TSR_TO_DTTM                              TIMESTAMP(6)   ,
 NETWORK_ID                                 NUMBER(10)     ,
 PHONE_NUMBER                               VARCHAR2(255)  ,
 ACCOUNT_NAME                               VARCHAR2(255)  ,
 TOTAL_VALUE                                NUMBER(19)     ,
 RECHARGE_COUNT                             NUMBER(19)     ,
 SUBSCRIBER_ID                              NUMBER(20)     ,
 SUBSCRIBER_STATUS                          NUMBER(20)     ,
 WEEK_OF_YEAR                               NUMBER(10)
)
;

create table cdr_percall_ts_temp
(
 TSR_FROM_DTTM                              TIMESTAMP(6)    ,
 TSR_TO_DTTM                              TIMESTAMP(6)    ,
 BAND_ID                                    NUMBER(10)      ,
 NETWORK_ID                                 NUMBER(10)      ,
 PHONE_NUMBER                               VARCHAR2(255)   ,
 RECORD_TYPE                                NUMBER(10)      ,
 CDR_TYPE                                   NUMBER(10)      ,
 CALL_TYPE                                  NUMBER(10)      ,
 SUM_DURATION                               NUMBER(19)      ,
 SUM_VAL                                    NUMBER(19)      ,
 COUNT_XDR_ID                               NUMBER(19)      ,
 ACCOUNT_NAME                               VARCHAR2(255)   ,
 FIRST_NAME                                 VARCHAR2(255)   ,
 MIDDLE_NAME                                VARCHAR2(255)   ,
 LAST_NAME                                  VARCHAR2(255)   ,
 IMSI                                       VARCHAR2(255)   ,
 PRODUCT_TYPE                               NUMBER(19)      ,
 SUBSCRIBER_TYPE                            NUMBER(19)      ,
 SUBSCRIBER_ID                              NUMBER(20)      ,
 SUBSCRIBER_STATUS                          NUMBER(20)      ,
 WEEK_OF_YEAR                               NUMBER(10)	   ,
 VPMN									   VARCHAR2(255)
) 
;

create table cdr_offpeak_ts_temp
(
 TSR_FROM_DTTM                              TIMESTAMP(6)    ,
 TSR_TO_DTTM                              TIMESTAMP(6)    ,
 BAND_ID                                    NUMBER(10)      ,
 NETWORK_ID                                 NUMBER(10)      ,
 PHONE_NUMBER                               VARCHAR2(255)   ,
 RECORD_TYPE                                NUMBER(10)      ,
 CDR_TYPE                                   NUMBER(10)      ,
 CALL_TYPE                                  NUMBER(10)      ,
 SUM_DURATION                               NUMBER(19)      ,
 SUM_VAL                                    NUMBER(19)      ,
 COUNT_XDR_ID                               NUMBER(19)      ,
 ACCOUNT_NAME                               VARCHAR2(255)   ,
 FIRST_NAME                                 VARCHAR2(255)   ,
 MIDDLE_NAME                                VARCHAR2(255)   ,
 LAST_NAME                                  VARCHAR2(255)   ,
 IMSI                                       VARCHAR2(255)   ,
 PRODUCT_TYPE                               NUMBER(19)      ,
 SUBSCRIBER_TYPE                            NUMBER(19)      ,
 SUBSCRIBER_ID                              NUMBER(20)      ,
 SUBSCRIBER_STATUS                          NUMBER(20)      ,
 WEEK_OF_YEAR                               NUMBER(10)
)
; 

