
-- JSON Functions  
-- Java Script Object Notation 

-- JSON 
    -- JSON_OBJECT
    -- JSON_OBJECTAGG
    -- JSON_ARRAY
    -- JSON_ARRAYAGG
    -- JSON_QUERY
    -- JSON_EQUAL (18C Version Oracle)

 -- JSON_OBJECT  Basic function to build json object
select * from employees; 
select first_name from employees ;

select JSON_OBJECT('ENAME' value first_name) as JSON_DOCUMENT from employees; 

--  JSON_OBJECTAGG  --  JSON Object  Aggregate    ('LABEL'  VALUE  'VALUE')
--  List of value pairs 
select JSON_OBJECTAGG('ENAME' value first_name) as JSON_DOCUMENT from employees ;


-- JSON_ARRAY
select json_array(first_name) as json_document from employees;

-- JSON_ARRAYAGG
select json_arrayagg(first_name) as json_document from employees;

select json_array  ( JSON_OBJECT('ENAME' value first_name)) as JSON_DOCUMENT from employees ; 


JSON_EQUAL

select * from employees;  -- employee_id   manager_id
select * from departments ;

select department_name , first_name from departments D , employees E where E.manager_id = D.manager_id;

select json_object(department_name value first_name) json_doc 
from departments D , employees E where E.manager_id = D.manager_id;

select json_object(department_name value json_arrayagg(first_name) ) json_doc 
from departments D , employees E where E.manager_id = D.manager_id
group by department_name;


select json_objectagg(department_name value json_arrayagg(first_name) ) json_doc 
from departments D , employees E where E.manager_id = D.manager_id
group by department_name;
-- {"Accounting":["William"],"Executive":["Gerald","Eleni","Matthew","Shanta","John","Den","Karen","Kevin","Neena","Payam","Michael","Adam","Alberto","Lex"],"Finance":["John","Jose Manuel","Ismael","Luis","Daniel"],"IT":["David","Valli","Diana","Bruce"],"Marketing":["Pat"],"Purchasing":["Shelli","Sigal","Alexander","Guy","Karen"],"Sales":["David","Oliver","Peter","Christopher","Peter","Nanette"],"Shipping":["Mozhe","Nandita","TJ","James","Julia","Anthony","Alexis","Laura"]}


create table J_PURCHASE_ORDER 
(id number, datetime timestamp, po_document varchar2(4000) 
constraint j_chk check (po_document is json));

select * from J_PURCHASE_ORDER;

insert into J_PURCHASE_ORDER values (1, systimestamp, 
  '{
     "PONumber": 1600,
     "Reference": "ABULL-20140421",
     "Requestor": "Alexis Bull",
     "User": "ABULL",
     "CostCenter": "A50",
     "ShippingInstructions": {
       "name": "Alexis Bull",
       "Address": {
         "street": "200 Sporting Green",
         "city": "South San Francisco",
         "state": "CA",
         "zipCode": 99236,
         "country": "United States of America"
       },
       "Phone": [
         {"type": "Office", "number": "909-555-7307"},
         {"type": "Mobile", "number": "415-555-1234"}
       ]
     },
     "SpecialInstructions": null,
     "AllowPartialShipment": true,
     "LineItems": [
       {
         "ItemNumber": 1,
         "Part": {
           "Description": "One Magic Christmas",
           "UnitPrice": 19.95,
           "UPCCode": 13131092899
         },
         "Quantity": 9.0
       },
       {
         "ItemNumber": 2,
         "Part": {
           "Description": "Lethal Weapon",
           "UnitPrice": 19.95,
           "UPCCode": 85391628927
         },
         "Quantity": 5.0
       }
     ]
   }'
);

insert into J_PURCHASE_ORDER values (2, systimestamp, 
'{
     "PONumber": 672,
     "Reference": "SBELL-20141017",
     "Requestor": "Sarah Bell",
     "User": "SBELL",
     "CostCenter": "A50",
     "ShippingInstructions": {
       "name": "Sarah Bell",
       "Address": {
         "street": "200 Sporting Green",
         "city": "South San Francisco",
         "state": "CA",
         "zipCode": 99236,
         "country": "United States of America"
       },
       "Phone": "983-555-6509"
     },
     "SpecialInstructions": "Courier",
     "LineItems": [
       {
         "ItemNumber": 1,
         "Part": {
           "Description": "Making the Grade",
           "UnitPrice": 20,
           "UPCCode": 27616867759
         },
         "Quantity": 8.0
       },
       {
         "ItemNumber": 2,
         "Part": {
           "Description": "Nixon",
           "UnitPrice": 19.95,
           "UPCCode": 717951002396
         },
         "Quantity": 5
       },
       {
         "ItemNumber": 3,
         "Part": {
           "Description": "Eric Clapton: Best Of 1981-1999",
           "UnitPrice": 19.95,
           "UPCCode": 75993851120
         },
         "Quantity": 5.0
       }
     ]
   }'
);

commit; 

select a.id, a.datetime, a.po_document.PONumber , a.po_document.ShippingInstructions.name NAME , a.po_document.ShippingInstructions.Address.country COUNTRY
from j_purchase_order a;

select a.id, a.datetime, a.po_document.PONumber , a.po_document.ShippingInstructions.name NAME ,
a.po_document.Requestor REQUESTOR ,
a.po_document.ShippingInstructions.Address.country COUNTRY,
a.po_document.LineItems.ItemNumber ItemNumber
from j_purchase_order a;


 -- json_query( column, $.elements[*] with wrapper)
 select a.id,
 a.po_document.LineItems.ItemNumber LineItems
from j_purchase_order a;

 select id,
 json_query(po_document, '$.LineItems.ItemNumber' with wrapper) LineItems
from j_purchase_order a;

 select id,
 json_query(po_document, '$.LineItems[0].ItemNumber' with wrapper) LineItems
from j_purchase_order a;

-- JSON   18 C version of Oracle 
select case when json_equal('{"ENAME":"BOB"}' , '{"ENAME":"BIO"}') then 'Matched' else 'Not Matched' end JSON_CHK
from dual; 

select case when json_equal('{"ENAME":"BOB"}' , '{"ENAME":"BOB"}') then 'Matched' else 'Not Matched' end JSON_CHK
from dual; 


