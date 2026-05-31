

-- 1 Simple View : Instead of Trigger 
-- 2 Complex view : Instead of Trigger  
-- 3 Oracle Mutating trigger Error 



-- 1 Simple View : Instead of Trigger 
-- Instead of Trigger 

select * from employees; 

desc employees;

select * from departments;


-- creating a simple view 
create or replace view emp_v 
as select employee_id, first_name, last_name, email, hire_date, job_id 
from  employees where department_id=30;

select * from emp_v;

insert into emp_v values (300, 'Arun', 'Kumar', 'Arun@gmail.com', sysdate, 'PU_CLERK');

rollback ; 


-- 2 Complex view : Instead of Trigger 
-- Creating a complex view 
create or replace view emp_dept_v
as select e.employee_id, e.first_name, e.last_name, e.email, e.hire_Date, e.job_id, e.salary, e.department_id,
d.department_name from employees e, departments d
where e.department_id = d.ROLLBACKnt_id; 



select * from emp_dept_v;

insert into emp_dept_v values (301, 'Arun', 'James',  'Arun@gmail.com', sysdate, 'SA_REP',  50000, 20, 'Purchasing');
-- >> SQL Error: ORA-01776: cannot modify more than one base table through a join view


-- Complex view 
-- instead of trigger 
create or replace trigger tr_emp_dept_vw_instead
instead of insert on emp_dept_v
declare 
check_exist number ; 
begin

select count(*) into check_exist from departments where department_id=:new.department_id; 

if check_exist=0 then 
insert into departments (department_id, department_name) values (:new.department_id, :new.department_name);
end if;

select count(*) into check_exist from employees where employee_id=:new.employee_id;

if check_exist=0 then
insert into employees (employee_id, first_name, last_name, email, hire_date, job_id, salary, department_id)
values(:new.employee_id, :new.first_name, :new.last_name, :new.email, :new.hire_date, :new.job_id, :new.salary, :new.department_id);
end if;

end; 
-- Trigger TR_EMP_DEPT_VW_INSTEAD compiled

insert into emp_dept_v 
values (302, 'John', 'Tom', 'tom@gmail.com', sysdate, 'SA_REP', 50000, 280, 'Purchasing');
-- 1 row inserted.

select * from departments; 

select * from employees; 

rollback;  -- Rollback complete.


 
-- 3 Oracle Mutating trigger Error 

drop table customer1;
drop table customer2; 

create table customer1
(
    cust_id number, 
    cust_name varchar2(100)
);

create table customer2
(
    cust_id number, 
    cust_name varchar2(100)
);



select * from customer1 ; 

insert into customer1 values (200, 'NIC IT Academy');

commit; 

create or replace trigger mutate_trigger 
after insert on customer2
for each row
begin 
    update customer1 set cust_id = (select max(cust_id) from customer2);
end; 

insert into customer2 values (100, 'NIC'); 
-- SQL Error: ORA-04091: table HR.CUSTOMER2 is mutating, trigger/function may not see it

-- How to fix this error? 

create or replace trigger mutate_trigger 
after insert on customer2
for each row
declare 
PRAGMA AUTONOMOUS_TRANSACTION; 
begin 
    commit; 
    update customer1 set cust_id = (select max(cust_id) from customer2);
    commit;
end;
-- Trigger MUTATE_TRIGGER compiled

insert into customer2 values (359, 'NIC');
-- 1 row inserted.

select * from customer1 ; 

commit;








