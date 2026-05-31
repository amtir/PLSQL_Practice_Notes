


create table customer2
(
cust_id number(8), 
cust_name varchar2(40),
dob date,
mobile_no number(10),
city varchar2(40)
);

select * from customer2; 

insert into customer2 values(1000, 'Arun', to_date('12/09/1985','mm/dd/yy'), 9090909093, 'Lausanne');

insert into customer2 values(1001, 'John', to_date('02/01/1985','mm/dd/yy'), 9090909094, 'Geneva');

insert into customer2 values(1002, 'Sam', to_date('12/12/1987','mm/dd/yy'), 9090909095, 'Zurich');

commit; 



declare 
v_mobile_no number(10);

begin 
select mobile_no into v_mobile_no from customer2 where cust_id=1001;
dbms_output.put_line('The mobile number is : ' || v_mobile_no);
end; 
/

alter table csutomer2 modify mobile_no varchar2(40); 

create table customer_bkp

rename customer2 to customer2_bkp;  -- reanme the table 


create table customer2
(
cust_id number(8), 
cust_name varchar2(40),
dob date,
mobile_no varchar2(20),
city varchar2(40)
);

insert into customer2 (select * from customer2_bkp);

select * from customer2; 

commit; 

truncate table customer2; 


insert into customer2 (select cust_id, cust_name, dob, '+91-'|| mobile_no, city from customer2_bkp);


declare 
v_mobile_no hr.customer2.mobile_no%type;

begin 
select mobile_no into v_mobile_no from customer2 where cust_id=1001;
dbms_output.put_line('The mobile number is : ' || v_mobile_no);
end; 
/


declare 
v_customer hr.customer2%rowtype;

begin 
select * into v_customer from customer2 where cust_id=1001;
dbms_output.put_line( v_customer.cust_name || ' ' || v_customer.mobile_no || ' ' || v_customer.city);
end; 
/