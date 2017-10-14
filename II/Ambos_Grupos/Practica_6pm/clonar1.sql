conn system/root
set verify off

drop user &2 cascade;
create user &2 identified by &3;
grant dba to &2;

exit