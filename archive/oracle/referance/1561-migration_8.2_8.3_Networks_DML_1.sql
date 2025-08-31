DECLARE
network_count number(20) ;
BEGIN

select count(*) into network_count from networks where ID !=999;

IF (network_count >= 1) then
delete from  user_options where option_id like '%.selectedNetworkView' and value = '999' ;
delete from networks_ranger_users where NETWORK_ID = 999 ;
delete from NETWORKS_RULES where NETWORK_ID = 999 ;
delete from HOLIDAY_LISTS_NETWORKS where NETWORK_ID = 999 ;
delete from ANALYST_ACTIONS_NETWORKS where NETWORK_ID = 999 ;
delete from FREE_NUMBERS_NETWORKS where NETWORK_ID = 999 ;
delete from HOTLIST_GROUPS_NETWORKS where NETWORK_ID = 999 ;
delete from LIST_CONFIGS_NETWORKS where NETWORK_ID = 999 ;
delete from NETWORKS_NOTIFICATION_PACKS where NETWORK_ID = 999 ;
delete from NETWORKS_PREPAID_TOP_UPS where NETWORK_ID = 999 ;
delete from NETWORKS_RATER_SPECIAL_NUMBERS where NETWORK_ID = 999 ;
delete from NETWORKS_SCHEDULERS where NETWORK_ID = 999 ;
delete from NETWORKS_SDR_RATES where NETWORK_ID = 999 ;
delete from NETWORKS_SUBSCRIBER_GROUPS where NETWORK_ID = 999 ;
delete from NETWORKS_TEAMS where NETWORK_ID = 999 ;

update field_configs set is_visible = 1 where database_field = 'NETWORK_ID' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK_ID' and is_visible = 1);
update field_configs set is_visible = 0 where database_field = 'NETWORK_ID' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK_ID' and is_visible = 0);
update field_configs set is_filter = 0 where database_field = 'NETWORK_ID' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK_ID' and is_filter = 0);
update field_configs set is_filter = 1 where database_field = 'NETWORK_ID' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK_ID' and is_filter = 1);

update field_configs set is_visible = 1 where database_field = 'NETWORK' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK' and is_visible = 1);
update field_configs set is_visible = 0 where database_field = 'NETWORK' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK' and is_visible = 0);
update field_configs set is_filter = 0 where database_field = 'NETWORK' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK' and is_filter = 0);
update field_configs set is_filter = 1 where database_field = 'NETWORK' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORK' and is_filter = 1);

update field_configs set is_visible = 1 where database_field = 'NETWORKS' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORKS' and is_visible = 1);
update field_configs set is_visible = 0 where database_field = 'NETWORKS' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORKS' and is_visible = 0);
update field_configs set is_filter = 0 where database_field = 'NETWORKS' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORKS' and is_filter = 0);
update field_configs set is_filter = 1 where database_field = 'NETWORKS' and record_config_id in ( select record_config_id from field_configs_mig where database_field = 'NETWORKS' and is_filter = 1);

END IF;
commit;
END ;
/

