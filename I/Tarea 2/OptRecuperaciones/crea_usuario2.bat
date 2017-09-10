REM crea_usuario2.bat
echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

sqlplus /nolog @C:\CHEN\OptRecuperaciones\crea_usuario2.sql
START %VAR01% C:\CHEN\OptRecuperaciones\logs\crea_usuario2.log

EXIT