spool nikira-DML-demo-services.log
set feedback off ;
set serveroutput off ;


--ranger-new-exec-demo.sql.parse.in

---***** Entries for Service table**********
delete from service ;

insert into service(id, description) values(1 , 'Incoming') ;
insert into service(id, description) values(2 , 'Local') ;
insert into service(id, description) values(4 , 'Long Distance') ;
insert into service(id, description) values(8 , 'International') ;
insert into service(id, description) values(16 , 'Trunk') ;
insert into service(id, description) values(32 , 'National Roaming') ;
insert into service(id, description) values(64 , 'International Roaming') ;

commit ;

