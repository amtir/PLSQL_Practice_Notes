

declare 
a boolean := False; 
begin 

if a then
    dbms_output.put_line('The condition is True.');
else
    dbms_output.put_line('The condition is False.');
end if; 
end; 
/

declare 
a number :=10;
b number :=0;
begin 
if a or b then 
dbms_output.put_line('True');
else
dbms_output.put_line('False');
end if ; 
end; 
/

select * from employees order by salary desc ;  

select max(salary) from employees;

declare 
v_max_salary number(10); -- 24 000
begin 
select max(salary) into v_max_salary from employees;
dbms_output.put_line('The maximum salary ' || v_max_salary);
if v_max_salary > 100000 then  -- 24 000 > 100 000
delete from employees where salary = v_max_salary;
else
dbms_output.put_line('Nothing to delete!');
end if; 
end; 
/


declare 
v_salary number(10);
v_id number(10) :=&v_id; 
begin 
select salary into v_salary from employees where employee_id = v_id;
case 
when v_salary > 15000 then 
dbms_output.put_line('Fair salary');
when v_salary > 10000 and v_salary < 15000 then
dbms_output.put_line('Avg Salary');
else
dbms_output.put_line(v_salary || ' Low salary');
end case; 
end; 
/



truncate  table customer2; 

drop table customer2;

select * from customer2;


create table customer2
(
cust_id number(8), 
cust_name varchar2(40),
dob date,
mobile_no varchar2(20),
city varchar2(40),
countrz varchar2(40)
);


insert into customer2 (select * from customer2_bkp);




select * from  customer2;

select cust_id, cust_name, mobile_no, dob, city, country,  
    case 
        when country='FR' then '+31-'||mobile_no
        when country='USA' then '+1-'||mobile_no
        when country='IT' then '+39-'||mobile_no
        when country='SP' then '+36-'||mobile_no
        else country 
    end  
    new_phone_no from customer2; 


