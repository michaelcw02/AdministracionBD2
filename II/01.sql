--Tema
--Aplicaciones avanzadas con el diccionario de datos

CREATE USER prueba01 identified by prueba1;

select username from dba_users
where username = 'PRUEBA01';

DROP USER prueba01;

select username from dba_users
where username = 'PRUEBA01';

