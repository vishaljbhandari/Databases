spool nikira-DDL-db-gprs.log
set feedback off ;
set serveroutput off ;


CREATE TABLE SESSION_SUMMARY
(
        NETWORK_ID                                      NUMBER(20),
        SUBSCRIBER_ID                           NUMBER(20),
        PHONE_NUMBER                VARCHAR2(20),
        START_DATE                                      DATE,
        END_DATE                                        DATE,
        DURATION                                        NUMBER(20),
        VOLUME                                          NUMBER(20)
);

CREATE TABLE CAUSE_FOR_SESSION_CLOSING
(
        ID                              NUMBER(10) NOT NULL,
        DESCRIPTION             VARCHAR2(40) NOT NULL
) ;

CREATE TABLE ALERT_CHARGINGID
(
        ALERT_ID                                        NUMBER(20,0) NOT NULL ,
        CHARGING_ID                                     VARCHAR(10) NOT NULL,
        CONSTRAINT PK_AL_CHID   PRIMARY KEY (ALERT_ID, CHARGING_ID)
) ;

commit ;

