spool nikira-DML-field-categories-gprs.log
set feedback off ;
set serveroutput off ;

--***************** translations for GPRS Record Type *****************--
insert into translation_indices (id, description) values (100,'GPRS Record Type') ;


insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 100, '0', 'Invalid') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 100, '1', 'Outgoing') ;
insert into translations(id, tr_id, key, value) values (translations_seq.nextval, 100, '2', 'Incoming') ;

commit ;

