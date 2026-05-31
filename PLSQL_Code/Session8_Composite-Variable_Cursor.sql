
-- cursors
-- Composite variable 

set serveroutput on;
clear screen;
declare 
v_salary hr.employees.salary%type;
begin 
select salary into v_salary from employees where employee_id=120;
dbms_output.put_line('The salary of the employee is ' || v_salary);
end;
/



set serveroutput on;
clear screen;
declare 
v_salary hr.employees.salary%type;
begin 
select salary into v_salary from employees; --where employee_id=23320;
dbms_output.put_line('The salary of the employee is ' || v_salary);
exception
when no_data_found then 
dbms_output.put_line('No data found ' );
when too_many_rows then 
dbms_output.put_line('Many rows found');
end;
/


-- composite variable 
set serveroutput on;
clear screen;
declare 
type nt_salary_type is table of number(10); 
nt_salary nt_salary_type := nt_salary_type();
begin 
select salary bulk collect into nt_salary from employees; --where employee_id=23320;
for i in nt_salary.first..nt_salary.last
loop
dbms_output.put_line('The salary of the employee is ' || nt_salary(i));
end loop;
exception
when no_data_found then 
dbms_output.put_line('No data found ' );
when too_many_rows then 
dbms_output.put_line('Many rows found');
end;
/


BEGIN
   UPDATE customer2
      SET mobile_no = '+91-' || mobile_no
    WHERE cust_id = &cust_id;

   IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('No rows are updated');
   ELSE
      DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows updated');
   END IF;
END;
/
