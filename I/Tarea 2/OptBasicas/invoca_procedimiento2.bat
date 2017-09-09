rem invoca_procedimiento2
echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

sqlplus /nolog @C:\CHEN\OptBasicas\invoca_procedimiento2.sql
START %VAR01% C:\CHEN\OptBasicas\logs\invoca_procedimiento2.log

EXIT