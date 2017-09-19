conn system/root

set linesize 250
set pagesize 100 

spool C:\bd2\pre-practica\logs\01_A.log append
PROMPT BORRAR Y CREAR USUARIO (SYSTEM3)

DROP USER system3 CASCADE;
CREATE USER system3 IDENTIFIED BY root;
--
GRANT DBA TO system3;



spool off
exit