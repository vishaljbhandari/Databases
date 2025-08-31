spool nikira-DML-favorites.log
set feedback off ;
set serveroutput off ;

insert into favorites (ID, NAME, URL) values (FAVORITES_SEQ.nextval, 'Google', 'http://www.google.co.in/') ;
insert into favorites (ID, NAME, URL) values (FAVORITES_SEQ.nextval, 'E-Paper', 'http://epaper.timesofindia.com/') ;
insert into favorites (ID, NAME, URL) values (FAVORITES_SEQ.nextval, 'Subex', 'http://www.subex.com/') ;
insert into favorites (ID, NAME, URL) values (FAVORITES_SEQ.nextval, 'Amazon', 'http://www.amazon.com/') ;
insert into favorites (ID, NAME, URL) values (FAVORITES_SEQ.nextval, 'Apple', 'http://www.apple.com/') ;

commit;
