--duplicacion de datos
insert into padron(select * from padron where cedula = 108880888);
commit;
--puedo crear la PK?
alter table padron add constraint padron_pk primary key (cedula) 
using index tablespace PADRON_IDX;
--cómo borrar solo uno de los dos registros?
select cedula, rowid from padron where cedula = 108880888;
--borrar activemos explain plan
set autotrace on
    delete from padron where rowid = 'AAAFiVAAFAAAFiwABK';
--bloqueos // con PK.. sin PK
--genera explain plan
--delete from padron where cedula = 108880888;



--hints
--Optimizer hints can be used with SQL statements to alter execution plans. 
--Si el hint está incorrecto... se ignora!!

--hace full costo 6103
select /*+ FULL(padron) */ cedula, nombre from padron where cedula = 108880888;
--costo 3
--SI SE HACE MAL, SE IGNORA
select /*+ FULLY(padron) */ cedula, nombre from padron where cedula = 108880888;

select cedula, nombre from padron where cedula = 108880888;
--es lo mismo que lo anterior... solo que de otra forma
select /*+ NO_INDEX(padron padron_pk) */ cedula, nombre from padron where cedula = 108880888;

--forzar a que use un indice que no corresponde... PEOR!!! costo 94038
select /*+ INDEX(padron padron_pk) */ cedula, nombre from padron where nombre = 'AZZARO';


--hint con sintaxis incorrecta 
--costo 6127 TABLES ACCES FULL
select /*+ IND_EX(padron padron_pk) */ cedula, nombre from padron where nombre = 'AZZARO';

select cedula, nombre from padron where nombre = 'AZZARO';



--laboratorio
--Crear un IDX por nombre,
--Aparte otro por Apellido1,
--Otro por Apellido2
--Otro compuesto (nombre, apellido1, apellido2)

CREATE INDEX PADRON_IDX01 ON PADRON (NOMBRE) TABLESPACE PADRON_IDX;
CREATE INDEX PADRON_IDX02 ON PADRON (APELLIDO1) TABLESPACE PADRON_IDX;
CREATE INDEX PADRON_IDX03 ON PADRON (APELLIDO2) TABLESPACE PADRON_IDX;
CREATE INDEX PADRON_IDX04 ON PADRON (NOMBRE, APELLIDO1, APELLIDO2) TABLESPACE PADRON_IDX;

--HACER UNA CONSULTA COUNT(*)
--1. WHERE POR NOMBRE Y FORZAR A QUE USE EL IDX DE NOMBRE, APELLIDO1, APELLIDO2
--2. WHERE POR NOMBRE, APELLIDO1, APELLIDO2, FORZAR A QUE USE NOMBRE, LUEGO CON APELLIDO1, LUEGO CON APELLIDO2

SELECT /*+ INDEX(padron nombre, apellido1, apellido2) */ COUNT(*) FROM PADRON;
SELECT /*+ INDEX(padron nombre) */ COUNT(*) FROM PADRON;
SELECT /*+ INDEX(padron apellido1) */ COUNT(*) FROM PADRON;
SELECT /*+ INDEX(padron apellido2) */ COUNT(*) FROM PADRON;











