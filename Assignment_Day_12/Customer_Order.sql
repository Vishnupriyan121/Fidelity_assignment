CREATE TABLE customers(
	customer_id VARCHAR(10) PRIMARY KEY,
	customer_name VARCHAR(20),
	address VARCHAR(20),
	phone_no BIGINT,
	email_id VARCHAR(20)
);
select * from customers;

INSERT INTO customers (customer_id,customer_name,address,phone_no,email_id) VALUES
('CUST1001','THOMAS','KOCHI',9856325486,'thomas@gmail.com'),
('CUST1002','CHARLES','ALLEPY',9856367486,'charles@gmail.com'),
('CUST1003','SUDHAKAR','KOCHI',9856323869,'sudhakar@gmail.com'),
('CUST1004','JAGADISH','ERNAKULAM',9856326666,'jagadish@gmail.com'),
('CUST1005','ALBERT','ALLEPY',9856328659,'albert@gmail.com'),
('CUST1006','ASHWIN DAS','KANNUR',9856325659,'ashwin@gmail.com');

CREATE TABLE delivery_partners(
	partner_id VARCHAR(10) PRIMARY KEY,
	partner_name VARCHAR(20),
	phone_no BIGINT,
	rating INT
);

SELECT * FROM delivery_partners;

INSERT INTO delivery_partners (partner_id, partner_name, phone_no, rating) VALUES
('PART001', 'QuickDeliver', 9876543210, 5),
('PART002', 'SpeedyCourier', 8765432109, 4),
('PART003', 'FastTrack', 7654321098, 3),
('PART004', 'ExpressShip', 6543210987, 4),
('PART005', 'RapidDelivery', 5432109876, 5),
('PART006', 'OnTime Logistics', 4321098765, 4),
('PART007', 'GoDeliver', 3210987654, 2);



CREATE TABLE hotel_details(
	hotel_id VARCHAR(10) PRIMARY KEY,
	hotel_name VARCHAR(20),
	hotel_type VARCHAR(20),
	rating INT
);
 
INSERT INTO hotel_details (hotel_id, hotel_name, hotel_type, rating) VALUES
('HOTEL01', 'Ocean View', 'Resort', 5),
('HOTEL02', 'City Center Inn', 'Hotel', 4),
('HOTEL03', 'Mountain Retreat', 'Lodge', 3),
('HOTEL04', 'Luxury Suites', 'Hotel', 5),
('HOTEL05', 'Budget Stay', 'Motel', 2),
('HOTEL06', 'Cozy Cabin', 'Cottage', 4);
 
select * from hotel_details;


CREATE TABLE Orders(
	Order_id VARCHAR(10) PRIMARY KEY,
	Customer_id VARCHAR(10) REFERENCES customers(Customer_id),
	Hotel_id VARCHAR(10) REFERENCES hotel_details(Hotel_id),
	partner_id VARCHAR(10) REFERENCES delivery_partners(partner_id),
	order_date DATE,
	order_amount INT
);
 
select * from Orders;
 
INSERT INTO Orders (Order_id, Customer_id, Hotel_id, Partner_id, Order_date, Order_amount) VALUES
('ORD001', 'CUST1001','HOTEL01', 'PART001','2024-10-01', 150),
('ORD002', 'CUST1002','HOTEL02','PART002', '2024-10-02', 200),
('ORD003', 'CUST1001','HOTEL03', 'PART003','2024-10-03', 250),
('ORD004', 'CUST1003','HOTEL04', 'PART004','2024-10-04', 300),
('ORD005', 'CUST1002','HOTEL05','PART005', '2024-10-05', 350);


--1. Delivery Partner details based on rating

SELECT partner_id, partner_name, phone_no 
FROM delivery_partners 
WHERE rating BETWEEN 3 AND 5 
ORDER BY partner_id;

--2. Hunger eats - update table

UPDATE customers
SET phone_no = '9876543210' 
WHERE Customer_id = 'CUST1004';


--3. Customers having gmail id

select customer_id,customer_name,address,phone_no
from customers
WHERE email_id LIKE '%@gmail.com'
ORDER BY customer_id


--4. Hunger eats - change datatype
ALTER TABLE customers
ALTER COLUMN customer_id TYPE int

--5. Hunger eats - Change the field name
ALTER TABLE hotel_details 
RENAME COLUMN rating TO hotel_rating;

--6. Hotel_info
SELECT 
    CONCAT(hotel_name, ' is ', hotel_type) AS HOTEL_INFO
FROM 
    hotel_details
ORDER BY 
    hotel_name DESC;

 --7. Hotels that took order more than five times
SELECT 
    hd.hotel_id,
    hd.hotel_name,
    COUNT(o.order_id) AS NO_OF_ORDERS
