spool AUDIT_LOG_EVENT_CODES.log

---------------------------insert statements ---------------
insert into AUDIT_LOG_EVENT_CODES(action,id,description,source_id) values ('Account Suspect eFingerprint for Account ''$1'' added',1023,'Account Suspect eFingerprint(s) Added',103);
---------------------------insert statements ---------------
insert into AUDIT_LOG_EVENT_CODES(action,id,description,source_id) values ('Account Suspect eFingerprint for Account ''$1'' deleted',1024,'Account Suspect eFingerprint(s) Deleted',103);
spool off ;
