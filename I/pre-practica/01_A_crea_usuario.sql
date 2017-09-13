conn system/root

set linesize 250
set pagesize 100 

spool C:\bd2\pre-practica\logs\01_A.log
PROMPT BORRAR Y CREAR USUARIO NUEVO

DROP USER system2 CASCADE;
CREATE USER system2 IDENTIFIED BY root;
--
GRANT DBA TO system2;



spool off
exit