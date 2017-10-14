conn sistema/sistema

spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\agregar_columna.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
SELECT 'conn sistema/sistema'||CHR(10)
     ||'spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\agregar_columna.log'
FROM DUAL;

SELECT 'ALTER TABLE '||TABLE_NAME||' ADD '||'&2'||' NUMBER; '||CHR(10)
FROM DBA_TABLES
WHERE OWNER = 'SISTEMA'
  AND TABLE_NAME LIKE '%'||'&1'||'%';

SELECT 'spool off;'||CHR(10)||'EXIT'
FROM DUAL;

spool off;

exit