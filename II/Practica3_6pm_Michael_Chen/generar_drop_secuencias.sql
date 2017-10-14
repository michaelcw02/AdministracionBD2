conn sistema/sistema

spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\drop_secuencia.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
SELECT 'conn sistema/sistema'||CHR(10)
     ||'spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\drop_secuencia.log'
FROM DUAL;

SELECT 'DROP SEQUENCE '||SEQUENCE_NAME||'; '||CHR(10)
FROM DBA_SEQUENCES 
WHERE SEQUENCE_OWNER = 'SISTEMA';

SELECT 'spool off;'||CHR(10)||'EXIT'
FROM DUAL;

spool off;

exit
