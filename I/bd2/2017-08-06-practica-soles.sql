spool 20170801-practica-roles.log

PROMPT PRACTICA

HOST CLS
CONNECT system/root

--DROP ALL ROLES
DROP ROLE ROLE_CONNECT;

DROP ROLE  EMP_BASIC;
DROP ROLE  EMP_CHIEF;
DROP ROLE  EMP_ADMIN;

DROP ROLE MAS_BASIC;
DROP ROLE MAS_CHIEF;
DROP ROLE MAS_ADMIN;

--DROP ALL USERS
DROP USER JOHN CASCADE;
DROP USER JIRA CASCADE;
DROP USER JOSE CASCADE;

--CREATE ROLES & RULES 
CREATE ROLE ROLE_CONNECT;
GRANT CREATE ROLE       TO ROLE_CONNECT;
GRANT CREATE SESSION    TO ROLE_CONNECT;
GRANT CREATE TABLE      TO ROLE_CONNECT;

--CREATE USERS
CREATE USER JOHN IDENTIFIED BY 123;
CREATE USER JIRA IDENTIFIED BY 123;
CREATE USER JOSE IDENTIFIED BY 123;

--QUOTA, THIS IS FOR 'PRINCIPAL' USERS, MEANING, THE ONES THAT ARE GONNA CREATE TABLES.
ALTER USER JOHN QUOTA UNLIMITED ON SYSTEM;
ALTER USER JIRA QUOTA UNLIMITED ON SYSTEM;

--GRANT ROLES TO USERS
GRANT ROLE_CONNECT TO JOHN;
GRANT ROLE_CONNECT TO JIRA;

--NORMAL USE OF EACH USER
PROMPT USER: JOHN
CONNECT JOHN/123

--CREATE TABLES
CREATE TABLE EMPLEADOS(ID NUMBER, NAME VARCHAR2(30));
--CREATE SUB ROLES & ROLES
CREATE ROLE  EMP_BASIC;
CREATE ROLE  EMP_CHIEF;
CREATE ROLE  EMP_ADMIN;

GRANT SELECT            ON JOHN.EMPLEADOS TO EMP_BASIC;
GRANT INSERT            ON JOHN.EMPLEADOS TO EMP_CHIEF;
GRANT UPDATE, DELETE    ON JOHN.EMPLEADOS TO EMP_ADMIN;

GRANT ROLE_CONNECT  TO EMP_BASIC;
GRANT EMP_BASIC     TO EMP_CHIEF;
GRANT EMP_CHIEF     TO EMP_ADMIN;

--GRANT ROLES TO DIFFERENT USERS
GRANT EMP_CHIEF TO JIRA;

--TABLES OPERATIONS
INSERT INTO EMPLEADOS VALUES(1, 'JOHN');
INSERT INTO EMPLEADOS VALUES(2, 'JIRA');
INSERT INTO EMPLEADOS VALUES(3, 'JOSE');

SELECT * FROM EMPLEADOS;

PROMPT USER: JIRA
CONNECT JIRA/123

--DOING OPERATIONS INTO FOREIGN TABLES
INSERT INTO JOHN.EMPLEADOS VALUES (4, 'MIKE');
INSERT INTO JOHN.EMPLEADOS VALUES (5, 'CHEN');

SELECT * FROM JOHN.EMPLEADOS;

--THESE ONES SHOULD HAVE ERRORS
PROMPT INSUFICIENT PRIVILEDGES FOR JIRA INTO JOHN.EMPLEADOS
UPDATE JOHN.EMPLEADOS SET NAME = 'SARA' WHERE ID = 5;
DELETE JOHN.EMPLEADOS WHERE ID = 3;

--OWN OPERATIONS FOR JIRA
CREATE TABLE MASCOTAS(ID NUMBER, NAME VARCHAR2(30));

CREATE ROLE MAS_BASIC;
CREATE ROLE MAS_CHIEF;
CREATE ROLE MAS_ADMIN;

GRANT SELECT            ON JIRA.MASCOTAS TO MAS_BASIC;
GRANT INSERT            ON JIRA.MASCOTAS TO MAS_CHIEF;
GRANT UPDATE, DELETE    ON JIRA.MASCOTAS TO MAS_ADMIN;

GRANT ROLE_CONNECT  TO MAS_BASIC;
GRANT MAS_BASIC     TO MAS_CHIEF;
GRANT MAS_CHIEF     TO MAS_ADMIN;

INSERT INTO MASCOTAS VALUES(1, 'FIRULAYS');
INSERT INTO MASCOTAS VALUES(2, 'RAMBO');
INSERT INTO MASCOTAS VALUES(3, 'FOFO');

GRANT MAS_ADMIN TO JOSE;

PROMPT USER: JOSE
CONNECT JOSE/123

--DOING OPERATIONS INTO FOREIGN TABLES
INSERT INTO JIRA.EMPLEADOS VALUES (4, 'MISSINGO');
INSERT INTO JIRA.EMPLEADOS VALUES (5, 'DOGOPUTO');

SELECT * FROM JIRA.EMPLEADOS;

UPDATE JIRA.EMPLEADOS SET NAME = 'SUNRA' WHERE ID = 5;
DELETE JIRA.EMPLEADOS WHERE ID = 3;

SELECT * FROM JIRA.EMPLEADOS;

spool off