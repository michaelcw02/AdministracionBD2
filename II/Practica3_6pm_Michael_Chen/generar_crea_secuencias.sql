conn sistema/sistema

spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\crea_secuencia.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
SELECT 'conn sistema/sistema'||CHR(10)
     ||'spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\crea_secuencia.log'
FROM DUAL;

SELECT 'CREATE SEQUENCE '||'&2'||'_'||TABLE_NAME||' START WITH 1 INCREMENT BY 1; '||CHR(10)
FROM DBA_TABLES
WHERE OWNER = 'SISTEMA'
  AND TABLE_NAME LIKE '%'||'&1'||'%';

SELECT 'spool off;'||CHR(10)||'EXIT'
FROM DUAL;

spool off;

exit