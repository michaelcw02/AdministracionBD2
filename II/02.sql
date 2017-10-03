conn system/root

drop user sistema cascade;

create user sistema identified by sistema;
grant dba to sistema;

--tablas de planillas: PLA

create table PLA01(A NUMBER);
create table PLA02(A NUMBER);
create table PLA03(A NUMBER);

--tablas de conta: CON
create table CON01(A NUMBER);
create table CON02(A NUMBER);
create table CON03(A NUMBER);