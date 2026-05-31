
-- Session 22 :  

-- Steps
-- Define, declare, initialize, assign, access

-- 1 - VARRAY ,2 - Nested Table, 3 - Associative Array 


/*
Collections are used along with 
Bulk collect
Forall
Table functions to improve performance
*/

-- 1 - VARRAY 
declare
Type v_array_type is varray(10) of varchar2(40);  -- define 
v_color v_Array_type:= v_array_type(null,null,null,null,null,null,null);  -- declare & initialize 
begin 
v_color(1) := 'Red';  -- Assign 
v_color(2) := 'Blue';
v_color(3) := 'Geen';
v_color(4) := 'Yellow';
v_color(5) := 'Gray';
dbms_output.put_line('Color: ' ||v_color(1));   -- access
dbms_output.put_line('v_color.limit: ' ||v_color.limit);   -- access
dbms_output.put_line('v_color.count: ' ||v_color.count);   -- access
dbms_output.put_line('v_color.first: ' || v_color.first);
dbms_output.put_line('v_color.last: ' || v_color.last);
v_color.extend(1);
dbms_output.put_line('Extend - v_color.count: ' ||v_color.count);   -- access
dbms_output.put_line('v_color..next(1): ' || v_color.next(1));
dbms_output.put_line('v_color..next(2): ' || v_color.next(2));
dbms_output.put_line('v_color..next(3): ' || v_color.next(3));
dbms_output.put_line('v_color(v_color..next(4)): ' || v_color(v_color.next(4)));
v_color.trim(1);
dbms_output.put_line('Trim - v_color.count: ' ||v_color.count);   -- access
v_color.delete();
dbms_output.put_line('After delete - v_color.count: ' ||v_color.count);   -- access
 -- cannot delete by index 
end;



-- 2 -  Nested Table 
--  no limit , can be extended 
declare
Type v_nested_table_type is table of varchar2(40);  -- define 
v_color v_nested_table_type:= v_nested_table_type(null,null,null,null);  -- declare & initialize 
begin 
v_color(1) := 'Red';  -- Assign 
v_color(2) := 'Blue';
v_color(3) := 'Geen';
v_color(4) := 'Yellow';
dbms_output.put_line('v_color.limit: ' ||v_color.limit);   -- access no limit >> get NULL 
dbms_output.put_line('v_color.count: ' ||v_color.count);   -- access
v_color.extend(1);
v_color(5) := 'Gray';
dbms_output.put_line('Color: ' ||v_color(1));   -- access
dbms_output.put_line('v_color.limit: ' ||v_color.limit);   -- access
dbms_output.put_line('v_color.count: ' ||v_color.count);   -- access
dbms_output.put_line('v_color.first: ' || v_color.first);
dbms_output.put_line('v_color.last: ' || v_color.last);
v_color.extend(1);
dbms_output.put_line('Extend - v_color.count: ' ||v_color.count);   -- access
dbms_output.put_line('v_color(1): ' || v_color(1));
dbms_output.put_line('v_color(2): ' || v_color(2));
dbms_output.put_line('v_color(3): ' || v_color(3));
dbms_output.put_line('v_color(4): ' || v_color(4));
dbms_output.put_line('v_color(5): ' || v_color(5));
dbms_output.put_line('v_color(v_color..next(4)): ' || v_color(v_color.next(4)));
v_color.trim(1);
dbms_output.put_line('Trim - v_color.count: ' ||v_color.count);   -- access
v_color.delete(2);
dbms_output.put_line('After delete(2) - v_color.count: ' ||v_color.count);   -- access
dbms_output.put_line('v_color(1): ' || v_color(1));
if v_color.exists(2) then 
    dbms_output.put_line('v_color(2): ' || v_color(2));
else
    dbms_output.put_line('Element does not exist');
end if;    
dbms_output.put_line('v_color(3): ' || v_color(3));
dbms_output.put_line('v_color(4): ' || v_color(4));
dbms_output.put_line('v_color(5): ' || v_color(5));
v_color.delete();
dbms_output.put_line('After delete() - v_color.count: ' ||v_color.count);   -- access
end;




-- In VARRAY and Nested tables, the index is predefined and maintained by Oracle
-- Associative array is set of key value pair. Each key is unique ans it is used to locate the elements
-- Methods limit, trim and extend wont be available 
declare 
Type v_array_type is table of varchar2(40) index by varchar2(10); 
v_color v_array_type;
begin 
v_color('plsql'):='Procedural Language for SQL';
v_color('sql'):='Structured Query Language ';
v_color('plsql'):='Procedural language for SQL';
v_color('color1'):='Blue';
v_color('color2'):='green';
dbms_output.put_line(v_color('plsql'));

dbms_output.put_line(v_color('plsql'));

dbms_output.put_line(v_color.first);
dbms_output.put_line(v_color.last);
dbms_output.put_line(v_color.count);

v_color.delete('sql');
dbms_output.put_line(v_color.count);

end; 




Type v_array_type is varray(10) of varchar2(40);  -- define 
Type v_nested_table_type is table of varchar2(40);
Type v_array_type is table of varchar2(40) index by varchar2(10); 




