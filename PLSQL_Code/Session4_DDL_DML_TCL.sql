


select * from clients; 


begin 
insert into clients (ID, NAME, AGE, ADDRESS, SALARY) 
values (3, 'James', 55 , 'Moon', 80000); 
commit;
end; 
/



  CREATE TABLE "HR"."CLIENTS1" 
   (	"ID" NUMBER(*,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"AGE" NUMBER(*,0) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(150 BYTE), 
	"SALARY" NUMBER(18,2), 
	 PRIMARY KEY ("ID"));


select * from clients1;  -- empty


begin 
insert into clients1 
select ID, NAME, AGE, ADDRESS, SALARY from clients;
commit;
end; 
/


-- update
begin 
update clients1 
set ADDRESS = 'Somewhere...';
--commit;
end; 
/

rollback; 

select * from clients1;