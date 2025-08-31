---------  Coloring rules for Test Rule Status (IS_ENABLED)  -----------

insert into record_configs_rules(rule_id, record_config_id) (select id ,106 from rules where category='COLORING_RULES' and name like 'Rule Status Equal Disabled %' and user_id not in('nadmin','radmin','default'));
