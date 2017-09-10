--
conn system/root

prompt crear y borrar usuario
drop user test cascade;

create user test identified by test;

--
grant dba to test;

exit
