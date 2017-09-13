REM PRE-PRACTICA
REM C:\bd2\pre-practica\

echo off
(
    set /p var1=
    set /p var2=
    set /p var3=
) < C:\bd2\pre-practica\config.ini
SET NotepadPP=%var1:~20,100%
SET SevenZip=%var2:~20,100%
SET NameDate=%var3:~20,100%

REM RESPALDO FULL
exp parfile=C:\bd2\pre-practica\01_full_export.par
ECHO ========================================================== >> C:\bd2\pre-practica\logs\01_full_export.log
ECHO Paso 1 - Export Full - [TERMINADO] >> C:\bd2\pre-practica\logs\01_full_export.log
ECHO ========================================================== >> C:\bd2\pre-practica\logs\01_full_export.log
START %NotepadPP% C:\bd2\pre-practica\logs\01_full_export.log

REM A) Crear usuario system2 y restaurar todos los objetos sin registros del usuario system, hacer comprobacion
REM LOG: C:\bd2\pre-practica\logs\01_A.log

sqlplus /nolog @C:\bd2\pre-practica\01_A_crea_usuario.sql

imp parfile=C:\bd2\pre-practica\01_A_imp_full.par
type C:\bd2\pre-practica\logs\imp_from_full_to_system2.log >> C:\bd2\pre-practica\logs\01_A.log
del C:\bd2\pre-practica\logs\imp_from_full_to_system2.log

sqlplus /nolog @C:\bd2\pre-practica\01_A_comprobacion.sql
type C:\bd2\pre-practica\logs\01_A_comprobacion.log >> C:\bd2\pre-practica\logs\01_A.log
del C:\bd2\pre-practica\logs\01_A_comprobacion.log

ECHO ========================================================== >> C:\bd2\pre-practica\logs\01_A.log
ECHO Paso 1.A - CREAR USUARIO, RESTAURAR, CHECKEAR - [TERMINADO]  >> C:\bd2\pre-practica\logs\01_A.log
ECHO ========================================================== >> C:\bd2\pre-practica\logs\01_A.log

START %NotepadPP% C:\bd2\pre-practica\logs\01_A.log

REM B) Crear usuario system3 (DBA) y realizar import solo de tabla SYSTEM.HELP con todos los registos