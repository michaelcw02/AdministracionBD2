@ECHO off
cls
:start
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---          Pre Practica 2            ---
ECHO ---           MENU PRINCIPAL           ---
ECHO.
ECHO  1. Borra y crea tablas de SISTEMA
ECHO  2. Crea roles: (PLA o CON)
ECHO  3. Ejecuta roles
ECHO  0. Salir
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptBorraCrea
if '%choice%'=='2' goto OptRolesTabla
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:OptBorraCrea
sqlplus /nolog @C:\bd2\01_borra_crea_tablas.sql
goto start

:OptRolesTabla
set /p Val1=Escoger prefijo de tabla: 
REM CREA ROLES
sqlplus /nolog @C:\bd2\02_borra_crea_roles.sql %Val1%
sqlplus /nolog @C:\bd2\02_ejecuta_roles.sql
goto start


:OptSalir