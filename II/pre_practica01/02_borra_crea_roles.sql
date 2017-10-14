conn system/root

spool C:\bd2\02_ejecuta_roles.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
SELECT 'conn system/root'||CHR(10)
    ||'spool C:\bd2\02_ejecuta_roles.log'
FROM DUAL;

SELECT 'DROP ROLE ROL_'||TABLE_NAME||'; '||CHR(10)||
       'CREATE ROLE ROL_'||TABLE_NAME||'; '||CHR(10)
FROM DBA_TABLES
WHERE OWNER = 'SISTEMA'
  AND TABLE_NAME LIKE '&1%';

SELECT 'GRANT SELECT, INSERT, UPDATE, DELETE ON '||TABLE_NAME||' TO ROL_'||TABLE_NAME||'; '||CHR(10)||
FROM DBA_TABLES
WHERE OWNER = 'SISTEMA'
  AND TABLE_NAME LIKE '&1%';

SELECT 'spool off;'||CHR(10)||'EXIT'
FROM DUAL;

spool off;

exit