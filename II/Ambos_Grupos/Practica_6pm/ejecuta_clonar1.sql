conn system/root                                                                                    
spool C:\bd2\ejecuta_clonar1.log                                                                    
create table JUAN.CON01 as                                                                          
select * from SISTEMA.CON01;                                                                        
                                                                                                    
create table JUAN.CON02 as                                                                          
select * from SISTEMA.CON02;                                                                        
                                                                                                    
create table JUAN.CON03 as                                                                          
select * from SISTEMA.CON03;                                                                        
                                                                                                    
create table JUAN.PLA01 as                                                                          
select * from SISTEMA.PLA01;                                                                        
                                                                                                    
create table JUAN.PLA02 as                                                                          
select * from SISTEMA.PLA02;                                                                        
                                                                                                    
create table JUAN.PLA03 as                                                                          
select * from SISTEMA.PLA03;                                                                        
                                                                                                    
create table JUAN.PLA04 as                                                                          
select * from SISTEMA.PLA04;                                                                        
                                                                                                    
create table JUAN.PLA05 as                                                                          
select * from SISTEMA.PLA05;                                                                        
                                                                                                    
spool off                                                                                           
host pause                                                                                          
exit                                                                                                
