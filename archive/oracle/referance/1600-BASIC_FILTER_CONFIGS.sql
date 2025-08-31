spool BASIC_FILTER_CONFIGS.log



---------------------------insert statements ---------------
insert into BASIC_FILTER_CONFIGS(record_view_config_id,record_config_id,max,operator_id,field_id,id,min,is_mandatory,position,translation_id) values (506,4,'',0,1,BASIC_FILTER_CONFIGS_SEQ.nextval,'',0,1,'');
---------------------------insert statements ---------------
insert into BASIC_FILTER_CONFIGS(record_view_config_id,record_config_id,max,operator_id,field_id,id,min,is_mandatory,position,translation_id) values (506,4,'',0,10,BASIC_FILTER_CONFIGS_SEQ.nextval,'',0,2,'');
---------------------------insert statements ---------------
insert into BASIC_FILTER_CONFIGS(record_view_config_id,record_config_id,max,operator_id,field_id,id,min,is_mandatory,position,translation_id) values (506,4,'31-12-9999',10,2,BASIC_FILTER_CONFIGS_SEQ.nextval,TO_DATE('1970-01-01','YYYY-MM-DD'),0,3,'');
spool off ;
