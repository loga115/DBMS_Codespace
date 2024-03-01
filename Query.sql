Exercise Questions on Aggregate Functions

SQL> select * from student;

+-----------+-------+------+------------+--------+

| regno | sname | cgpa | phone | school |

+-----------+-------+------+------------+--------+

| 20BCE1001 | harsh | 9 | 8979867898 | cse |

| 20BCE1002 | alex | 9.3 | 8979867899 | cse |

| 20BCE1003 | abhi | 8.9 | 8979867800 | it |

| 20BCE1004 | virat | 7.8 | 8979867810 | ece |

| 20BCE1005 | anmol | 8.3 | 8979867811 | ecm

| 20BCE1007 | akash | 6.8 | 8979899900 | ece |

+-----------+-------+------+------------+--------+

5 rows in set (0.00 sec)

Create a table student_22brs1373 and insert these values into the table.

CREATE TABLE student_22brs1373
(
regno VARCHAR(20) NOT NULL PRIMARY KEY,
sname VARCHAR(20),
cgpa FLOAT,
phone VARCHAR(20),
school VARCHAR(20)
);

INSERT INTO student_22brs1373 VALUES('20BCE1001', 'harsh', 9, '8979867898', 'cse');
INSERT INTO student_22brs1373 VALUES('20BCE1002', 'alex', 9.3, '8979867899', 'cse');
INSERT INTO student_22brs1373 VALUES('20BCE1003', 'abhi', 8.9, '8979867800', 'it');
INSERT INTO student_22brs1373 VALUES('20BCE1004', 'virat', 7.8, '8979867810', 'ece');
INSERT INTO student_22brs1373 VALUES('20BCE1005', 'anmol', 8.3, '8979867811', 'ecm');
INSERT INTO student_22brs1373 VALUES('20BCE1007', 'akash', 6.8, '8979899900', 'ece');


1. Display the average and maximum cgpa for each school

SELECT school, AVG(cgpa) as avg_cgpa, MAX(cgpa) as max_cgpa
FROM student_22brs1373
GROUP BY school;



2. Display the number of students whose cgpa is >9

SELECT COUNT(*)
FROM student_22brs1373
WHERE cgpa > 9;


3. Display the student name who secured more marks in each school

SELECT school, sname
FROM student_22brs1373
WHERE cgpa = (SELECT MAX(cgpa) FROM student s WHERE s.school = student.school);


4. Display number of students registered under each school

SELECT school, COUNT(*)
FROM student_22brs1373
GROUP BY school;


Exercise Questions on views

Table: salesman

salesman_id | name | city | commission

-------------+------------+----------+------------

5001 | James Hoog | New York | 0.15

5002 | Nail Knite | Paris | 0.13

5005 | Pit Alex | London | 0.11

5006 | Mc Lyon | Paris | 0.14

5007 | Paul Adam | Rome | 0.13

5003 | Lauson Hen | San Jose | 0.12

Create this table and insert these values into the table.

CREATE TABLE salesman_22brs1373
(
salesman_id INT NOT NULL PRIMARY KEY,
name VARCHAR(20),
city VARCHAR(20),
commission FLOAT
);

