

-- Dynamic SQL  >> Action when application running  >> Late binding 

-- Static SQL   >>  Action when compilation >> Early binding 
select * from employees ; 

-- Implemented Methods: 
-- 1) execute Immediate 
-- 2) Using a package DBMC_SQL 

-- 1. Dynamic DML -- Insert/update/delete 
-- 2. Dynamic -- Drop and create table
-- 3. Dynamic block 


select * from customer1;

begin 
drop table customer1;
end; 

begin 
execute immediate 'drop table customer1';
end; 


select * from customers; 
create table customer_bkp as select * from customers;
create table customer_bkp1 as select * from customers; 

select * from employees; 
create table employees_bkp as select * from employees;

select * from departments; 
create table departments_bkp as select * from departments;

select * from all_tables where owner = 'HR' and table_name like '%BKP%'; 

--  How to drop all the tables 
begin 

for rec in (select table_name from all_tables where upper(table_name) like '%BKP%' )
loop
    execute immediate 'drop table ' || rec.table_name;
end loop;
end; 
/


create table test1 as select * from customers ;

select * from test1; 

-- procedure 
create or replace procedure proc_drop_table(table_name varchar2) 
is 
begin 
execute immediate 'drop table ' || table_name ;
end;


exec proc_drop_table('test1');

-- Example 2 
create or replace procedure upd_dynamic_customer(p_table varchar2, p_column varchar2, p_cust_id number)
is 
begin 
execute immediate 'update ' || p_table || ' set ' || p_column || ' = sysdate where ' || 'sno =' || p_cust_id; 
end;

select * from student; 

execute upd_dynamic_customer('student', 'SDOJ', 1 );

--  another example 
create or replace procedure table_count
is 
    v_count integer;
begin 
    for r in (select table_name, owner from all_tables where owner = 'HR')
    loop
        execute immediate 'select count(*) from ' || r.table_name into v_count;
        dbms_output.put_line( r.table_name || ' : ' || r.owner  || ' : ' || v_count );
    end loop;
end; 

exec table_count();


-- example 

create or replace procedure generate_new_table(temp_prods varchar2, columns_datatypes varchar2)
is 
    l_str varchar2(200);
begin 
    l_str := 'create table ' || temp_prods || '(' || columns_datatypes || ')';
    dbms_output.put_line(l_str);
    execute immediate l_str ; 
end; 


exec generate_new_table('PRODUCTS', 'ID Number, PRODUCT_NAME VARCHAR2(50), QUANTITY NUMBER');



