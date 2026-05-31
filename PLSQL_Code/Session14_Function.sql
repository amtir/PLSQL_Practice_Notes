

-- Functions returns always a value where 


-- Oracle pre-defined  
substr() 
max()
rank()


select substr('1234567890', 1,3) from dual; 


create or replace function hello_function(p_name IN varchar2)
return varchar2
is 
v_result varchar2(100);
begin
v_result := 'Hello ' || p_name; 
return v_result;
end hello_function;


select hello_function('John') from dual; 

select count(*) from employees group by department_id; 

CREATE OR REPLACE FUNCTION salary_hike (
  p_emp_id IN NUMBER
)
RETURN NUMBER
AS
  v_job     employees.job_id%TYPE;
  v_sal     employees.salary%TYPE;
  v_raise   NUMBER(3,2);
  v_new_sal NUMBER;
BEGIN
  SELECT job_id, salary
    INTO v_job, v_sal
    FROM employees
   WHERE employee_id = p_emp_id;

  CASE
    WHEN v_job = 'AD_VP' THEN
      IF v_sal < 20000 THEN
        v_raise := 0.50;
      ELSE
        v_raise := 0;
      END IF;

    WHEN v_job = 'CLERK' THEN
      IF v_sal < 1500 THEN
        v_raise := 0.20;
      ELSE
        v_raise := 0;
      END IF;

    ELSE
      v_raise := 0;
  END CASE;

  IF v_raise > 0 THEN
    v_new_sal := v_sal + (v_sal * v_raise);
  ELSE
    v_new_sal := v_sal;
  END IF;

  RETURN v_new_sal;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END salary_hike;
/


select employee_id, first_name, salary, job_id, salary_hike(employee_id) from employees;


CREATE OR REPLACE FUNCTION is_leap_year (
  nYr IN NUMBER
)
RETURN VARCHAR2
IS
  v_day VARCHAR2(2);
BEGIN
  SELECT TO_CHAR(
           LAST_DAY(
             TO_DATE('01-FEB-' || nYr, 'DD-MON-YYYY')
           ),
           'DD'
         )
    INTO v_day
    FROM dual;

  IF v_day = '29' THEN
    RETURN 'LEAP YEAR';
  ELSE
    RETURN 'NON LEAP YEAR';
  END IF;
END is_leap_year;
/



SELECT is_leap_year(2024) FROM dual;

SELECT is_leap_year(2025) FROM dual;

