

-- Function vs Procedure 

-- Stored Procedures 3 types (Procedure, Function, Package)  Compiled   
-- Compile one time, execute many times 


-- Procedure
execute procedure_name(); 
-- or 
begin 
    execute procedure_name();
end; 

-- Function  retruns a single value or collection 
select func_name from dual ; 


-- create omne backup table 

create table employees_bkp as select * from employees where salary > 10000; 

select * from employees_bkp ;

create or replace procedure cal_new_sal(emp_id_in IN number, comm_pct_in number, new_sal out number)
as 
begin
if emp_id_in is null then 
return ; 
end if;
    update employees_bkp set salary = salary + (salary*comm_pct_in) where employee_id = emp_id_in
    returning salary into new_sal;
end;

select * from employees_bkp where employee_id = 102;

declare 
    x number; 
begin
    cal_new_sal(NULL,0.1,x);
    dbms_output.put_line(x);
end;



create or replace procedure proc1
as 

begin 
dbms_output.put_line('Welcome to procedure1;');
dbms_output.put_line('Welcome to procedure2;');
return;
dbms_output.put_line('Welcome to procedure2;');
end ; 


exec proc1; 

-- function 

create or replace function addition_ (num1 number, num2 number) return number 
as 
    add1 number;
begin 
    add1:= num1 + num2;
    return add1;
end; 


select addition_(1234.5, 5678.8) from dual ;


create or replace function welcome return varchar2
as 
pragma autonomous_transaction;  -- child transaction 
begin 
    update employees_bkp set salary = salary+100; 
    commit; -- 
    return 'Welcome to plsql function';
end; 

select welcome from dual; 

select * from employees_bkp; 



create or replace function function_ddl return number 
as 
pragma autonomous_transaction;
begin 
    execute immediate 'create table customer1 (cust_id number)'; 
    execute immediate 'drop table customer1';
    commit;
    return 10;
end; 

select function_ddl from dual; 



create or replace package sample_package as 
procedure procedure1;
procedure procedure2;
end; 


create or replace package body sample_package as 

    -- private procedure 
    procedure procedure3 as 
        begin 
            dbms_output.put_line('This is procedure 3 - Public procedure');
        end;

    procedure procedure1 as 
        begin 
            dbms_output.put_line('This is procedure 1 - Public procedure');
        end;
    
    procedure procedure2 as
        begin 
         dbms_output.put_line('This is procedure 2 - Public procedure');
        end;
end; 


exec  sample_package.procedure2; 


