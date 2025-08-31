spool nikira-DML-field-categories-statistical.log
set feedback off ;
set serveroutput off ;

----Translation for Function in Statistical Rule Elements --------------
insert into translation_indices (id, DESCRIPTION, IS_DYNAMIC) values (154, 'Statistical Rule Element Functions', 0 ) ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 154, '-176', 'select id as Key, name as Value from pseudo_functions where category like ''%PROFILE_FIELD%''' ) ;
commit ;

