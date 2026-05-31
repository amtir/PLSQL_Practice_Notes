declare
v_id number(10,0) := &v_id;
v_ph_no varchar2(100); 
v_job varchar2(100); 
begin 
--select phone_number  from employees where employee_id = 110;  -- >> Error expecting into 
select phone_number, job_id into v_ph_no, v_job from employees where employee_id = v_id;
dbms_output.put_line('The Employee where id is ' || v_id || ' has job : ' || v_job || ' and has number: ' || v_ph_no);
end; 
/


select phone_number  from employees where employee_id = 110;

select * from employees where job_id = 'IT_PROG'; 


