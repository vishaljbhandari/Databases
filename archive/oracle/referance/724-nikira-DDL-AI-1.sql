spool nikira-DDL-AI-1.log
set feedback off ;
set serveroutput off ;


CREATE TABLE ANI_PREFIX
(
        PREFIX          VARCHAR2(20) NOT NULL,
        DESCRIPTION VARCHAR2(50) ,
        CONSTRAINT PK_ANI_PRE_PRE PRIMARY KEY (PREFIX)
);

CREATE TABLE AI_GROUPS
(
        NAME                    VARCHAR2(30) NOT NULL,
        CONSTRAINT PK_AI_GROUPS_NAME PRIMARY KEY (NAME)
);

CREATE TABLE AI_DISCRETIZATION_BANDS (
        BAND_ID                 NUMBER(20, 0) NOT NULL,
        PROFILE_TYPE            NUMBER(20, 0) NOT NULL,
        FIELD_NAME              VARCHAR2(20)  NOT NULL,
        MIN_RANGE_VALUE         NUMBER(20, 2) NOT NULL,
        MAX_RANGE_VALUE         NUMBER(20, 2) NOT NULL,
        TOLERANCE               NUMBER(20, 2) NOT NULL,
        NETWORK_ID              NUMBER(20, 0) NOT NULL
        );
commit;
spool off
