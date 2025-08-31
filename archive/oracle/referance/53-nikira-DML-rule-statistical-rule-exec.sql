spool nikira-DML-rule-statistical-rule-exec.log
set feedback off ;
set serveroutput off ;


insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - nadmin' and category = 'COLORING_RULES'), 79);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - radmin' and category = 'COLORING_RULES'), 79);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - default' and category = 'COLORING_RULES'), 79);


DECLARE
	record_config_rule_count number(20) ;
BEGIN
	select count(*) into record_config_rule_count from record_configs_rules where record_config_id = 91 ;
if (record_config_rule_count <= 0 ) then 

insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - nadmin' and category = 'COLORING_RULES'), 91);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - radmin' and category = 'COLORING_RULES'), 91);
insert into record_configs_rules (rule_id, record_config_id) values ((select id from rules where name = 'Rule Status Equal Disabled - default' and category = 'COLORING_RULES'), 91);

end if ;
END ;
/


commit ;

