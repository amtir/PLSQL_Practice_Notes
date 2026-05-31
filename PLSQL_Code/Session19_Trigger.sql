

-- Trigger in PL-SQL
/* 
Atrigger is a special kiond of stored procedure that automatically executes when an event accurs in the datra base server. 
5 types of triggers : DML, DDL, System, Instead of, Compound 

DML events are insert, update or delete statements on a table or view. 
Tapes of DML Triggers
Firing Point: Before
BEFORE INSERT TRIGGER
EFORE UPDATE TRIGGER
BEFORE DELETE TRIGGER

Firing Point: After
AFTER INSERT TRIGGER
AFTER UPDATE TRIGGER
AFTER DELETE TRIGGER


*/


create table after_delete 
(
user_name varchar2(20),
date_time date,
count number(10)
);


select * from customer_details; 

select * from customer_details_bkp_trig; 

create table customer_details as select * from employees; 

create table customer_details_bkp_trig as select * from employees where 1=2; 

alter table customer_details_bkp_trig add date_of_deletion date;

alter table customer_details_bkp_trig add who_deleted varchar2(30); 


create or replace trigger custom_trigger 
before delete on customer_details 
for each row
begin 
insert into customer_details_bkp_trig values 
(:old.employee_id, :old.first_name, :old.last_name, :old.email, :old.phone_number, 
:old.hire_date, :old.job_id, :old.salary, :old.commission_pct, 
:old.manager_id, :old.department_id, sysdate, user );
end; 

select user , sysdate from dual ; 


select * from customer_details where employee_id = 198; 

select * from customer_details_bkp_trig; 

delete from customer_details where employee_id = 198;

-- DDL Trigger 

create table DDL_TRIGGER_TABLE_LOG
(
oracle_obj_name varchar2(50),
oracle_user varchar2(50), 
ddl_execution_date date, 
ora_system_event varchar2(50),
oracle_obj_type varchar2(50),
oracle_obj_owner varchar2(50)
);

CREATE OR REPLACE TRIGGER ddl_trigger
AFTER DDL ON SCHEMA
BEGIN
  INSERT INTO ddl_trigger_table_log
  (
    oracle_obj_name,
    oracle_user,
    ddl_execution_date,
    ora_system_event,
    oracle_obj_type,
    oracle_obj_owner
  )
  VALUES
  (
    ora_dict_obj_name,
    ora_login_user,
    SYSDATE,
    ora_sysevent,
    ora_dict_obj_type,
    ora_dict_obj_owner
  );
EXCEPTION
  WHEN OTHERS THEN
    -- prevent DDL from failing
    NULL;
END;
/


truncate table Customer5;

insert into Customer5 values(123, 'Jimmy');

select * from customer5; 

select * from DDL_TRIGGER_TABLE_LOG;


-- To drop the table 
-- Frist drop the table
drop trigger ddl_trigger; 
-- next drop the table
drop table DDL_TRIGGER_TABLE_LOG; 

---------------------------------- 

-- Order of Trigger execution : Which trigger will be executed first ? 

drop table student; 

create table student
(
sno number, sname varchar2(50), sdoj date, sresult varchar2(30)
);

create sequence log_seq; 

create or replace trigger st_bf_ins
before insert on student 
begin
dbms_output.put_line('Staement level-before Insert : ' || log_seq.nextval);
end; 

create or replace trigger row_bf_ins
before insert on student
for each row
begin 
dbms_output.put_line('Row level- before Insert : ' || log_seq.nextval);
end;

create or replace trigger row_af_ins
after insert on student
for each row
begin 
dbms_output.put_line('Row level- after Insert : ' || log_seq.nextval);
end;

create or replace trigger st_af_ins
after insert on student 
begin
dbms_output.put_line('Staement level-after Insert : ' || log_seq.nextval);
end; 

set serveroutput on;

begin 
insert into student (sno, sname, sdoj, sresult) values(1, 'Arun', sysdate, 'Pass');
end;

select * from student; 

drop table student ;





