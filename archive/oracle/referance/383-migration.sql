set feedback on ;                                                                                                                                            
set serveroutput on ;                                                                                                                                        
spool migration.log ; 

update translations set value='select key as key, name || decode( (is_active + is_enabled) , 0 , '' (Deleted)'', 1 , '' (Disabled)'', 2 , '''','''') as value from rules r where version=(select max(version) from rules where r.key=key) and ((rule_mode in (2,3) and category is null) or (rule_mode=0 and category is null) or (rule_mode in (2,3) and category <> ''MULTIPLE_FUNCTION_CHILD_RULE'' ) ) and parent_id != 0 and id > 1024' where tr_id=201;

spool off ;                                                                                                                                                  
commit;                                                                                                                                                      
quit ;    
