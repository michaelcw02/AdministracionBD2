conn system/root

set linesize 250
set pagesize 100 

spool C:\bd2\pre-practica\logs\01_A.log append
PROMPT BORRAR Y CREAR USUARIO (HR5)

DROP USER hr5 CASCADE;
CREATE USER hr5 IDENTIFIED BY root;
--
GRANT DBA TO hr5;



spool off
exit