INSERT INTO salesman_22brs1373 VALUES(5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman_22brs1373 VALUES(5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman_22brs1373 VALUES(5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman_22brs1373 VALUES(5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman_22brs1373 VALUES(5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO salesman_22brs1373 VALUES(5003, 'Lauson Hen', 'San Jose', 0.12);


Table: Customers

customer_id | cust_name | city | grade | salesman_id

-------------+----------------+------------+-------+-------------

3002 | Nick Rimando | New York | 100 | 5001

3007 | Brad Davis | New York | 200 | 5001

3005 | Graham Zusi | California | 200 | 5002

3008 | Julian Green | London | 300 | 5002

3004 | Fabian Johnson | Paris | 300 | 5006

3009 | Geoff Cameron | Berlin | 100 | 5003

3003 | Jozy Altidor | Moscow | 200 | 5007

3001 | Brad Guzan | London | | 5005

Create this table and insert these values into the table.

CREATE TABLE customers_22brs1373
(
customer_id INT NOT NULL PRIMARY KEY,
cust_name VARCHAR(20),
city VARCHAR(20),
grade INT,
salesman_id INT
);

INSERT INTO customers_22brs1373 VALUES(3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customers_22brs1373 VALUES(3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customers_22brs1373 VALUES(3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers_22brs1373 VALUES(3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customers_22brs1373 VALUES(3004, 'Fabian Johnson', 'Paris', 300, 5006);
INSERT INTO customers_22brs1373 VALUES(3009, 'Geoff Cameron', 'Berlin', 100, 5003);
INSERT INTO customers_22brs1373 VALUES(3003, 'Jozy Altidor', 'Moscow', 200, 5007);
INSERT INTO customers_22brs1373 (customer_id, cust_name, city, salesman_id) VALUES(3001, 'Brad Guzan', 'London', 5005);

Table: Orders

ord_no purch_amt ord_date customer_id salesman_id

---------- ---------- ---------- ----------- -----------

70001 150.5 2012-10-05 3005 5002

70009 270.65 2012-09-10 3001 5005

70002 65.26 2012-10-05 3002 5001

70004 110.5 2012-08-17 3009 5003

70007 948.5 2012-09-10 3005 5002

70005 2400.6 2012-07-27 3007 5001

70008 5760 2012-09-10 3002 5001

70010 1983.43 2012-10-10 3004 5006

70003 2480.4 2012-10-10 3009 5003

70012 250.45 2012-06-27 3008 5002

70011 75.29 2012-08-17 3003 5007

70013 3045.6 2012-04-25 3002 5001

Create this table and insert these values into the table.

CREATE TABLE orders_22brs1373
(
ord_no INT NOT NULL PRIMARY KEY,
purch_amt FLOAT,
ord_date DATE,
customer_id INT,
salesman_id INT
);

INSERT INTO orders_22brs1373 VALUES(70001, 150.5, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders_22brs1373 VALUES(70009, 270.65, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3001, 5005);
INSERT INTO orders_22brs1373 VALUES(70002, 65.26, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders_22brs1373 VALUES(70004, 110.5, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders_22brs1373 VALUES(70007, 948.5, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders_22brs1373 VALUES(70005, 2400.6, TO_DATE('2012-07-27', 'YYYY-MM-DD'), 3007, 5001);
INSERT INTO orders_22brs1373 VALUES(70008, 5760, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders_22brs1373 VALUES(70010, 1983.43, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3004, 5006);
INSERT INTO orders_22brs1373 VALUES(70003, 2480.4, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders_22brs1373 VALUES(70012, 250.45, TO_DATE('2012-06-27', 'YYYY-MM-DD'), 3008, 5002);
INSERT INTO orders_22brs1373 VALUES(70011, 75.29, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3003, 5007);
INSERT INTO orders_22brs1373 VALUES(70013, 3045.6, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 3002, 5001);




Create views to fulfill the following requirements. Create tables and data as required wherever necessary.

1. To find the salesmen of the city New York who achieved the commission more than 13%.

CREATE VIEW new_york_salesmen AS
SELECT *
FROM salesman_22brs1373
WHERE city = 'New York' AND commission > 0.13;

2. To find order number, amount, name of the salesman and customer for each order.

CREATE VIEW order_details AS
SELECT ord_no, purch_amt, salesman.name as salesman_name, cust_name
FROM orders_22brs1373 o
JOIN salesman_22brs1373 s
ON o.salesman_id = s.salesman_id
JOIN customers_22brs1373 c
ON o.customer_id = c.customer_id;


3. To find the number of the salesman in each city.

CREATE VIEW salesman_count AS
SELECT city, COUNT(*)
FROM salesman_22brs1373
GROUP BY city;


4. To keeping track the number of customers ordering, number of salesmen attached, average amount of orders and the total amount of orders in a day.

CREATE VIEW daily_order_stats AS
SELECT ord_date, COUNT(DISTINCT customer_id) as num_customers, COUNT(DISTINCT salesman_id) as num_salesmen, AVG(purch_amt) as avg_order_amt, SUM(purch_amt) as total_order_amt
FROM orders_22brs1373
GROUP BY ord_date;

