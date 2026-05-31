

-- Stored procedures 

create or replace procedure total_salary(in_emp_id in number)
is
v_salary number(10);
begin
select salary+(salary*nvl(commission_pct,0)) into v_salary from employees where employee_id = in_emp_id; 
dbms_output.put_line(in_emp_id || ' : ' ||  v_salary   );
end;

exec total_salary(104);


create or replace procedure proc1 (emp_no in number, temp out employees%rowtype)
is 
begin 
select * into temp from employees where employee_id = emp_no;
end; 



declare 
emp_no number; 
temp employees%rowtype;
begin 
emp_no := 115;
proc1(emp_no,temp);
dbms_output.put_line(temp.employee_id || ' ' || temp.first_name || ' ' || temp.salary );
end ; 

select * from all_procedures where owner = 'HR';

select * from User_procedures ;


select text from all_source  where owner = 'HR' and type='PROCEDURE' and name ='ADD_JOB_HISTORY';


CREATE OR REPLACE PROCEDURE get_employees
AS
BEGIN
  FOR r IN (
    SELECT first_name, salary
    FROM employees
    WHERE ROWNUM <= 5
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(r.first_name || ' - ' || r.salary);
  END LOOP;
END;
/

EXEC get_employees;



CREATE OR REPLACE PROCEDURE get_employees(in_dept in employees.department_id%type)
AS
BEGIN
  FOR r IN (
    SELECT first_name, salary
    FROM employees
    WHERE department_id = in_dept 
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE(r.first_name || ' - ' || r.salary);
  END LOOP;
END;
/

EXEC get_employees(60);



