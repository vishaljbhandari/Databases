spool nikira-DML-additional-languages.log
set feedback off ;
set serveroutput off ;
delete from languages where key != 'en' ;

--Additional Languages supported by our Client--
-- French Specific Regular Expressions
insert into languages(key,description,is_supported,writing_system) values('fr', 'French', 1,'LTR') ;
insert into regular_expressions values(14,'fr','^[^'']+[^'']+$', 'French Rule Name Regular Expression');
insert into regular_expressions values(18,'fr','^[^'']+[^'']+$', 'French Name Regular Expression');

insert into languages(key,description,is_supported,writing_system) values('pl', 'Polish', 1,'LTR') ;
insert into languages(key,description,is_supported,writing_system) values('ar', 'Arabic', 1,'RTL') ;
commit ;

