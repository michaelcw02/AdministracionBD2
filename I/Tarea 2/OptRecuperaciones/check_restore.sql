conn system/root

set linesize 250
set pagesize 100 

spool C:\CHEN\OptRecuperaciones\logs\check_restore.log

PROMPT OBJECTS IN OWNERS
SELECT OWNER, COUNT(*)
FROM    DBA_OBJECTS
WHERE   OWNER IN ('CHEN', 'CHEN2')
GROUP BY OWNER;

PROMPT TABLE NAMES
SELECT  OWNER OWN, TABLE_NAME
FROM    DBA_TABLES
WHERE   OWNER IN ('CHEN', 'CHEN2')
ORDER BY 1;

spool off
exit