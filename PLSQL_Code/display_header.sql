


create or replace procedure display_header(
p_text in varchar2
)
is 
begin 
  DBMS_OUTPUT.put_line('--------------------------------------------------');
  DBMS_OUTPUT.put_line(p_text);
  DBMS_OUTPUT.put_line('--------------------------------------------------');
end display_header; 
/