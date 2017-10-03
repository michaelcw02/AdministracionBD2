conn system/root
spool C:\bd2\ejecuta_borrar.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
select 'conn system/root' 
from dual;

select 'spool C:\bd2\ejecuta_borrar.log' from dual;

select 'DROP table &2'||'.'||table_name||';'||chr(10)
from   dba_tables 
where  owner='&2' 
order by table_name; 

select 'spool off' from dual; 

select 'host pause' from dual;

select 'exit' 
from dual;

spool off;

set feedback on
set termout on
exit
































