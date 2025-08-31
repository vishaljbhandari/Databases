set feedback off

delete from rip_user ;
delete from rip_configuration ;
delete from rip_loadable_modules ;

insert into rip_user values('admin', 'su6FF4/MgjUAk') ;

insert into rip_loadable_modules (id,module,project) values (2,'datasource','revmaxclient') ;
insert into rip_loadable_modules (id,module,project) values (1,'dummy','revmaxclient') ;

commit ;
quit ;

