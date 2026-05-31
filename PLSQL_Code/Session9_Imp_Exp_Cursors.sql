

select * from customer2; 


-- number of cursor allowed
select * from v$parameter where name='open_cursors';

-- number of open cursors in the htr schema  
select * from v$open_cursor where user_name='HR';


declare 
vemp_salary employees.salary%type;
--declare cursor
CURSOR C1 is select salary from employees; -- cursor variable definition
begin 
open C1; -- open cursor
fetch C1 into vemp_salary ;   -- fetch valus 1
DBMS_OUTPUT.PUT_LINE(vemp_salary); 
fetch C1 into vemp_salary ;      -- 2  
DBMS_OUTPUT.PUT_LINE(vemp_salary);
fetch C1 into vemp_salary ;      -- 3 
DBMS_OUTPUT.PUT_LINE(vemp_salary);
end; 
/



declare 
vemp_name employees.first_name%type;
vemp_salary employees.salary%type;
--declare cursor
CURSOR C1 is select first_name, salary from employees; -- cursor variable definition
begin 
open C1; -- open cursor
loop
fetch C1 into vemp_name, vemp_salary ;   -- fetch values
exit when c1%notfound;
DBMS_OUTPUT.PUT_LINE(vemp_name || ' : '  || vemp_salary); 
end loop;
DBMS_OUTPUT.PUT_LINE('Row-Count : '  || C1%rowcount); 
close C1;
end; 
/


declare 
cursor c1 is select last_name, employee_id, salary from employees order by salary desc ;
emp_name employees.last_name%type; 
emp_id employees.employee_id%type;
emp_salary employees.salary%type;
begin 
open c1; 
loop
    fetch c1 into emp_name, emp_id, emp_salary;
    exit when (c1%rowcount >65) or (c1%notfound);
    dbms_output.put_line(emp_name || ' ' || emp_id || ' ' || emp_salary);
end loop;
close c1;
end; 


















