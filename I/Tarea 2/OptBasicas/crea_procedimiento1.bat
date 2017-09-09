rem crea_procedimiento1
echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

sqlplus /nolog @C:\CHEN\OptBasicas\crea_procedimiento1.sql
START %VAR01% C:\CHEN\OptBasicas\logs\crea_procedimiento1.log

EXIT