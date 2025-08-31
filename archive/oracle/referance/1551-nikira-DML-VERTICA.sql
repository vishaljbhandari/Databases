declare
	nCount NUMBER;
	v_sql LONG;

begin
	SELECT count(*) into nCount FROM user_tables where table_name = 'TREND_SUMMARY_CONFIGURATIONS';
	IF(nCount <= 0)
	THEN
		v_sql :='
		CREATE TABLE TREND_SUMMARY_CONFIGURATIONS (
        	ID                       NUMBER(20, 0)    NOT NULL,
        	CONFIG_KEY               VARCHAR2(256) NOT NULL,
        	VALUE                    VARCHAR2(500),
        	CONSTRAINT PK_TSCNS_ID PRIMARY KEY (ID),
        	CONSTRAINT UK_TSCNS_KEY UNIQUE (CONFIG_KEY))';

		execute immediate v_sql;


		execute immediate 'CREATE SEQUENCE TRD_SUM_CONFIGURATIONS_SEQ INCREMENT BY 1 NOMAXVALUE MINVALUE 1 START WITH 200 NOCYCLE CACHE 20 ORDER' ;

	END IF;
end;
/

declare
	nCount NUMBER;
	v_sql LONG;

begin
	SELECT count(*) into nCount FROM TREND_SUMMARY_CONFIGURATIONS ;
	IF(nCount <= 0)
	THEN

		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_MACHINE_IP','127.0.0.1');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_MACHINE_ENCRYPTED_USERNAME','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_MACHINE_ENCRYPTED_PASSWORD','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_USG_ENCRYPTED_DB_USERNAME','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_USG_ENCRYPTED_DB_PASSWORD','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_USG_DBNAME','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_MACHINE_RANGERHOME','');
		insert into trend_summary_configurations(id, config_key, value) values(trd_sum_configurations_seq.nextval,'VERTICA_USG_DB_IP','');
	END IF;
end;
/
delete from configurations where config_key='SPARK_USAGE_DB' ;
insert into configurations(id, config_key, value) values(configurations_seq.nextval, 'SPARK_USAGE_DB','VERTICA_DB');

update RECORD_CONFIGS set IS_COST_COMPUTATION_ENABLED= 0 where IS_SPARK_SUPPORT=1;
commit;
