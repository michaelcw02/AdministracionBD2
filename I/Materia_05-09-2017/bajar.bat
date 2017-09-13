net stop OracleServiceXE  1> C:\bd2\final.log 2> C:\bd2\final_error.log

echo Baja------------------------------- >> C:\bd2\bd.log
date /t >> C:\bd2\bd.log
time /t >> C:\bd2\bd.log
echo Log :
type C:\bd2\final.log >> C:\bd2\bd.log
echo Error :
type C:\bd2\final_error.log >> C:\bd2\bd.log
echo ------------------------------- >> C:\bd2\bd.log
del C:\bd2\final.log
del C:\bd2\final_error.log