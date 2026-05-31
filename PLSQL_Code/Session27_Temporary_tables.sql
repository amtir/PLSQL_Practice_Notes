
-- Temporary tables 
-- Global & Private temporary table

-- Loging into one session 
-- 6 to 7 tables    
-- 3 tables join to a
-- 4 tables join to b table 

-- 8i version >> GTT Global Temporary Tables 
-- 18C version >> Private tables 

drop table my_temp_table; 

create global temporary table my_temp_table (
id number, 
description varchar2(20)
)
on commit preserve rows;    -- preserve rows  per session . Structure will be maintained, but data rows will be released, erased. 
-- on commit delete rows;  -- delete rows on commit , data preserved for the current transaction


insert INTO MY_TEMP_TABLE values (1, 'ONE');

select count(*) from my_temp_table;

commit; 

select count(*) from my_temp_table;


--  private table 
create private temporary table ora$ptt_temp_table (
id number,
description varchar(20)
)
on commit drop definition; 
-- on commit preserve definition ;

insert into ora$ptt_temp_table values (1, 'ONE'); 

insert into ora$ptt_temp_table values (2, 'TWO'); 

select * from ora$ptt_temp_table;

commit; 

select * from ora$ptt_temp_table;


