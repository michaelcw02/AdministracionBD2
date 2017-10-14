conn system/root
spool C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\iniciar0.log
drop user sistema cascade;
create user sistema identified by sistema;
grant dba to sistema;
conn sistema/sistema
prompt Tablas de planillas: PLA
create table PLA01(a number);
create table PLA02(a number);
create table PLA03(a number);
create table PLA04(a number);
create table PLA05(a number);
prompt Tablas de Conta     CON
create table CON01(a number);
create table CON02(a number);
create table CON03(a number);
prompt Inserts
insert into PLA01(a) values (1);
insert into PLA01(a) values (2);
insert into PLA01(a) values (3);
insert into CON01(a) values (1);
insert into CON01(a) values (2);
insert into CON01(a) values (3);
insert into CON01(a) values (4);
insert into CON01(a) values (5);
commit;
spool off
exit