
-- Session 18 : Pragma Autonomous Transaction  , rollback , commit 


create table customer4 (cust_id number(8), cust_name varchar2(30));

insert into customer4 values (1000, 'Arun'); 
insert into customer4 values (1001, 'Tom'); 
insert into customer4 values (1002, 'John'); 
insert into customer4 values (1003, 'Jame'); 

commit; 

rollback;

select * from customer4; 

-- Savepoint 
create table customer5 (cust_id number(8), cust_name varchar2(30));

insert into customer5 values (1000, 'Arun'); 
savepoint a;

insert into customer5 values (1001, 'Tom'); 
savepoint b;

insert into customer5 values (1002, 'John'); 
savepoint c;

insert into customer5 values (1003, 'Jame'); 
savepoint d;

rollback to a;

commit; 

rollback;

select * from customer5; 



-- Pragma Autonomous Transaction 

create table customer6 (cust_id number);

insert into customer6 values(1000);
insert into customer6 values(1001);

select * from customer6;

declare 
    pragma autonomous_transaction;   -- child transaction 
begin 
 for i in 1003..1010 loop
     insert into customer6 values(i); 
 end loop;
commit; --rollback;
end; 

rollback;



-- another example 

create or replace procedure proc_auto
is PRAGMA autonomous_transaction;
begin
insert into customer6 values(10001);
commit;
end;

exec proc_auto; 

select * from customer6; 

delete from customer6 ; 
commit;

begin
insert into customer6 values(10000);
proc_auto();
rollback; --commit; -- explicitly committed or rolled back
end;



create table test (no1 number(3), no2 number(3)); 

insert into test values (1,2); 

declare 
pragma autonomous_transaction;
begin 
    insert into test values(3,4);
    commit; -- rollback
end; 

insert into test values(5,6);

rollback;
 
 select * from test; 


