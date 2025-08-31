spool nikira-DML-new-record-config-not-recharge.log
set feedback off ;
set serveroutput off ;
	update expandable_field_maps set category='RECORD_VIEW GR RULE NOT_VISIBLE' where id=16 and name='Account Recharge Details' ;
commit ;

