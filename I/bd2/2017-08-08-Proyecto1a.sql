--Avance #1--
host cls


 
prompt CONECTADO CON SYSTEM 
conn system/root

prompt DROP USER PROYECTO
drop user proyecto cascade;

--CREATE USER
create user proyecto identified by pro1234;

grant dba to proyecto;

conn proyecto/pro1234;

--CREATE TABLES--
prompt CREACION DE TABLAS

create table INSTRUCTORES(
cedula 		number,
nombre 		varchar2(20) not null,
apellidos 	varchar2(25) not null, 
genero 		varchar(1) not null,
edad 		number not null);

create table CLIENTES(
cedula_Cliente 		number,
nombre 				varchar2(20) not null,
apellidos 			varchar2(25) not null, 
genero 				varchar2(1) not null,
edad 				number not null,
estado 				varchar2(2) not null,
peso 				number not null,
unidad_peso 		varchar2(2) not null,
instructor 			number not null,
matricula 			number not null,
fecha_incripcion	date not null,
fecha_vencimiento 	date not null);


--PK--
prompt LLAVES PRIMARIAS

alter table INSTRUCTORES add constraint instructor_pk primary key(cedula);


alter table CLIENTES add constraint cliente_pk primary key(cedula_Cliente);


--FK--
prompt LLAVES FORANEAS

alter table CLIENTES add constraint cliente_fk01 foreign key (instructor) references INSTRUCTORES;


--CK--
prompt CHECK CONSTRAINTS

alter table CLIENTES add constraint cliente_ck01 check (genero in ('M','F'));

alter table CLIENTES add constraint cliente_ck04 check(edad > 13);

alter table INSTRUCTORES add constraint instructor_ck01 check (genero in('M','F'));

alter table INSTRUCTORES add constraint instructor_ck02 check(edad > 19);

