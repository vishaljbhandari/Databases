
SPOOL populateFCNForAlarmLink.log   
 
set serveroutput off 
SET FEEDBACK OFF 
CREATE OR REPLACE PROCEDURE alarmlinkgeneratefcn AS
	CURSOR alarmcursor is 
	SELECT reference_id,reference_value
	FROM alarms
	WHERE reference_type=1 and reference_value not in (select distinct(phone_number) from frq_called_destinations) 
	order by reference_value;

	alarmcur alarmcursor%ROWTYPE ;	

begin
FOR alarmcur in alarmcursor
LOOP
	if alarmcur.reference_id > 1024
	then
		AlarmClosureAction.ProcessSubscriber(alarmcur.reference_id, 0 , alarmcur.reference_value) ;
	end if;
END LOOP ;
end;
/
commit ;
