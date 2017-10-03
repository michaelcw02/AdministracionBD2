connect system/root

spool C:\bd2\Droppear_funciones.sql
set pagesize 0
set linesize 300
set feedback off
set termout off
SET VERIFY OFF

--ESTO AYUDA PARA QUE DESDE EL SPOOL QUE SE GENERA PUEDA CONECTARSE A LA BD
SELECT 'CONNECT sistema/sistema;'
FROM DUAL;

select 'drop function fun_'||table_name||';'
from   dba_tables
where  owner='SISTEMA'
and    table_name like '&1%'
order by table_name;

select 'host pause'
from dual;

select 'exit'
from dual;

spool off;

set feedback on
set termout on
exit