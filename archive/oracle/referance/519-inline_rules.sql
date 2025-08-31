insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(152,'Inline Rules',44,'RULE_MODE=0 AND IS_ACTIVE = 1 AND CATEGORY IN (''INLINE_RULES'')','KEY ASC', 1, 0,0, 1) ;

insert into record_view_configs (id, name, record_config_id, where_clause, order_by, is_pagination_enabled, is_visible, is_cell_specific, is_primary_view) values(153,'Inline Rule History',48,'','KEY ASC', 1, 0,0, 1) ;


insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM, IMAGE_SRC ) values (tasks_seq.nextval, '0,1,2,3,4', GetParentID('Rule Management'), 'Inline Rule Management','',0, 1, '') ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,3,4', GetParentID('Inline Rule Management'), 'Inline Rules','/inline_rule/list_rule_instance/152;/rule/compare_rules/153;/rule/back_to_rule_page/153;', 0, 1);

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,3,4', GetParentID('Inline Rules'), 'Add Inline Rule','/inline_rule/new_rule/152;/inline_rule/new/152;', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,3,4', GetParentID('Inline Rules'), 'Show Inline Rule', '/inline_rule/show', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,3,4', GetParentID('Inline Rules'), 'Edit Inline Rule','/inline_rule/edit', 0, 0) ;

insert into tasks (ID, PACKAGE_IDS, PARENT_ID, NAME, LINK, IS_DEFAULT, IS_MENU_ITEM ) values (tasks_seq.nextval, '0,2,3,4', GetParentID('Inline Rules'), 'Delete Inline Rule', '/inline_rule/destroy;/inline_rule/multiple_delete/152', 0, 0) ;






exec MigrateDefaultRolesForTask (GetParentID('Inline Rule Management')) ;
exec MigrateDefaultRolesForTask (GetParentID('Inline Rules', 'Inline Rule Management')) ;
exec MigrateDefaultRolesForTask (GetParentID('Add Inline Rule', 'Inline Rules')) ;
exec MigrateDefaultRolesForTask (GetParentID('Edit Inline Rule', 'Inline Rules')) ;
exec MigrateDefaultRolesForTask (GetParentID('Delete Inline Rule', 'Inline Rules')) ;

commit;
quit;
