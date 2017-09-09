@ECHO off
cls
:start
cls
ECHO. --- Universidad Nacional de Costa Rica ---
ECHO. ---       Escuela de Informatica       ---
ECHO. ---    Administracion Bases de Datos   ---
ECHO.
ECHO  1. Opciones Basicas
ECHO  2. Opciones de Respaldo
ECHO  3. Opciones de Recuperacion
ECHO  0. Salir
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptBasicas
if '%choice%'=='2' goto OptRespaldo
if '%choice%'=='3' goto OptRecuperacion
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:OptBasicas
start C:\bd2\_SubmenuBasico.bat
goto start

:OptRespaldo
start C:\bd2\_SubmenuRecuperaciones.bat
goto start

:OptRecuperacion
start C:\bd2\_SubmenuRespaldo.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end
