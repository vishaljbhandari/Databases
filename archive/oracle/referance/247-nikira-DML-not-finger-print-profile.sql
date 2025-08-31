spool nikira-DML-not-finger-print-profile.log
set feedback off ;
set serveroutput off ;

-- Entries For Analyst Action
insert into analyst_actions(id, name, category, action_script, description, is_active, is_visible, controller_name) values (25, 'Generate Life Style Profile','ALARM_CLOSER_ACTION','generate_lifestyle_profile_action','',1, 1, '') ;

DECLARE
    network_count number(20) ;
	BEGIN
	 select count(*) into network_count from networks;
	 if (network_count > 1) then
		insert into analyst_actions_networks(analyst_action_id, network_id)
		(select a.id, n.id from  analyst_actions a, networks n where n.id != 999 and a.name='Generate Life Style Profile') ;
		insert into profile_options (id, description, is_enabled, network_id) (select 1, 'Generate Life Style Profile', 1, id from networks where id != 999) ;
	else 
	 if (network_count = 1) then
		insert into analyst_actions_networks(analyst_action_id, network_id)
		 (select a.id, n.id from  analyst_actions a, networks n where a.name='Generate Life Style Profile') ;
		insert into profile_options (id, description, is_enabled, network_id) (select 1, 'Generate Life Style Profile', 1, id from networks ) ;
	end if ;
end if ;
END ;
/
commit ;

