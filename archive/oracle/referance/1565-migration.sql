set feedback off ;
set serveroutput on ;
spool migrations.log
delete from field_record_config_maps where record_config_id=505 and field_association='30' and field_category_id=11;
commit;
exit
