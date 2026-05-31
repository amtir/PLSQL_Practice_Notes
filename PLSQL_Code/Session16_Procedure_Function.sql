



-- Session 16 

-- PL-SQL Procedure Insert DML 
drop table customer3; 

create table customer3
(
    cust_id number, 
    cusst_name varchar2(30), 
    mobile number(10),
    age number,
    city_id number
);


create or replace procedure insert_customer(in_cust_id number, in_cust_name varchar2, in_mobile_no number, in_age number, in_ci_id number)
is
begin 
insert into customer3 values (in_cust_id, in_cust_name, in_mobile_no, in_age,in_ci_id);
commit;
end; 


select * from customer3; 

exec insert_customer(101, 'PL-SQL IT', 0909090902, 43,31); 

select * from customer3;


-- Function overloading   >> Package 

select substr('Welcome to PLSQL Session',12) from dual; 

select substr('Welcome to PLSQL Session',12, 5) from dual; 



create or replace function ADD_NUM(A number, B  number )  return number 
 is 
    c number ;
begin
    c := A+B;
    return c; 
end; 

create or replace function ADD_NUM(A number, B  number, C number)  return number 
 is 
    d number ;
begin
    d := A+B +C;
    return d; 
end; 

select  add_num(1,2) from dual;
