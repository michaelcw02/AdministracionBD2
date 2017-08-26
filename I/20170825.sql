connect system/root

create or replace function fun_sumar(PNum1 in number, PNum2 in number)
return number is 
begin 
    return (PNum1 + PNum2);
end fun_sumar;
/

create or replace procedure prc_nada is 
begin 
	null
end prc_nada;
/