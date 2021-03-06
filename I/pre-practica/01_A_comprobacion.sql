conn system/root

set linesize 250
set pagesize 100 

spool C:\bd2\pre-practica\logs\01_A_comprobacion.log append

PROMPT OBJECTS IN OWNERS
SELECT OWNER, COUNT(*)
FROM    DBA_OBJECTS
WHERE   OWNER IN ('SYSTEM', 'SYSTEM2')
GROUP BY OWNER;

PROMPT TABLE NAMES
SELECT  OWNER OWN, TABLE_NAME
FROM    DBA_TABLES
WHERE   OWNER IN ('SYSTEM', 'SYSTEM2')
ORDER BY 1;

SELECT COUNT(*) SYSTEM_EMPLOYEES_ROWS
FROM SYSTEM.EMPLOYEES;

SELECT COUNT(*) SYSTEM2_EMPLOYEES_ROWS
FROM SYSTEM2.EMPLOYEES;

spool off
exit