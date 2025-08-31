declare
counter number(10) := 0;
begin
select count(*) into counter from user_tab_columns where column_name = 'SEVERITY' and table_name = 'FRAUD_TYPES';
if counter = 0 then
	execute immediate 'ALTER TABLE FRAUD_TYPES ADD SEVERITY NUMBER(20)';
end if;
end;
/

---- issue 81 in DSM issues excel sheet fix----

update field_record_config_maps set field_association = '33' where record_config_id = 1 and FIELD_CATEGORY_ID = 44 and field_association = '26';
delete from field_configs where record_config_id = 1 and field_id = 26;

----- Employee code not present in Rules Tags fix----

declare
counter number(10) := 0;
begin
select count(*) into counter from tags where name = 'Employee Code' and category = 'AGGREGATION_TYPE';
if counter = 0 then
	insert into tags values (tags_seq.nextval,'Employee Code','AGGREGATION_TYPE');
end if;
end;
/

----- Service field not present in advance filter for CDR/GPRS-- fixed----- 

update field_configs set is_filter = 1 where field_id = 21 and record_config_id = 1;
update field_configs set is_filter = 1 where field_id = 16 and record_config_id = 7;

----- Recompile dsm views for task restructuring -----

@dsm_view_definitions.sql
