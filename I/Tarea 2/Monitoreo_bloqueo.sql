connect system/root
set linesize 250
set pagesize 100 
spool C:\bd2\monitoreo_session.log
--Select de monitoreo de bloqueos:

SELECT OWNER||'.'||OBJECT_NAME "objeto",
       OS_USER_NAME "os usuario", 
       ORACLE_USERNAME "u.q. bloquea",
	   PROGRAM "programa", 
       SESSION_ID "SID",        
	   SERIAL# "Serial#"
  FROM SYS.V_$LOCKED_OBJECT A, 
       SYS.ALL_OBJECTS B, 
       SYS.V_$SESSION c 
  WHERE A.OBJECT_ID = B.OBJECT_ID 
		AND C.SID = A.SESSION_ID;

   

spool off

host "C:\Program Files (x86)\Notepad++\notepad++" C:\bd2\monitoreo_session.log

exit