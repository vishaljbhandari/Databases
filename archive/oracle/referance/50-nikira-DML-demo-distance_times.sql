spool nikira-DML-demo-distance_times.log
set feedback off ;
set serveroutput off ;

--ranger-new-exec-demo.sql.parse.in

delete distance_times_networks ;
delete distance_times ;

insert into distance_times values(distance_times_seq.nextval, 0, 1, 0);
insert into distance_times values(distance_times_seq.nextval, 1, 5, 300);
insert into distance_times values(distance_times_seq.nextval, 5, 10, 300 * 2);
insert into distance_times values(distance_times_seq.nextval, 10, 15, 300 * 3);
insert into distance_times values(distance_times_seq.nextval, 15, 20, 300 * 4);
insert into distance_times values(distance_times_seq.nextval, 20, 50, 300 * 10);
insert into distance_times values(distance_times_seq.nextval, 50, 100, 300 * 14);
insert into distance_times values(distance_times_seq.nextval, 100, 200, 300 * 24);
insert into distance_times values(distance_times_seq.nextval, 200, 300, 300 * 48);
insert into distance_times values(distance_times_seq.nextval, 300, 400, 300 * 72);

DECLARE
    network_count number(20) ;
	BEGIN
	 select count(*) into network_count from networks;
	 if (network_count = 1) then
insert into distance_times_networks ( select n.id, d.id from distance_times d, networks n) ;
commit ;
end if ;
end ;
/



commit ;

