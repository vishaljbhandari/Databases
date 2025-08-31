spool SOURCE.log

update SOURCE set description = 'Suspect Subscriber eFingerprints' where id = '59' and description = 'Suspect eFingerprints' ;

----delete from SOURCE where  id = '59' and description = 'Suspect eFingerprints' ;
---------------------------insert statements ---------------
insert into SOURCE(id,description) values ('103','Suspect Account eFingerprints');

----insert into SOURCE(id,description) values ('59','Suspect Subscriber eFingerprints');
spool off ;
