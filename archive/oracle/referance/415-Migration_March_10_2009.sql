DROP INDEX IX_PGW_DATA_MSI ;
DROP INDEX IX_AR_PGW_DATA_TS_CN_ED_AN ;
DROP INDEX IX_AR_PGW_DATA_MSI ;

DROP SEQUENCE DU_PGW_DATA_ID ;
DROP SEQUENCE ARCH_DU_PGW_DATA_ID ;

DROP TABLE ARCHIVED_DU_PGW_DATA ;

CREATE SEQUENCE DU_PGW_DATA_ID INCREMENT BY 1 START WITH 1024 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;

ALTER TABLE DU_PGW_DATA
ADD
(
	ID                      NUMBER(20),
	START_DATE              VARCHAR2(8),
	CARD_ACCEPTOR_ID_CODE   VARCHAR2(20),
	TRANSACTION_ID          VARCHAR2(20),
	TRANSACTION_TYPE        VARCHAR2(20),
	STATUS                  VARCHAR2(40),
	PAY_CHANNEL             VARCHAR2(40),
	FIRST_NAME              VARCHAR2(80),
	LAST_NAME               VARCHAR2(80),
	IP_ADDRESS              VARCHAR2(256),
	RSPCODE                 VARCHAR2(5),
	DEST_MSISDN             VARCHAR2(40),
	RESPONSE_CODE           VARCHAR2(5),
	CARD_TYPE               VARCHAR2(20),
	ID_NUMBER               VARCHAR2(20),
	ISSUE                   VARCHAR2(20),
	SUBSCRIBER_ID			NUMBER(20,0),
	NETWORK_ID				NUMBER(20,0),
	DAY_OF_YEAR				NUMBER(20,0) DEFAULT 0
);

CREATE INDEX IX_PGW_DATA_MSI ON DU_PGW_DATA(MSISDN) ;

CREATE SEQUENCE ARCH_DU_PGW_DATA_ID INCREMENT BY 1 START WITH 1024 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER ;
CREATE TABLE ARCHIVED_DU_PGW_DATA
(
	ID						NUMBER(20)		NOT NULL,
	MSISDN					VARCHAR2(40)	NOT NULL,
	TIMESTAMP				DATE			NOT NULL,
	CARD_NO					VARCHAR2(16)	NOT NULL,
	ACCOUNT_NAME			VARCHAR2(40)	NOT NULL,
	VALUE					NUMBER(16,6)	NOT NULL,
	START_DATE				VARCHAR2(8),
	EXPIRY_DATE				VARCHAR2(8)		NOT NULL,
	CARD_HOLDER_NAME		VARCHAR2(64)	NOT NULL,
	CARD_ACCEPTOR_ID_CODE	VARCHAR2(20),
	TRANSACTION_ID			VARCHAR2(20),
	TRANSACTION_TYPE		VARCHAR2(20),
	STATUS					VARCHAR2(40),
	PAY_CHANNEL				VARCHAR2(40),
	FIRST_NAME				VARCHAR2(80),
	LAST_NAME				VARCHAR2(80),
	IP_ADDRESS				VARCHAR2(256),
	RSPCODE					VARCHAR2(5),
	DEST_MSISDN				VARCHAR2(40),
	RESPONSE_CODE			VARCHAR2(5),
	CARD_TYPE				VARCHAR2(20),
	ID_NUMBER				VARCHAR2(20),
	ISSUE					VARCHAR2(20),
	SUBSCRIBER_ID			NUMBER(20,0),
	NETWORK_ID				NUMBER(20,0),
	DAY_OF_YEAR				NUMBER(20,0) DEFAULT 0
);

CREATE INDEX IX_AR_PGW_DATA_TS_CN_ED_AN ON ARCHIVED_DU_PGW_DATA(TIMESTAMP,CARD_NO,EXPIRY_DATE,ACCOUNT_NAME) ;
CREATE INDEX IX_AR_PGW_DATA_MSI ON ARCHIVED_DU_PGW_DATA(MSISDN) ;

delete from CONFIGURATIONS where config_key = 'NETFLOWLOADER.KEY';
delete from RECORD_LOADER_CONFIGURATIONS where id = 8 ;
update configurations set VALUE = replace(VALUE, ',96', '') where CONFIG_KEY='CLEANUP.RECORDS.OPTION' ;

insert into CONFIGURATIONS (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'NETFLOWLOADER.KEY','999_9',1);
insert into RECORD_LOADER_CONFIGURATIONS(ID, RECORD_CONFIG_ID) values (8, 96) ;
update configurations set VALUE = VALUE || ',96' where CONFIG_KEY='CLEANUP.RECORDS.OPTION' ;

update DU_PGW_DATA set NETWORK_ID=999 ;

delete from user_options where option_id='121.PageSize' ;
insert into user_options(id, option_id, user_id, value, is_read_only, is_enabled, role_id) (select user_options_seq.nextval, '121.PageSize', u.name, '50', 0, 1, m.ranger_group_id from ranger_groups_ranger_users m, ranger_users u where u.id = m.ranger_user_id) ;

update field_categories set common_category_id='5001' where id=5001;

delete from alarm_status_action_maps where reference_type = 7 ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 2, 34, 7) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 4, 34, 7) ;
insert into alarm_status_action_maps(id, status, analyst_action_id, reference_type) values (alarm_status_action_maps_seq.nextval, 8, 34, 7) ;

update du_pgw_data set day_of_year = to_char(timestamp,'ddd') ;

delete from CONFIGURATIONS where config_key = 'CLEANUP.RECORDS.LAST_NETFLOW_DAY_TRUNCED';
insert into configurations (ID,CONFIG_KEY,VALUE,IS_VISIBLE) values (CONFIGURATIONS_seq.nextval,'CLEANUP.RECORDS.LAST_NETFLOW_DAY_TRUNCED','',1) ;

commit;

@ ranger-pgw-exec-DU.sql

commit;
quit;
/
