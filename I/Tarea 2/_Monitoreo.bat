@ECHO off
cls
:start
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---              Tarea 2               ---
ECHO ---      Administrador Respaldos       ---
ECHO ---           MENU PRINCIPAL           ---
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
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---              Tarea 2               ---
ECHO ---      Administrador Respaldos       ---
ECHO ---          Opciones Basicas          ---
ECHO.
ECHO  1. Borrar y crear usuario
ECHO  2. Crear dos tablas
ECHO  3. Crea procedimiento #1
ECHO  4. Crea procedimietno #2
ECHO  5. Invoca procedimiento #1
ECHO  6. Invoca procedimiento #2
ECHO  0. Volver
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptCreaUsuario
if '%choice%'=='2' goto OptCreaDosTablas
if '%choice%'=='3' goto OptCreaProcUno
if '%choice%'=='4' goto OptCreaProcDos
if '%choice%'=='5' goto OptInvcProcUno
if '%choice%'=='6' goto OptInvcProcDos
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto OptBasicas

:OptRespaldo
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---              Tarea 2               ---
ECHO ---      Administrador Respaldos       ---
ECHO ---         Opciones Respaldos         ---
ECHO.
ECHO  1. Realizar respaldo full
ECHO  2. Realizar respaldo de Usuario
ECHO  0. Volver
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptRespFull
if '%choice%'=='2' goto OptRespUsuario
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto OptRespaldo

:OptRecuperacion
cls
ECHO --- Universidad Nacional de Costa Rica ---
ECHO ---       Escuela de Informatica       ---
ECHO ---    Administracion Bases de Datos   ---
ECHO ---         Michael Chen Wang          ---
ECHO ---              Tarea 2               ---
ECHO ---      Administrador Respaldos       ---
ECHO ---      Opciones Recuperaciones       ---
ECHO.
ECHO  1. Borrar y crear usuario nuevo
ECHO  2. Recuperar respaldo de Usuario (Full)
ECHO  3. Recuperar respaldo de Usuario (Tabla 1)
ECHO  4. Recuperar respaldo de Usuario (Tabla 2)
ECHO  0. Volver
ECHO.
set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptCreaUsuarioNuevo
if '%choice%'=='2' goto OptRecuRespFull
if '%choice%'=='3' goto OptRecuRespTab1
if '%choice%'=='4' goto OptRecuRespTab2
if '%choice%'=='0' goto start
ECHO "%choice%" is not valid, try again
ECHO.
goto OptRecuperacion

:OptSalir
ECHO Sale del programa
goto end


:end