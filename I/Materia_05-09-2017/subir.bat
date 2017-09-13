net start OracleServiceXE 1> C:\bd2\inicio.log 2> C:\bd2\inicio_error.log

echo Sube------------------------------- >> C:\bd2\bd.log
date /t >> C:\bd2\bd.log
time /t >> C:\bd2\bd.log
echo Log :
type C:\bd2\inicio.log >> C:\bd2\bd.log
echo Error :
type C:\bd2\inicio_error.log >> C:\bd2\bd.log
echo ------------------------------- >> C:\bd2\bd.log
del C:\bd2\inicio.log
del C:\bd2\inicio_error.log