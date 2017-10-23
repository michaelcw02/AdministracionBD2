alter table padron add constraint padron_pk primary
key (cedula)
using index tablespace PADRON_IDX;

alter table distritos add constraint distritos_pk primary key (codigo)
using index tablespace PADRON_IDX;

alter table padron add constraint padron_fk1 foreign key (codelect) references distritos;

column ubicacion format a50;
select codigo, provincia||'/'||canton||'/'||distrito ubicacion from distritos where codigo = 702001;


CREATE VIEW VW_DISTRITOS AS 
select codigo, 
       provincia||'/'||canton||'/'||distrito ubicacion 
from distritos;


create index padron_fk1_idx on padron (nombre) tablespace padron_idx;