BEGIN
     EXECUTE IMMEDIATE 'DROP table SQL_VERSION';
     EXCEPTION
         WHEN OTHERS THEN
		null;
    END;
/

BEGIN
     EXECUTE IMMEDIATE 'DROP sequence SQL_VERSION_SEQ';
     EXCEPTION
         WHEN OTHERS THEN
        null;
    END;
/





create table SQL_VERSION
(
    ID number(20) not null,
    SQL_TYPE number(10) not null,
    FILE_NAME varchar2(255) not null,
    MAJOR_VERSION number(10) not null,
    MINOR_VERSION number(10) not null,
    SPK_NO number(10) not null,
    INSTALLER_NAME varchar2(255) not null,
    RUN_DATE date not null
) ;

declare v_count number; 
	begin 
		select  count(1) into v_count  from    user_indexes where   index_name  = 'SQL_VERSION_PK' and     table_name  = 'SQL_VERSION'; 
		if v_count = 0 
			then    
				execute immediate '        create unique index SQL_VERSION_PK        on SQL_VERSION(ID)  nologging     ';  
		end if; 
	end;

/

declare v_count number; 
	begin 
		select  count(1) into v_count  from    user_indexes where   index_name  = 'SQL_VERSION_FNAME_STPE' and table_name  = 'SQL_VERSION'; 
		if v_count = 0 
			then    
				execute immediate '        create unique index SQL_VERSION_FNAME_STPE        on SQL_VERSION(SQL_TYPE,FILE_NAME)  nologging     ';  
			end if; 
		end;

/
create sequence SQL_VERSION_SEQ increment by 1 nocycle  cache 20 start with 1024 minvalue 1024;


delete from sql_version ;
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'SUBCRIBER_ACCOUNT.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'ACCOUNT_CREDIT_DETAIL.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'ACCOUNT_RECHARGE_DETAIL.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'HOLIDAY_LISTS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'FAVORITES.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'NIK_BAND.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'SERVICES.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'WEEKENDS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'ZONE_CODES.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'ML_HMM_BAND.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'RESOURCE_PLANS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'OFFLINE_READINESS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 1, 'COUNTRY_CODES.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 2, 'CELL_SITE_GEO_POSITIONS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 2, 'DBWRITER_CONFIGURATIONS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 2, 'NETWORKS_RANGER_USERS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 2, 'SUBCRIBER.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 2, 'VELOCITY_EVENT_CONFIGS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 3, 'CUSTOMER_NOTIFICATION.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 3, 'SP_BLOCK_ALERTS.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 3, 'temporaryCounterTables.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 3, 'fms_core_sequence_definitions.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 3, 'core_global_tables.sql', 8,3, 1,'ROC Fraud Management Core',sysdate);
insert into sql_version(id,sql_type,file_name,major_version,minor_version,spk_no,installer_name,run_date) values (sql_version_seq.nextval, 5, 'genericOracleFile.sql', 8,3, 1,'ROC Fraud Management GDO',sysdate);


update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%'' or category is null) and parent_id != 0 and id > 1024 and rule_mode=0' where tr_id = 25 and key = '-176' ;

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) || decode((is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%STATISTICAL_ONLINE%'' or category is null or category like ''TEST%'' or category like ''%INLINE_RULES%'') and parent_id != 0 and id > 1024 and rule_mode<>1 UNION select key as Key, name || '' ( '' || user_id  || '''' || decode(is_active, 0 , '' - Deleted'') || '' )'' as Value from rules r where version = 0 and category like ''%MANUAL.PRECHECK%'' and user_id not in (''radmin'',''default'',''system'' )' where tr_id = 69 and key = '-176' ;

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r  where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%MANUAL.PRECHECK%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%'' or category like ''%STATISTICAL_ONLINE%'' or category is null or rule_mode in (1,2,3)) and parent_id != 0 and id > 1024' where tr_id = 547 and key = '-176' ;

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1, '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%'' or category is null) and parent_id != 0 and id > 1024 and rule_mode=0' where tr_id = 24 and key = '-176'

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name)  || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r  where version = ( select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category like ''%NEGATIVE_RULE%'' or category like ''%FINGERPRINT_RULE%'' or category like ''%STATISTICAL_RULE%'' or category like ''%INLINE_RULES%'' or category is null) and parent_id != 0 and id > 1024' where tr_id = 87 and key = '-176' ;

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category is null) and is_active = 1 and parent_id != 0 and id > 1024 and (pseudo_function_id not in (27, 28)) and rule_mode = 0 and aggregation_type!=3' where tr_id = 103 and key = '-176' ;

update translations set value = 'select key as Key, decode((is_active + is_enabled),0,replace(name,''_Del_''||key||''_''||version,''''),name) || decode( (is_active + is_enabled) , 0 , '' (Deleted)'' , 1 , '' (Disabled)'', 2 , '''','''') as Value from rules r where version = (select max(version) from rules where r.key = key) and (category like ''%SMART_PATTERN%'' or category like ''%MANUAL_ALARM_RULES%'' or category = ''CalledToCalledBy'' or category is null) and parent_id != 0 and id > 1024' where tr_id = 68 and key = '-176' ;


-- Update for manual precheck rules

CREATE OR REPLACE PROCEDURE rules_bc
as
BEGIN
	for rec in (select uo.OPTION_ID,uo.USER_ID,uo.ROLE_ID, uo.VALUE as value,rg.name  as name from user_options uo,ranger_groups rg where rg.id=uo.ROLE_ID and UPPER(OPTION_ID) like('%RULEID%') and value !='0')
	loop

		update rules set name = name ||'_'||'('||rec.name||')'  where to_char(id)=rec.value; 
	end loop;

END rules_bc ;
/

exec rules_bc;

DECLARE
begin
	update rules set NAME = NAME ||'_'||'RTF'||'_'||KEY||'_'||VERSION where name='on_demand_run';

for rec in ( select KEY,max(version) as version from rules where KEY  in  (select distinct KEY from rules where category != 'SYSTEM_RULES') group by KEY)
loop
	for rec1 in (select ID,key,is_active,is_enabled  FROM rules WHERE KEY=rec.KEY and version = rec.version)
	loop
		IF rec1.is_active = 0 and rec1.is_enabled = 0 THEN
			update rules set name = name ||'_Del'||'_'||KEY||'_'||VERSION where key=rec1.key ;
		END IF;
	end loop;
end loop;

END ;
/
commit;

exit

