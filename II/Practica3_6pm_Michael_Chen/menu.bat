MKDIR C:\bd2
MKDIR C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN
@ECHO off
cls
:start
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---             Grupo 6pm              ---
ECHO ---             Practica 3             ---
ECHO ---           MENU PRINCIPAL           ---
ECHO.
ECHO  1. Correr Script (iniciar0.sql)
ECHO  2. Agregar Columna a Numero de Tabla
ECHO  3. Crear Secuences con Numero de Tabla
ECHO  4. Dropear secuences
ECHO  0. Salir
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptCorreScript
if '%choice%'=='2' goto OptAgregaColum
if '%choice%'=='3' goto OptCreaSecuence
if '%choice%'=='4' goto OptDropSecuence
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" is not valid, try again
ECHO.
goto start

REM C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\

:OptCorreScript
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\iniciar0.sql
START notepad.exe C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\iniciar0.log
goto start

:OptAgregaColum
set /p Val1=Ingresar numero tabla: 
set /p Val2=Ingresar nombre columna: 
REM CREA ROLES
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\genera_agregar_columna.sql %Val1% %Val2%
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\agregar_columna.sql
START notepad.exe C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\agregar_columna.log
goto start

:OptCreaSecuence
set /p Val3=Ingresar numero tabla: 
( set /p Val4= ) < C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\config.ini
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\generar_crea_secuencias.sql %Val3% %Val4%
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\crea_secuencia.sql
START notepad.exe C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\crea_secuencia.log
goto start

:OptDropSecuence
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\generar_drop_secuencias.sql
sqlplus /nolog @C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\drop_secuencia.sql
START notepad.exe C:\bd2\PRACTICA3_6PM_MICHAEL_CHEN\drop_secuencia.log
goto start

:OptSalir