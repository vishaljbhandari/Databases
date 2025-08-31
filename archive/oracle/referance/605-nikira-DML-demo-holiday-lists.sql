spool nikira-DML-demo-holiday-lists.log
set feedback off ;
set serveroutput off ;
--ranger-new-exec-demo.sql.parse.in


------------------ Installation Type ---------------------------
delete from holiday_lists_networks ;
delete from holiday_lists ;

insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'26-JAN-2000','Republic day');
insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'15-AUG-2000','Independence day');
insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'02-OCT-2000','Gandhi Jayanthi');
insert into holiday_lists(id,holiday_date,description) values(holiday_lists_seq.nextval,'01-MAY-2000', 'May day');

DECLARE
    network_count number(20) ;
	BEGIN
	 select count(*) into network_count from networks;
	 if (network_count = 1) then
insert into holiday_lists_networks ( select n.id, h.id from holiday_lists h, networks n) ;
commit ;
end if ;
end ;
/
commit ;

