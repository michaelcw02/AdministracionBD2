REM crea_usuario.bat
echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

sqlplus /nolog @C:\CHEN\OptBasicas\crea_usuario.sql
START %VAR01% C:\CHEN\OptBasicas\logs\crea_usuario.log

EXIT