INSERT INTO bill_addresses(street, city, country)
VALUES ('54 FESTIVE ROAD', 'NORTHAMPTON', 'UK');
INSERT INTO bill_addresses(street, city, country)
VALUES ('30 ENGLISH STREET', 'BEDFORD', 'UK');

INSERT INTO customers(customer_id, customer_name, invoice_address)
SELECT 1, 'MANDY MORRELL', REF(ba)
FROM bill_addresses ba 
WHERE street = '54 FESTIVE ROAD';


INSERT INTO states(state, country)
VALUES ('BIHAR', 'INDIA');


--Update sites site id to refer BIHAR in the states object table
UPDATE sites si --this outside is for sites, si reference was created here
SET si.state_ref =(
	SELECT REF (st) -- this inside is for states, st reference was created here
	FROM    states st
	WHERE st.state = 'BIHAR') 
WHERE si.site_id = 1;

INSERT INTO customers(customer_id, customer_name, invoice_address)
VALUES (1112, 'CAROLE MORRELL', invoice_address('1 MY WAY', 'LUTON', 'UK'));


CREATE TABLE customers(
customer_id NUMBER(6),
customer_name VARCHAR2(25),
invoice_address invoice_address_type);
/

INSERT INTO customers(customer_id, customer_name, invoice_address)
VALUES (2, 'CAROLE MORRELL', invoice_address_type('1 MY WAY', 'LUTON', 'UK'));

INSERT INTO states(state, country)
VALUES ('ALBERTA', 'CANADA');

INSERT INTO states(state, country)
VALUES ('VICTORIA', 'AUSTRALIA');

INSERT INTO states(state, country)
VALUES ('QUEENSLAND', 'AUSTRALIA');

INSERT INTO states(state, country)
VALUES ('DELHI', 'INDIA');


INSERT INTO sites (site_id, address, classroom, location) VALUES (
2, address_type('1 Aussie Street','QUEENSLAND','AUSTRALIA'),
classroom_varray_type (classroom_type (2, 21, NULL),
classroom_type (3, 25, NULL)),
'OCEANIA');

UPDATE sites si 
SET si.state_ref =(
	SELECT REF (st) 
	FROM    states st
	WHERE st.state = 'QUEENSLAND') 
WHERE si.site_id = 2;

INSERT INTO sites (site_id, address, classroom, location) VALUES (
3, address_type('40 KLANG STREET','MY HOME','MALAYSIA'),
classroom_varray_type (classroom_type (3, 22, NULL),
classroom_type (4, 26, NULL)),
'MY CONTINENT');

UPDATE sites si 
SET si.state_ref =(
	SELECT REF (st) 
	FROM    states st
	WHERE st.state = 'ALBERTA') 
WHERE si.site_id = 3;

 