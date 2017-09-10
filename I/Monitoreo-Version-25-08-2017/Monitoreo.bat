@ECHO off
cls
:start
cls
ECHO. --Sistema de Monitoreo---
ECHO 1. Borrar y Crear Usuario
ECHO 2. Crear Tabla
ECHO 3. Borrar Tabla
ECHO 4. Monitoreo de Bloqueos
ECHO 5. Resp. Cod. Fuente
ECHO 0. Salir

set choice=
set /p choice=Indique la tarea correspondiente:
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptUsuario
if '%choice%'=='2' goto OptCreaTabla
if '%choice%'=='3' goto OptBorraTabla
if '%choice%'=='4' goto OptMonBloqueo
if '%choice%'=='5' goto OptCodFuente
if '%choice%'=='0' goto OptSalir
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:OptUsuario
start C:\bd2\crea_usuario.bat
goto start

:OptCreaTabla
start C:\bd2\crea_tabla.bat
goto start

:OptBorraTabla
start C:\bd2\borra_tabla.bat
goto start

:OptMonBloqueo
start C:\bd2\monit_bloqueos2.bat
goto start

:OptCodFuente
start C:\bd2\cod_fuente.bat
goto start

:OptSalir
ECHO Sale del programa
goto end

:end



