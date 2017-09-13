cls
echo off
(
set /p var1=
set /p var2=
set /p var3=
) < C:\bd2\config2.ini

SET var01=%var1:~20,100%
SET var02=%var2:~20,100%
echo %var01%
echo %var02%
%var01% C:\bd2\hr.par