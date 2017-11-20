MKDIR C:\bd2
MKDIR C:\bd2\Tarea3_Michael_Chen
@ECHO off
cls
:start
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---             Grupo 6pm              ---
ECHO ---              Tarea 3               ---
ECHO ---           MENU PRINCIPAL           ---
ECHO.
ECHO  1. Crea Usuario y Tablespaces
ECHO  2. Realizar import completo de padron2010
ECHO  3. Conteo de registros
ECHO  4. Mostrar log
ECHO  0. Salir
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptCreaUsuarioTablespaces
if '%choice%'=='2' goto OptImportarPadron
if '%choice%'=='3' goto OptConteoRegistro
if '%choice%'=='4' goto OptMostrarLog
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" is not valid, try again
ECHO.
goto start

REM C:\bd2\Tarea3_Michael_Chen\

:OptCreaUsuarioTablespaces
sqlplus /nolog @C:\bd2\Tarea3_Michael_Chen\Opt1.sql
ECHO ========================================================== > C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO Opcion 1 - Crear Usuario Mineria y Tablespaces >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO ========================================================== >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
type C:\bd2\Tarea3_Michael_Chen\CrearUsuarioTablespaces.log >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
del C:\bd2\Tarea3_Michael_Chen\CrearUsuarioTablespaces.log
goto start

:OptImportarPadron
imp parfile=C:\bd2\Tarea3_Michael_Chen\Opt2.par
ECHO . >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO ========================================================== >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO Opcion 2 - Realizar un import completo >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO ========================================================== >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
type C:\bd2\Tarea3_Michael_Chen\padron2010.log >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
del C:\bd2\Tarea3_Michael_Chen\padron2010.log
goto start

:OptConteoRegistro
sqlplus /nolog @C:\bd2\Tarea3_Michael_Chen\Opt3.sql
ECHO . >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO ========================================================== >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO Opcion 3 - Realizar un conteo de registros importados >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
ECHO ========================================================== >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
type C:\bd2\Tarea3_Michael_Chen\ConteoRegistro.log >> C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
del C:\bd2\Tarea3_Michael_Chen\ConteoRegistro.log

goto start

:OptMostrarLog
START notepad.exe C:\bd2\Tarea3_Michael_Chen\Tarea3_Michael_Chen.log
goto start

:OptSalir