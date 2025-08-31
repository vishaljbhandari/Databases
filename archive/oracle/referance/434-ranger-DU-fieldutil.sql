set feedback off
spool ranger-DU-fieldutil.log
CREATE OR REPlACE PACKAGE BODY FieldUtil AS
    FUNCTION encode(input IN VARCHAR2) RETURN VARCHAR2
    IS
    BEGIN
        return input ;
    END encode ;

    FUNCTION decode(input IN VARCHAR2) RETURN VARCHAR2
    IS
    BEGIN
        return input ;
    END decode ;

    FUNCTION normalize(input IN VARCHAR2) RETURN VARCHAR2
    IS
    BEGIN
        return input ;
    END normalize ;

    FUNCTION mask(input IN VARCHAR2, mask_positions IN VARCHAR2) RETURN VARCHAR2
    IS
    BEGIN
        return input ;
    END mask ;

end FieldUtil ;
/
show err;

spool off;
quit;
