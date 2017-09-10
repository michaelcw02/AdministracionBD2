echo off
(
    set /p var1=
) < C:\CHEN\config.ini

SET VAR01=%var1:~20,100%

imp parfile=C:\CHEN\OptRecuperaciones\imp_tab1_from_user_to_user2.par

START %VAR01% C:\CHEN\OptRecuperaciones\logs\imp_tab1_from_user_to_user2.log

START C:\CHEN\OptRecuperaciones\check_restore.bat

EXIT