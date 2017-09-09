MKDIR C:\CHEN
MKDIR C:\CHEN\OptBasicas
MKDIR C:\CHEN\OptRespaldo
MKDIR C:\CHEN\OptRecuperaciones

COPY *.* C:\CHEN\
COPY .\OptBasicas\*.*  C:\CHEN\OptBasicas
COPY .\OptBasicas\*.*  C:\CHEN\OptBasicas\logs
COPY .\OptRespaldo\*.* C:\CHEN\OptRespaldo
COPY .\OptRespaldo\*.* C:\CHEN\OptRespaldo\logs
COPY .\OptRecuperaciones\*.* C:\CHEN\OptRecuperaciones
COPY .\OptRecuperaciones\*.* C:\CHEN\OptRecuperaciones\respaldos
COPY .\OptRecuperaciones\*.* C:\CHEN\OptRecuperaciones\logs