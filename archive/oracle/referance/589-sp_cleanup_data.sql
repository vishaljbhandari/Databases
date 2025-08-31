set serveroutput on;
set feedback on;

declare date_field varchar2(20);
tableCreationStr varchar2(2000);
clean_up_interval number;

begin
    select value into clean_up_interval from configurations where config_key ='SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS';
    select to_char(sysdate -clean_up_interval ,'DD.MM.YYYY') into date_field from dual;
    tableCreationStr := '
create table sp_block_records
(
    SP_BLOCK_ALERTS_ID      NUMBER(20) NOT NULL,
    ALERT_ID                NUMBER(20) NOT NULL,
    CREATED_DATE            DATE NOT NULL, 
    SERIAL_NUMBER           NUMBER(20) NOT NULL,
    RECORD_COUNT            NUMBER(20) NOT NULL,
    RECORD_LIST             VARCHAR2(4000) NOT NULL
)
PARTITION BY RANGE (CREATED_DATE)
INTERVAL(NUMTODSINTERVAL (1, ''DAY''))
(
    PARTITION old_data VALUES LESS THAN (TO_DATE('|| ''''|| date_field ||''''||   ', ''DD.MM.YYYY''))
)' ;

execute immediate tableCreationStr;
end ;
/

create index IX_SP_BL_REC_ALT_ID on sp_block_records(ALERT_ID);
create index IX_SP_BL_REC_SP_BL_AL_ID on sp_block_records(SP_BLOCK_ALERTS_ID);

CREATE OR REPLACE PROCEDURE SP_DATA_CLEANUP IS
    l_vc2 varchar2(20);
    m_dates varchar2(20);
	v_count number;  
	sp_cleanup_interval_days number;
    truncate_table_string varchar2(200);
    copy_to_temp_string varchar2(200);
    copy_from_temp_string varchar2(200);

    truncate_temp_table_string varchar2(200) :='truncate table sp_block_records_tmp';
    insert_to_temp_string varchar2(200) ;
    delete_from_blk_alerts varchar2(200) := 'delete from sp_block_alerts where id in (select sp_block_alerts_id from sp_cleanup_ids)';
	delete_from_sp_violations varchar2(200) ;
    truncate_sp_cleanup_ids varchar2(50) := 'truncate table sp_cleanup_ids';
    v_systimestamp TIMESTAMP := SYSTIMESTAMP;
    CURSOR get_mod_dates IS select distinct to_char(created_date,'YYYY-MM-DD') from sp_block_records where created_date < sysdate - (select value from configurations where config_key ='SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS');
    CURSOR partition_dates is SELECT partition_name,HIGH_VALUE from user_tab_partitions where TABLE_NAME='SP_BLOCK_RECORDS';
    partition_values partition_dates%ROWTYPE;

begin
                                      
	select value into sp_cleanup_interval_days from configurations where config_key ='SMART_PATTERN_CLEANUP_INTERVAL_IN_DAYS';

	insert_to_temp_string := 'insert /*+append nologging*/ into sp_cleanup_ids select id from SP_BLOCK_ALERTS where modified_date < sysdate - ' || sp_cleanup_interval_days ;
	delete_from_sp_violations := 'delete from sp_violations where created_date < sysdate - ' || sp_cleanup_interval_days || ' and run_id not in (select sp_violations_run_id from alert_sp_violations_maps)' ;
      
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('creating index on modified_date for SP_BLOCK_ALERTS at ' || v_systimestamp);
	select count(1) into v_count from user_indexes where index_name  = 'IX_SP_BL_MD_DT' and table_name  = 'SP_BLOCK_ALERTS';  
	if v_count = 0 
		then execute immediate 'CREATE INDEX IX_SP_BL_MD_DT ON SP_BLOCK_ALERTS(modified_date) parallel 2 nologging' ; 
	end if ;    

    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('created index on modified_date for SP_BLOCK_ALERTS at ' || v_systimestamp);

	execute immediate truncate_sp_cleanup_ids ;
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Started copying to sp_cleanup_ids at ' || v_systimestamp);

    execute immediate insert_to_temp_string;
	commit;

    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Copy complete  to sp_cleanup_ids at ' || v_systimestamp);
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Started delete from sp_block_records at ' || v_systimestamp);
    OPEN get_mod_dates;
    LOOP
    FETCH get_mod_dates into m_dates;
        EXIT WHEN get_mod_dates%notfound;
    	OPEN partition_dates ;
	    LOOP
    		FETCH partition_dates into partition_values ;
		        EXIT WHEN partition_dates%notfound;
        		l_vc2 := substr(partition_values.HIGH_VALUE, 11, 10);
		        IF (l_vc2 = m_dates) then
					execute immediate truncate_temp_table_string ;
					copy_to_temp_string := 'insert into sp_block_records_tmp select * from sp_block_records where to_char(created_date,''YYYY-MM-DD'')= ' || ''''|| m_dates || ''''||' and sp_block_alerts_id not in (select SP_BLOCK_ALERTS_ID from sp_cleanup_ids)';
					execute immediate copy_to_temp_string;

					truncate_table_string := 'alter table sp_block_records TRUNCATE PARTITION ' || partition_values.partition_name ;
					execute immediate truncate_table_string;

					copy_from_temp_string := 'alter table sp_block_records exchange partition '|| partition_values.partition_name || ' with table sp_block_records_tmp including indexes without validation';
			
					execute immediate copy_from_temp_string;
					commit;
				END IF;
    	END LOOP;
	    close partition_dates ;
    END LOOP;
    CLOSE get_mod_dates;

    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Completed delete from sp_block_records at ' || v_systimestamp);
	select count(1) into v_count from user_indexes where index_name  = 'IX_SP_BL_MD_DT' and table_name  = 'SP_BLOCK_ALERTS';
	if v_count = 1 
		then 
		execute immediate 'DROP INDEX IX_SP_BL_MD_DT'; 
	end if ;

    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Dropped index on modified_date for sp_block_alerts at ' || v_systimestamp);
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Started delete from sp_block_alerts at ' || v_systimestamp);
	execute immediate delete_from_blk_alerts;
	dbms_output.put_line('Completed delete from sp_block_alerts at ' || v_systimestamp);

	execute immediate truncate_sp_cleanup_ids ;
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Started delete from sp_violations at ' || v_systimestamp);
    v_systimestamp := SYSTIMESTAMP;
    execute immediate delete_from_sp_violations ;
    v_systimestamp := SYSTIMESTAMP;
	dbms_output.put_line('Completed delete from sp_violations at ' || v_systimestamp);
	commit;

end;
/
show errors;
--set serveroutput off;
--set feedback off;
/

