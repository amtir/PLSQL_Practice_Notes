
CREATE TABLE employee_info (
  emp_id     NUMBER(5) PRIMARY KEY,
  first_name VARCHAR2(20),
  last_name  VARCHAR2(20)
);


CREATE TABLE emp_address_details (
  emp_address_id NUMBER(5) PRIMARY KEY,
  emp_id         NUMBER(5) REFERENCES employee_info(emp_id),
  city           VARCHAR2(15),
  state          VARCHAR2(15),
  country        VARCHAR2(20),
  zip_code       VARCHAR2(10)
);


INSERT INTO employee_info VALUES (10, 'Rakesh', 'Sharma');
INSERT INTO employee_info VALUES (20, 'John',   'Paul');

INSERT INTO emp_address_details
VALUES (101, 10, 'Vegas',  'Nevada', 'US', '88901');

INSERT INTO emp_address_details
VALUES (102, 20, 'Carson', 'Nevada', 'US', '90220');

COMMIT;


CREATE OR REPLACE FUNCTION get_complete_address (
  in_emp_id IN NUMBER
)
RETURN VARCHAR2
IS
  emp_details VARCHAR2(130);
BEGIN
  SELECT 'Name-'    || emp.first_name || ' ' || emp.last_name || ', ' ||
         'City-'    || address.city  || ', ' ||
         'State-'   || address.state || ', ' ||
         'Country-' || address.country || ', ' ||
         'ZIP Code-'|| address.zip_code
    INTO emp_details
    FROM employee_info emp
    JOIN emp_address_details address
      ON address.emp_id = emp.emp_id
   WHERE emp.emp_id = in_emp_id;

  RETURN emp_details;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No address found for employee ' || in_emp_id;
END get_complete_address;
/



-- Test the function in SQL
SELECT get_complete_address(10) AS "Emp Address"
FROM dual;


-- Test the function using DBMS_OUTPUT
SET SERVEROUTPUT ON

BEGIN
  DBMS_OUTPUT.PUT_LINE(get_complete_address(20));
END;
/





