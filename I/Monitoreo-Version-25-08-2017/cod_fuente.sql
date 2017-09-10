--Si corren este script va a generar error en la primera linea pero luego crea todos los procedimientos
--y funciones que respaldó.
conn system/root
set linesize 100
set heading off
set feedback off
spool C:\bd2\cod_fuente_out.sql
select 
decode(line,1,'/'||chr(10)||'create or replace ','')||text codigo
from   dba_source
where owner ='SYSTEM'
and name in ('FUN_SUMAR','PRC_NADA')
order by owner, name, line;
select '/'
from dual;
spool off


exit






