MKDIR C:\CHEN
MKDIR C:\CHEN\OptBasicas
MKDIR C:\CHEN\OptRespaldo
MKDIR C:\CHEN\OptRecuperaciones
MKDIR C:\CHEN\OptBasicas\logs\
MKDIR C:\CHEN\OptRespaldo\logs\
MKDIR C:\CHEN\OptRespaldo\respaldos\
MKDIR C:\CHEN\OptRecuperaciones\logs\

COPY *.* C:\CHEN\
COPY .\OptBasicas\*.*  C:\CHEN\OptBasicas
COPY .\OptRespaldo\*.* C:\CHEN\OptRespaldo
COPY .\OptRecuperaciones\*.* C:\CHEN\OptRecuperaciones