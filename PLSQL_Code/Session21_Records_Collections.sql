
-- Session 21 : Records  &  Collections 


desc customers;

declare 
type emp1_record_type is record ( first_name varchar2(30) not null := 'James', salary number(8));    -- definition 
emp_rec emp1_record_type; --declare 
begin 
--emp_rec.first_name := ''; --'John';
emp_rec.salary := 20000;
dbms_output.put_line(emp_rec.first_name || ' '  || emp_rec.salary );
end;



declare 
type emp_rec_type is record (first_name varchar2(20), salary number(8) ) ; 
emp_rec emp_rec_type; 
begin 
select first_name, salary into emp_rec from employees where employee_id = 130;
dbms_output.put_line(emp_rec.first_name || ' '  || emp_rec.salary );
end;



