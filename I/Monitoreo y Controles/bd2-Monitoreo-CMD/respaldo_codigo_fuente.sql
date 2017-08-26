
connect system/root

SET HEADING OFF
set feedback off
set linesize 500
set pagesize 100 
spool C:\bd2\respaldo_codigo_out.sql

select 
decode(line, 1, '/' || chr(10) || 'create or replace ', '') || text codigo
from dba_source
where owner = 'SYSTEM'
and name in ('FUN_SUMAR', 'PRC_NADA')
ORDER BY OWNER, NAME, LINE ASC;

select '/'
from dual;

spool off

-- host "C:\Program Files (x86)\Notepad++\notepad++" C:\bd2\respaldo_codigo_fuente.sql


exit