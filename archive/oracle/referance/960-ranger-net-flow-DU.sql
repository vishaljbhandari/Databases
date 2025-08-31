set feedback off

drop table netflow cascade constraints ;
drop table netflow_counter ;
drop table archived_netflow;
drop sequence netflow_id ;
drop sequence archived_netflow_id;

DROP INDEX IX_NETFLOW_ACCNT_NAME;
DROP INDEX IX_NETFLOW_COUNTER_REF_ID;
DROP INDEX IX_NETFLOW_COUNTER_AGG_VALUE;
DROP INDEX IX_NETFLOW_COUNTER_AGG_TYPE;
DROP INDEX IX_AR_NETFLOW_ACCNT_NAME;

create table netflow
(
	id      		            number(20,0)          not null,
    account_name                varchar2(64)        not null,
    protocol                    varchar2(256)               ,
	netflow_date                date                not null,
	total_upload_volume         number(20,6)        ,
	total_value_cost            number(20,6)        ,
	network_id					number(20,6)		not null,
	source						varchar2(255)	 	,	
	day_of_year					number(20,0)		,
	hour_of_day					number(20,0)
) ;

CREATE INDEX IX_NETFLOW_ACCNT_NAME ON NETFLOW("ACCOUNT_NAME") ;

create table netflow_counter
(
  REFERENCE_ID                   NUMBER(20) not null,
  AGGREGATION_TYPE               NUMBER(20) not null,
  AGGREGATION_VALUE              VARCHAR2(40) not null,
  RECORD_CATEGORY                NUMBER(2),
  SERIAL_NUMBER                  NUMBER(20) not null,
  NO_ELEMENTS                    NUMBER(20),
  THREAD_ID                      NUMBER(5),
  RAW1                           RAW(2000),
  RAW2                           RAW(2000),
  RAW3							 RAW(2000),
  RAW4                           RAW(2000),
  RAW5                           RAW(2000),
  RAW6                           RAW(2000),
  RAW7                           RAW(2000),
  RAW8                           RAW(2000)
);

CREATE INDEX IX_NETFLOW_COUNTER_REF_ID ON NETFLOW_COUNTER("REFERENCE_ID") ;
CREATE INDEX IX_NETFLOW_COUNTER_AGG_VALUE ON NETFLOW_COUNTER("AGGREGATION_VALUE") ;
CREATE INDEX IX_NETFLOW_COUNTER_AGG_TYPE ON NETFLOW_COUNTER("AGGREGATION_TYPE") ;

create table archived_netflow
(
    id                          number(20,0)          not null,
    account_name                varchar2(64)        not null,
    protocol                    varchar2(256)               ,
    netflow_date                date                not null,
    total_upload_volume         number(20,6)        ,
    total_value_cost            number(20,6)        ,
    network_id                  number(20,6)        not null,
    source                      varchar2(255)       ,
    day_of_year                 number(20,0)        ,
    hour_of_day                 number(20,0)
) ;

CREATE INDEX IX_AR_NETFLOW_ACCNT_NAME ON ARCHIVED_NETFLOW("ACCOUNT_NAME");

create sequence netflow_id increment by 1 start with 1 nomaxvalue nocycle nocache ;
CREATE SEQUENCE ARCHIVED_NETFLOW_ID INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;

commit;
quit;
	
