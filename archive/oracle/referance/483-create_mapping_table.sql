spool create_mapping_table.log

DROP TABLE EVENT_RULE_MAP ;
CREATE TABLE EVENT_RULE_MAP (
    EVENT_INSTANCE_ID      	NUMBER(20, 0)    NOT NULL,
    RULE_KEY          		NUMBER(20, 0)    NOT NULL) ;


spool off ;
quit ;
