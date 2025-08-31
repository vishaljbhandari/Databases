spool FIELD_RECORD_CONFIG_MAPS.log



---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 1 and field_category_id = 7 and field_association = '251.271.1' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 1 and field_category_id = 24 and field_association = '251.271.19' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 7 and field_category_id = 7 and field_association = '252.271.1' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 7 and field_category_id = 24 and field_association = '252.35' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 2 and field_category_id = 7 and field_association = '253.271.1' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 83 and field_category_id = 7 and field_association = '254.271.1' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 83 and field_category_id = 24 and field_association = '254.35' ;
---------------------------delete statements ---------------
delete from FIELD_RECORD_CONFIG_MAPS where  record_config_id = 1 and field_category_id = 44 and field_association = '26' ;
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (51,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,7,'1');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (1,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,44,'33');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (83,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,24,'37');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (2,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,7,'43');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (83,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,7,'43');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (500,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,6011,'503.55');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (7,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,24,'54');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (7,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,7,'55');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (1,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,24,'57');
---------------------------insert statements ---------------
insert into FIELD_RECORD_CONFIG_MAPS(record_config_id,id,field_category_id,field_association) values (1,FIELD_RECORD_CONFIG_MAPS_SEQ.nextval,7,'58');
spool off ;
