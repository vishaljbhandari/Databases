spool nikira-DML-field-categories-nrtrde.log
set feedback off ;
set serveroutput off ;


update field_categories set category='AGGREGATION_TYPE NEGATIVE_RULE_AGG_TYPE NICKNAME HOTLIST MANUAL_ALARM HOT_KEY' where id=200 ;
insert into field_categories(id, name, category, data_type) values(4000, 'Previous VPMN Sequence ID','', '') ;
commit ;

