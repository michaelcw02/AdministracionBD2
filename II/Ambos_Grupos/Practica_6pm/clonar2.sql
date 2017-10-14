conn system/root
spool C:\bd2\ejecuta_clonar1.sql
set pagesize 0
set linesize 100
set feedback off
set termout off
set verify off
select 'conn system/root'
from dual;
select 'spool C:\bd2\ejecuta_clonar1.log'
from dual;
select 'create table &2'||'.'||table_name||' as'||chr(10)||
'select * from &1'||'.'||table_name||';'
from   dba_tables
where  owner='&1'
--and    table_name like '&1%'
order by table_name;

select 'spool off' from dual;

select 'host pause'
from dual;

select 'exit'
from dual;

spool off;

set feedback on
set termout on
exit

















