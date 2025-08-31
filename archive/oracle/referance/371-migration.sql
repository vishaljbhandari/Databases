set feedback on ;
set serveroutput on ;
spool migration.log ;

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE VPMN_PRS_MAP' ;
  EXCEPTION
     WHEN OTHERS THEN NULL ;
END ;
/

CREATE TABLE VPMN_PRS_MAP
(
    VPMN                     VARCHAR2(64),
    VALUE                    VARCHAR2(100)
) ;

delete from table_names where NAME = 'vpmn_prs_map' ;

insert into table_names(ID,NAME,DESCRIPTION,CONTROL_FILE,SCRIPT_NAME) values (table_names_seq.nextval,'vpmn_prs_map','VPMN PRS List','vpmn_prs_map.ctl','default_loader.sh');

-- ATE processor Entries 
delete from configurations where config_key in ('ATE_STANDALONE_MAX_INSTANCES', 'ATE_MAX_INSTANCES', 'ATE_TRANSACTION_RECORD_COUNT') ;

insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ATE_STANDALONE_MAX_INSTANCES','4');
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ATE_MAX_INSTANCES','4');
insert into configurations(id, config_key, value) values(configurations_seq.nextval,'ATE_TRANSACTION_RECORD_COUNT','500');


@ highriskdestination_summary_procedure.sql ;

@ additional_migration.sql ;

spool off ;
commit;
quit ;
