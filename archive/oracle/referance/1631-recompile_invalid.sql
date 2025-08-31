DECLARE
BEGIN
    FOR crec IN (SELECT object_name, object_type,
                        DECODE(object_type, 'FUNCTION',       1,
                                            'PROCEDURE',      2,
                                            'TRIGGER',        3,
                                            'VIEW',           4,
                                            'PACKAGE',        5,
                                            'PACKAGE BODY',   6,
                                                              9) object_type_seq
                   FROM user_objects
                  WHERE status ='INVALID'
                    AND object_type IN ('FUNCTION', 'PACKAGE', 'PACKAGE BODY', 'PROCEDURE',
                                        'TRIGGER', 'VIEW')
                  ORDER BY object_type_seq, object_type, created)
    LOOP
       BEGIN

           IF (crec.object_type = 'PACKAGE BODY') THEN

             EXECUTE IMMEDIATE 'ALTER PACKAGE ' ||
                             crec.object_name || ' compile body';
           ELSE
             EXECUTE IMMEDIATE 'ALTER ' || crec.object_type || ' ' ||
                             crec.object_name || ' compile';
           END IF;
       END;
    END LOOP;

END;
/


