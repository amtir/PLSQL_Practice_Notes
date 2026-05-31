

-- Packages 

-- Package specifications 
-- Declasre variables, functions, procedures 

-- Package Body 
-- Functions, Procedures, Cursors, Exceptions 


-- Package Specification
CREATE OR REPLACE PACKAGE first_package
AS
    PROCEDURE greetings1 (p_name IN VARCHAR2);
    FUNCTION hello_function (p_name IN VARCHAR2) RETURN VARCHAR2;
END first_package;
/


-- Package Body 
CREATE OR REPLACE PACKAGE BODY first_package
AS

    PROCEDURE greetings1 (p_name IN VARCHAR2)
    AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello ' || p_name);
    END greetings1;


    FUNCTION hello_function (p_name IN VARCHAR2)
        RETURN VARCHAR2
    AS
        v_result VARCHAR2(100);
    BEGIN
        v_result := 'Hello ' || p_name;
        RETURN v_result;
    END hello_function;

END first_package;
/


SET SERVEROUTPUT ON

EXECUTE first_package.greetings1('chandrasekar');

SELECT first_package.hello_function('John') AS greeting
FROM dual;





create or replace package  PKG_OVERLOAD_ADD_NUMBERS
is 
    procedure add_num(A number, B number);
    procedure add_num(A number, B number, C number);
end;



create or replace package body PKG_OVERLOAD_ADD_NUMBERS
is 

     procedure ADD_NUM(A number, B  number ) 
     is 
    begin
       DBMS_OUTPUT.PUT_LINE('Sum of two numbers are : ' || to_char(A+B) );
    end; 
    
    procedure ADD_NUM(A number, B  number, C number)  
     is 
    begin
       DBMS_OUTPUT.PUT_LINE('Sum of three numbers are : ' || to_char(A+B+C) );
    end; 

end; 


exec pkg_overload_add_numbers.add_num(1,2,3); 

exec pkg_overload_add_numbers.add_num(5,6); 





-- Forward reference 
SET SERVEROUTPUT ON

DECLARE
    -- Forward declaration (forward reference)
    PROCEDURE proc2;

    PROCEDURE proc1 IS
    BEGIN
        proc2;  -- calling proc2 before its body is defined
        DBMS_OUTPUT.PUT_LINE('This is procedure 1');
    END proc1;

    -- Actual definition of proc2
    PROCEDURE proc2 IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('This is procedure 2');
    END proc2;

BEGIN
    proc1;
END;
/


-- Package visibility 
-- Public, Local, Private 





