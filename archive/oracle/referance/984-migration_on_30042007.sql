spool migration_on_30042007.log

alter table expressions modify right_field varchar2(4000) ;
alter table filter_tokens modify description varchar2(4000) ;

update configurations set value='yyyy/mm/dd' where config_key = 'DATE_FORMAT' ;

alter table translations modify value  VARCHAR2(1024) ;

-- Translation changes to put order by condition
update translations set value='select id as Key, description as Value from networks order by description' where id=37 ;

update translations set value='select id as Key, name as Value from field_categories where upper(category) like ''%AGGREGATION_TYPE%'' order by name' where id=41 ;
update translations set value='select code as Key, description as Value from country_codes order by description' where id=129 ;
update translations set value='select id as Key, name as Value from field_categories where upper(category) like ''%ACCUMULATION_FIELD%'' order by name' where id=42 ;
update translations set value='select id as Key, description as Value from record_configs where is_visible = 1 order by description' where id=50 ;
update translations set value='select id as Key, name as Value from field_categories where upper(category) like ''%NICKNAME%'' order by name' where id=64 ;

update translations set value='select id as Key, name as Value from ranger_users order by name' where id=65 ;
update translations set value='select key as Key, name as Value from rules r where   version = (select max(version) from rules where r.key = key) and parent_id != 0 and key >= 1024 and smart_pattern_id = 0  AND (category is null or category in (''SMART_PATTERN'', ''MANUAL_ALARM_RULES'')) and is_active = 1 order by name' where id=69 ;

update translations set value='select id as key, description as value from case_reasons order by description' where id=103 ;
update translations set value='select id as Key, description as Value from service order by description' where id=114 ;
update translations set value='select id as Key, description as value from audit_log_event_codes order by description' where id=123 ;
update translations set value='select code as Key, description as Value from country_codes order by description' where id=129 ;

--Enabled pagination for Active Alerts view
update record_view_configs set is_pagination_enabled=1 where id=30 ;

--Tasks for Disconnect User.
insert into tasks values (tasks_seq.nextval, GetParentID('User Management'), 'User Management Disconnect User', '/ranger_user/disconnect_user', 0, 0) ;

insert into ranger_groups_tasks (task_id, ranger_group_id) select tasks_seq.currval,id from ranger_groups where name in ('radmin', 'nadmin' ,'default');

update field_configs set name = 'id',is_expandable = 0, is_visible = 0, translation_id = null where record_config_id in (21, 22, 24) and database_field = 'ID' ;

delete from translations where tr_id=43 ;
delete from translation_indices where id=43 ;

update rules set is_active=1 where category='MANUAL_ALARM_RULES' ;

commit ;

spool off ;
---- alarmgenerator_procedures.sql script
