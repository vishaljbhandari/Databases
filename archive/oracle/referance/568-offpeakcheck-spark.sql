CREATE OR REPLACE FUNCTION OffpeakCheck(from_value IN VARCHAR2, to_value IN VARCHAR2, time_stamp IN TIMESTAMP) RETURN varchar2                               
IS                                                                                                                                                           
    output      varchar2(5) := 'true' ;                                                                                                                     
	temp 		varchar2(5) := to_char(time_stamp,'hh24mi') ;
BEGIN                                                                                                                                                        
    if from_value < to_value and (temp BETWEEN from_value AND to_value) then
        output := 'true' ;
    elsif from_value > to_value and ((temp BETWEEN from_value and '2359') or (temp BETWEEN '0000' and to_value)) then 
        output := 'true' ;                                         
    else                                                                                                              
        output := 'false' ;  
    end if ;   
    return output ; 
END OffpeakCheck ;  
/
