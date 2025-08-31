delete from languages where key != 'en' ;

--Additional Languages supported by our Client--
insert into languages(key,description,is_supported,writing_system) values('pl', 'Polish', 1,'LTR') ;
insert into languages(key,description,is_supported,writing_system) values('ar', 'Arabic', 1,'RTL') ;
insert into languages(key,description,is_supported,writing_system) values('fr', 'French', 1,'LTR') ;

commit;