FROM 
    hotel_details hd
JOIN 
    Orders o ON hd.hotel_id = o.Hotel_id
GROUP BY 
    hd.hotel_id, hd.hotel_name
HAVING 
    COUNT(o.order_id) > 5
ORDER BY 
    hd.hotel_id ASC;

--8. Hotels not taken orders in a specific month
SELECT 
    hd.hotel_id,
    hd.hotel_name,
    hd.hotel_type
FROM 
    hotel_details hd
LEFT JOIN 
    Orders o ON hd.hotel_id = o.Hotel_id AND o.order_date >= '2019-05-01' AND o.order_date < '2019-06-01'
WHERE 
    o.order_id IS NULL
ORDER BY 
    hd.hotel_id ASC;

--9. Order details
SELECT 
	o.order_id,
    c.customer_name,
    hd.hotel_name,
    o.order_amount
FROM 
    Orders o
JOIN 
    Customers c ON o.Customer_id = c.Customer_id
JOIN 
    hotel_details hd ON o.Hotel_id = hd.hotel_id
ORDER BY 
    o.order_id ASC;


--10.Pizza Store - Update PIZZA table 1.2
CREATE TABLE pizza (
	pizza_id VARCHAR(10),
	cust_id VARCHAR(10) REFERENCES customer(cust_id),
	partner_id VARCHAR(10) REFERENCES delivery_partner1(partner_id),
	pizza_name VARCHAR(10),
	pizza_type VARCHAR(15),
	order_date DATE,
	amount BIGINT
);

SELECT * FROM pizza;

INSERT INTO pizza (pizza_id, cust_id, partner_id, pizza_name, pizza_type, order_date, amount) VALUES
('PI001', 'C001', 'P001', 'Margherita', 'Vegetarian', '2024-01-15', 5000),
('PI002', 'C002', 'P002', 'Pepperoni', 'Non-Vegetarian', '2024-01-16', 6000),
('PI003', 'C003', 'P003', 'Chicken', 'Non-Vegetarian', '2024-01-17', 7000),
('PI004', 'C004', 'P004', 'Veggie', 'Vegetarian', '2024-01-18', 5500),
('PI005', 'C005', 'P005', 'Delight', 'Non-Vegetarian', '2024-01-19', 6500);

UPDATE PIZZA
SET amount = amount * 0.97
WHERE pizza_type = 'Extra Large';


CREATE TABLE customer(
	cust_id VARCHAR(10) PRIMARY KEY,
	cust_name VARCHAR(20),
	cust_phone BIGINT,
	cust_address VARCHAR(20)
);

SELECT * FROM customer;

INSERT INTO customer (cust_id, cust_name, cust_phone, cust_address) VALUES
('C001', 'Alice Johnson', 9876543210, '123 Elm St'),
('C002', 'Bob Smith', 8765432109, '456 Oak St'),
('C003', 'Charlie Brown', 7654321098, '789 Pine St'),
('C004', 'Diana Prince', 6543210987, '321 Maple St'),
('C005', 'Ethan Hunt', 5432109876, '654 Cedar St');
 

CREATE TABLE delivery_partner1(
	partner_id VARCHAR(10) PRIMARY KEY,
	partner_name VARCHAR(15),
	rating BIGINT(20)
);

SELECT * FROM delivery_partner1;

INSERT INTO delivery_partner1 (partner_id, partner_name, rating) VALUES
('P001', 'FastDeliver', 5),
('P002', 'QuicEats', 4),
('P003', 'SpeDelivery', 3),
('P004', 'PizzaExp', 4),
('P005', 'RapidDeliver', 5);


--11.Create table with Foreign Key constraint
 
CREATE TABLE salesman (
	Salesman_ID NUMERIC(5) PRIMARY KEY,
	Nmae VARCHAR(30),
	City VARCHAR(15),
	Commission DECIMAL(5,2)
);
 
CREATE TABLE order1 (
    	ord_NO NUMERIC(5) PRIMARY KEY,
    	customer_id NUMERIC(5),
    	order_date DATE,
	Salesman_ID NUMERIC(5),
    	FOREIGN KEY (Salesman_id) REFERENCES salesman(Salesman_id)
);


--12.Alter Supplier table with Check Constraint
 
--Step 1: Create Supplier Table
CREATE TABLE Supplier (
    Supplier_id NUMERIC(5) PRIMARY KEY,
    Supplier_name VARCHAR(150),
    Address VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(15),
    Country VARCHAR(10),
    contact VARCHAR(10)
);

SELECT * FROM Supplier;
 
--Step 2: Alter Supplier Table to Add Check Constraint
ALTER TABLE Supplier
ADD CONSTRAINT CK_Contact_Length CHECK (LENGTH(contact) = 10);