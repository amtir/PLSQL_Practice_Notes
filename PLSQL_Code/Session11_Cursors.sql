
-- REF CURSORs 

-- Weakly typed REF Cursor
declare 
type ref_cursor IS REF CURSOR ; 
rc_employees_list ref_cursor;
v_firstname varchar(100);
v_depname varchar(100);
begin 

open rc_employees_list for select first_name from employees;
loop
fetch rc_employees_list into v_firstname;
exit when rc_employees_list%notfound;
dbms_output.put_line(v_firstname);
end loop;
dbms_output.put_line(rc_employees_list%rowcount);
close rc_employees_list;

dbms_output.put_line('----------------------');
open rc_employees_list for select department_name from departments;
loop
fetch rc_employees_list into v_depname;
exit when rc_employees_list%notfound;
dbms_output.put_line(v_depname);
end loop;
dbms_output.put_line(rc_employees_list%rowcount);
close rc_employees_list;

end; 
/



-- Strongly Typed REF Cursor
declare 
type ref_cursor IS REF CURSOR return employees%rowtype; 
rc_employees_list ref_cursor;
v_emp_row employees%rowtype;
begin 
open rc_employees_list for select * from employees;
loop
fetch rc_employees_list into v_emp_row;
exit when rc_employees_list%notfound;
dbms_output.put_line(v_emp_row.first_name || ' : ' || v_emp_row.salary );
end loop;
dbms_output.put_line(rc_employees_list%rowcount);
close rc_employees_list;
dbms_output.put_line('----------------------');
end; 
/