create or replace procedure DropAlarmSeqTbls
as
begin
    for tbl in (select TABLE_NAME from user_tables where TABLE_NAME like 'TMP_ALARM_SEQ_%')
    loop
        execute immediate 'drop table '||tbl.TABLE_NAME;
    end loop;
end DropAlarmSeqTbls;
/
exec DropAlarmSeqTbls;

