spool additional_migration.log ;
set feedback on ;
set serveroutput on ;

delete from sp_aggregation_type_maps where parent_aggregation = 44 ;

update user_options set value = '1, 2 ,3 ,4 ,5, 6, 7, 8, 9, 10' where user_id = 'nadmin' and option_id = '84.SelectedFields' ;
update user_options set value = '1, 2, 3, 4 ,5, 6' where user_id = 'nadmin' and option_id = '85.SelectedFields' ;

alter table rsage_temp_groups_count alter column groups set data type varchar2(256) ;

@system_rule_fix.sql ;

commit ;
exit ;
