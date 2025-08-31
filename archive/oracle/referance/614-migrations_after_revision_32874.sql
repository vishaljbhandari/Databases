spool migrations_after_revision_32874.log


update field_configs set IS_VISIBLE=1 where record_config_id=15 and database_field='ENTITY_TYPE' ;
insert into expandable_field_maps(id, name, source_view_id, source_key, dest_view_id, dest_key, is_new_view, dest_key_type, category) values (201, 'InternalUserId-InternalUser', 115, 'VALUE', 83, 'ID', 0, 213, 'RECORD_VIEW'); 

update record_view_configs set where_clause='(USER_ID IS NULL OR USER_ID = '' '' AND STATUS IN (1,6))' where id = 16 ;

alter table configurations modify config_key varchar2(256);


update record_configs set tname = 'DEVIATED_CUM_VOICE_ROC_RECORDS' where id = 29 ;
update record_configs set tname = 'DEVIATED_CUM_DATA_ROC_RECORDS' where id = 30 ;

delete from archive_maps where id in (7,8) ;
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(7, 'AR_DEV_CUM_VOICE_ROC_RECORDS', 'AR_DEV_CUM_VOICE_ROC_RECORDS', 29);
insert into archive_maps(ID, ARCHIVE_NAME, LOOKUP_TABLE_NAME, RECORD_CONFIG_ID) values(8, 'AR_DEV_CUM_DATA_ROC_RECORDS', 'AR_DEV_CUM_DATA_ROC_RECORDS', 30) ;

insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'CLEANUP.RECORDS.DEVIATED_CUM_VOICE_ROC_RECORDS.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval, 'CLEANUP.RECORDS.DEVIATED_CUM_DATA_ROC_RECORDS.OPTIONS', '1970/01/01 00:00:00,30') ;
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_DEVIATED_CUM_VOICE_ROC_RECORDS_DAY_TRUNCED','');
insert into configurations(id, config_key, value) values (configurations_seq.nextval,'CLEANUP.RECORDS.LAST_DEVIATED_CUM_DATA_ROC_RECORDS_DAY_TRUNCED','');

CREATE TABLE AR_DEV_CUM_VOICE_ROC_RECORDS AS SELECT * FROM DEVIATED_CUM_VOICE_ROC_RECORDS WHERE 1=2 ;
CREATE TABLE AR_DEV_CUM_DATA_ROC_RECORDS AS SELECT * FROM DEVIATED_CUM_DATA_ROC_RECORDS WHERE 1=2 ;


CREATE SEQUENCE AR_DCR_VOICE_ID INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;
CREATE SEQUENCE AR_DCR_DATA_ID INCREMENT BY 1 NOMAXVALUE MINVALUE 1 NOCYCLE CACHE 20 ORDER;


commit ;

spool off;
quit;
