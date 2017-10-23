--Ejercicios 20-10-2017

--Es ineficiente transformar la columna de la tabla, 
--porque de esta manera va a tener que ir por toda la tabla a buscar, AUNQUE SEA EL INDICE
--Table Access Full sin indice: 6116
--Con indice: 2465
select count(*)
from   mineria.padron
where lower(nombre) = lower('MARIA');

--Table Access Full sin indice: 6114
--Con indice: 3 
select count(*)
from   mineria.padron
where nombre = 'MARIA';

COLUMN APELLIDO1 FORMAT A30
COLUMN APELLIDO2 FORMAT A30
COLUMN NOMBRE    FORMAT A30
COLUMN ID        FORMAT A10
COLUMN OPERATION FORMAT A30


--Costo sin indice: 6100
--Costo con indice:    3
select rowid, cedula, nombre
from mineria.padron
where cedula = 108880888;

--Costo sin indice en la siguiente consulta es: 1. Esto por utilizar el row id de la consulta de arriba
select rowid, cedula, nombre
from mineria.padron
where rowid='AAAFeNAAFAAABEoAAh';

--
SELECT NOMBRE, COUNT(*) CANT
FROM   MINERIA.PADRON
GROUP BY NOMBRE
HAVING COUNT(*) > 7000
ORDER BY 2 DESC;

desc padron
--sin indice: 6268
--con indice: 2222
SELECT APELLIDO1, COUNT(*) CANT
FROM   MINERIA.PADRON
GROUP BY APELLIDO1
HAVING COUNT(*) > 7000
ORDER BY 2 DESC;

create index padron_idx01 on padron (NOMBRE) tablespace PADRON_IDX;
create index padron_idx02 on padron (APELLIDO1) tablespace PADRON_IDX;


--
SELECT NOMBRE, COUNT(*) CANT
FROM   MINERIA.PADRON
GROUP BY NOMBRE
HAVING COUNT(*) > 7000
ORDER BY 2 DESC;

--
select count(*)
from   mineria.padron
where lower(nombre) = lower('MARIA');

--
select count(*)
from   mineria.padron
where nombre = 'MARIA';

-- 3
select rowid, cedula, nombre
from mineria.padron
where cedula = 108880888;


-- 6108
select rowid, cedula, nombre
from mineria.padron
where to_char(cedula) = '108880888';


-- 3, va a ser igual porque se va a castear primero
select rowid, cedula, nombre
from mineria.padron
where cedula = to_number('108880888');

-- 3 igual porque se castea, pero no es buena practica por que aceptaria letras y daria error
select rowid, cedula, nombre
from mineria.padron
where cedula = '108880888';


--
--

--
--

--
SELECT NOMBRE FROM (
SELECT NOMBRE, COUNT(*) CANT
FROM   MINERIA.PADRON
GROUP BY NOMBRE
HAVING COUNT(*) = 1
)
WHERE NOMBRE LIKE 'A%' and length(NOMBRE) = 6;

--
SELECT NOMBRE FROM (
SELECT NOMBRE, COUNT(*) CANT
FROM   MINERIA.PADRON
GROUP BY NOMBRE
HAVING COUNT(*) = 1
)
WHERE NOMBRE LIKE 'A%' and length(NOMBRE) = 6
order by nombre desc;

--
select nombre||' '||apellido1||' '||apellido2 nom
from   mineria.padron
where  nombre = apellido1;

--
create index padron_idx02 on padron (apellido1) tablespace PADRON_IDX;

--
--
select nombre||' '||apellido1||' '||apellido2 nom
from   mineria.padron
where  nombre = apellido1;

--
create index padron_idx03 on padron (apellido1) tablespace PADRON_IDX;

--
create index padron_idx03 on padron (upper(apellido1)) tablespace PADRON_IDX;


--
SELECT COUNT(*)
FROM   PADRON
WHERE length(NOMBRE) = 20;


--
create index padron_idx02 on padron (length(NOMBRE)) tablespace PADRON_IDX;

