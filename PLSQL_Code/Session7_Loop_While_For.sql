

declare 
c number :=1;
begin 
loop
dbms_output.put_line('Welcome to PL-SQL ' || c);
c:=c+1;
exit when c>5;
end loop;
end; 
/



declare 
c number :=0;
begin 
while(c<=5)
loop
dbms_output.put_line('PL-SQL ' || c);
c:=c+1;
end loop;
end; 


declare 
c1 number := 0;
begin 
for c1 in reverse 1..5 
loop
dbms_output.put_line('PL-SQL ' || c1);
end loop;
end;