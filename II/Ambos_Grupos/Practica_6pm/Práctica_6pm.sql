Práctica 6pm
------------

1) La clave del usuario destino, capturarla como parámetro
y usarla al momento de crearlo.  2minutos.

2) Que el script dinámico 
ejecuta_clonar1.sql
genere un spool
ejecuta_clonar1.log

3) 10 puntos de quiz.... Esteban Mercado
Que el usuario destino clone las tablas, 
pero agregue el SUFIJO _TAB

SISTEMA.CON01
HUGO.CON01_TAB

4) 25 puntos. quiz ... Nikol
Luego de crear las tablas en el usuario destino
que esta con pausa
crear otro script clonar3.sql
que dropee todas las tablas del usuario destino. CON PAUSA.
y enviar todo a script ejecuta_borrar.sql
y ejecuta_borrar.log
y modificar el .BAT

5) 25 puntos de quiz. Emanuel Mena.  // tarea moral
cambiar la captura de los 3 parametros
por un archivo con 3 parametros .INI
que sea leidos.

6) 30 puntos. Esteban.
Y que los cree y luego los dropee en un solo .SQL
A partir de las tablas creadas en el usuario destino.
que system cree un sinonimo publico
Ej: HUGO.CON01  el sinonimo se debe crear con un prefijo
que lo capture por pantalla
Ej:
Captura Prefijo para sinonimo publico:   S1_
Sinonimo publico:
drop public synonym S1_CON1;
drop ....

create public synonym S1_CON1 FOR HUGO.CON01;
create ....































