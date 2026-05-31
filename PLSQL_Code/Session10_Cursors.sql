
-- cursor for loop 
declare 
cursor c1 is select phone_number, salary from employees; 
begin 
for rec in c1   -- rec composite data type 
loop
dbms_output.put_line(rec.phone_number || ' : ' ||  rec.salary );
end loop;
end; 


select * from employees; 



declare
cursor c1(no number) is select * from employees where department_id = no;
tmp employees%rowtype;
begin 
for i in 1..2 loop
    for tmp in c1(i*30) Loop
        dbms_output.put_line(tmp.employee_id);
        dbms_output.put_line(tmp.first_name);
        dbms_output.put_line(tmp.department_id);
        dbms_output.put_line(tmp.salary);
        dbms_output.put_line('-----------------');
    end Loop;
    dbms_output.put_line('====================');
end Loop;
end;



declare
cursor c1 is select salary from employees;
cursor c2 is  select department_name from departments;
v_salary number(10);
v_department_name varchar2(100);
begin
open c1;
dbms_output.put_line('--- Employees table ---');
loop
fetch c1 into v_salary;
exit when c1%notfound;
dbms_output.put_line(v_salary);
end loop;
close c1;

open c2;
dbms_output.put_line('--- Department table ---');
loop
fetch c2 into v_department_name;
exit when c2%notfound;
dbms_output.put_line(v_department_name);
end loop;
close c2;

end; 













