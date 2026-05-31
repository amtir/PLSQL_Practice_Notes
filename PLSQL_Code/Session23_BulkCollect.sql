
create table bulk_table ( id number ) ; 
create table bulk_bind (id number) ; 

begin 
    for i in 1..1000000
        loop
            insert into bulk_table values(i);
        end loop;
    commit;
end;   -- 24 sec

select count(*) from bulk_table; 


declare 
    type rt is table of bulk_table%rowtype;
    vt rt;
begin
    select * bulk collect into vt from bulk_table;
        forall i IN 1..vt.count
            insert into bulk_bind values vt(i);
    commit;
end;   -- 3.952 sec



