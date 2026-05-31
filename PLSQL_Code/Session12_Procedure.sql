

-- Stored procedures 

drop procedure greetings; 

-- Static
create procedure greetings
is 
-- declaration section
begin 
-- execution section
dbms_output.put_line('Welcome to PLSQL Session!');
end; 

-- How to execute the procedure? 
-- 1 
exec greetings;

-- 2 
execute greetings;

-- 3   
begin
greetings;
end; 

-- 3 ypes of parameters , no limitation in the number of parameters 
-- IN pssing a value tothe procedure
-- OUT Getting a value from the procedure
-- IN/OUT - the same variable as Input as well as output   

-- Dynamic 
create procedure greetings2(p_name IN varchar2)
is 
-- declaration section
begin 
-- execution section
dbms_output.put_line('Welcome '  || p_name || ' to PLSQL Session!');
end; 


exec greetings2(James);

begin
greetings2('John');
end;



create or replace procedure  total(n1 in number, n2 in number , total out number ) 
is
begin 
total := n1 + n2; 
end; 
/

declare 
v_total number(10);
begin 
total(1230,9920, v_total); 
dbms_output.put_line(v_total);
end; 

create or replace procedure  total1(n1 in number, n2 in number ) 
is
total number;
begin 
total := n1 + n2; 
dbms_output.put_line('Total: ' || total);
end; 
/


exec total1(1234, 45678);


create or replace procedure INOUT_Multiplication(x in out number) 
is 
begin 
    x:= x*5;
end;

declare 
v_result number(10) := 10 ;
begin 
INOUT_Multiplication(v_result);
dbms_output.put_line('Result: ' || v_result);
end; 
