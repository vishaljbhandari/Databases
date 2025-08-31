spool nikira-DML-demo-not-fp.log
set serveroutput off ;
set feedback off ;

	insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(2, 2, 25, 1) ;
	insert into alarm_status_action_maps (id, status, analyst_action_id, reference_type) values(13, 2, 25, 3) ;

commit ;
