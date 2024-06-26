#1.% mysql -u root -p  2.   L9k%DiX,Xh-,6mj 



#CREATE ALTER DROP 	 [DB&TABLES]

CREATE DATABASE ROUGH;
DROP DATABASE ROUGH;

CREATE DATABASE STUDENTS;
USE STUDENTS;
#ALTER DATABASE STUDENTS MODIFY NAME = STUDENT_DB;  #MODIFY DATABES NAME IS NOT AVAILABLE IN MYSQL
SHOW DATABASES;

CREATE TABLE PERSONAL_INFO(
ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50) NOT NULL,
GENDER VARCHAR(50) NOT NULL,
CITY VARCHAR(50) NOT NULL,
CONTACT_NO VARCHAR(25)
);
SHOW TABLES;
DESCRIBE PERSONAL_INFO;
DROP TABLE PERSONAL_INFO;
ALTER TABLE PERSONAL_INFO ADD NATIONALITY VARCHAR(50) NOT NULL DEFAULT  "INDIAN";
ALTER TABLE PERSONAL_INFO MODIFY CONTACT_NO VARCHAR(10) NOT NULL ;
ALTER TABLE PERSONAL_INFO RENAME TO PERSONAL_DETAILS;
ALTER TABLE PERSONAL_DETAILS RENAME TO PERSONAL_INFO;



INSERT INTO PERSONAL_INFO VALUES(NULL,"RAJU","MALE","TVL","9080841170");
INSERT INTO PERSONAL_INFO (NAME,GENDER,CITY,CONTACT_NO)VALUES("GAJA","MALE","SALEM","9080898847");
INSERT INTO PERSONAL_INFO (NAME,GENDER,CITY,CONTACT_NO)VALUES("MUTHU","MALE","NAMAKKAL","9045798847"),
("KUMAR","MALE","NAMAKKAL","9080475847"),
("VISH","MALE","AANDRA","9080849747"),
("PONRAJ","MALE","SIVAKASSI","9760898847"),
("DARSHU","FEMALE","PDKT","9956898847"),
("SUJI","FEMALE","SIVAKASI","8980898847")
;
DELETE FROM PERSONAL_INFO WHERE ID=4;
UPDATE  PERSONAL_INFO SET CITY = "PUDUKOTTAI" WHERE ID=7;
TRUNCATE TABLE PERSONAL_INFO;
SELECT * FROM PERSONAL_INFO;
SELECT ID,NAME,CONTACT_NO FROM PERSONAL_INFO;
SELECT * FROM PERSONAL_INFO WHERE CITY = "SIVAKASI";
UPDATE PERSONAL_INFO SET CITY="SIVAKASI" WHERE ID=6;

SELECT * FROM PERSONAL_INFO WHERE ID>3 AND (CITY="SIVAKASI" OR CITY="AANDRA");

SELECT CITY FROM PERSONAL_INFO;
SELECT DISTINCT CITY FROM PERSONAL_INFO;
SELECT COUNT(CITY) FROM PERSONAL_INFO;
SELECT COUNT(DISTINCT CITY) AS NO_OF_CITIES FROM PERSONAL_INFO;

SELECT * FROM PERSONAL_INFO LIMIT 5;
SELECT * FROM PERSONAL_INFO LIMIT 2,3;
SELECT * FROM PERSONAL_INFO ORDER BY NAME DESC LIMIT 0,1;
ALTER TABLE PERSONAL_INFO ADD AGE INT NOT NULL ;
ALTER TABLE PERSONAL_INFO MODIFY AGE INT NOT NULL DEFAULT 26;


UPDATE PERSONAL_INFO SET AGE=23 WHERE ID<3;
UPDATE PERSONAL_INFO SET AGE=25 WHERE ID>7;
INSERT INTO PERSONAL_INFO (NAME,GENDER,CITY,CONTACT_NO) VALUES("ESAI","MALE","TVL","8483729384");
UPDATE PERSONAL_INFO SET AGE=28 WHERE ID BETWEEN 3 AND 7;

SELECT MAX(AGE) FROM PERSONAL_INFO;
SELECT MIN(AGE) FROM PERSONAL_INFO;
SELECT AVG(AGE) FROM PERSONAL_INFO;
SELECT ROUND(AVG(AGE)) FROM PERSONAL_INFO;
SELECT ROUND(AVG(AGE),1) FROM PERSONAL_INFO;
SELECT SUM(AGE)FROM PERSONAL_INFO;
SELECT SUM(DISTINCT(AGE)) FROM PERSONAL_INFO;


SELECT COUNT(ID) AS NO_OF_STUDENTS,CITY FROM PERSONAL_INFO GROUP BY CITY;
SELECT * FROM PERSONAL_INFO WHERE NAME LIKE "%U";
SELECT * FROM PERSONAL_INFO WHERE NAME LIKE "_A%";
SELECT * FROM PERSONAL_INFO WHERE NAME LIKE "[SMG]U%";#NOT WORKING IN MYSQL
SELECT * FROM PERSONAL_INFO WHERE NAME NOT LIKE "%U";

SELECT * FROM PERSONAL_INFO WHERE CITY IN("TVL","PUDUKOTTAI");#MULTIPLE OR
SELECT * FROM PERSONAL_INFO WHERE CITY NOT IN("TVL","PUDUKOTTAI");

CREATE TABLE ATTENDANCE (
AID INT NOT NULL AUTO_INCREMENT,
ID INT NOT NULL,
ADATE DATE NOT NULL,
ASTATUS VARCHAR (10) NOT NULL,
PRIMARY KEY(AID)
) ;
SHOW TABLES;
SELECT * FROM PERSONAL_INFO;
SELECT * FROM ATTENDANCE;
INSERT INTO ATTENDANCE (ID,ADATE,ASTATUS) VALUES (1,'2024-01-01',"P"),(1,'2024-01-02',"P"),(1,'2024-01-03',"A"),(1,'2024-01-04',"P"),
(2,'2024-01-01',"P"),(2,'2024-01-02',"A"),(2,'2024-01-03',"P"),(2,'2024-01-04',"P"),
(3,'2024-01-01',"P"),(3,'2024-01-02',"P"),(3,'2024-01-03',"P"),(3,'2024-01-04',"P"),
(5,'2024-01-01',"P"),(5,'2024-01-02',"P"),(5,'2024-01-03',"A"),(5,'2024-01-04',"P"),
(6,'2024-01-01',"A"),(6,'2024-01-02',"A"),(6,'2024-01-03',"P"),(6,'2024-01-04',"P"),
(7,'2024-01-01',"P"),(7,'2024-01-02',"P"),(7,'2024-01-03',"P"),(7,'2024-01-04',"P"),
(8,'2024-01-01',"A"),(8,'2024-01-02',"A"),(8,'2024-01-03',"A"),(8,'2024-01-04',"A"),
(9,'2024-01-01',"P"),(9,'2024-01-02',"P"),(9,'2024-01-03',"P"),(9,'2024-01-04',"A");

SELECT ID,COUNT(AID) AS NO_OF_WORKING_DAYS FROM ATTENDANCE GROUP BY ID;
SELECT ID,COUNT(IF(ASTATUS="P",1,NULL)) AS NO_OF_PRESENT FROM ATTENDANCE GROUP BY ID;
SELECT ID,COUNT(IF(ASTATUS="A",1,NULL)) AS NO_OF_PRESENT FROM ATTENDANCE GROUP BY ID;

CREATE TABLE EMP (
ID INTEGER UNSIGNED NOT NULL AUTO_INCREMENT, NAME VARCHAR(45) NOT NULL, DESIGN VARCHAR (45) NOT NULL, DOJ DATE NOT NULL, PRIMARY KEY (ID)
);
DESCRIBE EMP;
INSERT INTO EMP (NAME, DESIGN, DOJ) VALUES
('RAM', 'MANAGER', '2018-09-10'),
('SAM', 'HR', '2018-09-10'),
('TOM', 'AMC', '2018-09-11'),
('RAVI', 'SALES','2018-09-23'),
('KUMAR', 'SALES', '2018-10-02')
;
SELECT * FROM EMP;
CREATE TABLE SALARY (
SID INT NOT NULL AUTO_INCREMENT,
ID INT NOT NULL,
SDATE DATE NOT NULL,
AMT INT NOT NULL,
PRIMARY KEY(SID));


INSERT INTO SALARY (ID,SDATE, AMT) VALUES
(1, '2018-09-01',10000),
(2, '2018-09-01',7500),
(3, '2018-09-01',6000),
(4, '2018-09-01' ,4000);
SELECT * FROM SALARY;

SELECT EMP.ID,EMP.NAME,SALARY.SID,SALARY.AMT FROM EMP INNER JOIN SALARY ON EMP.ID=SALARY.ID;
SELECT EMP.ID,EMP.NAME,SALARY.SID,SALARY.AMT FROM EMP LEFT JOIN SALARY ON EMP.ID=SALARY.ID;
SELECT EMP.ID,EMP.NAME,SALARY.SID,SALARY.AMT FROM EMP RIGHT JOIN SALARY ON EMP.ID=SALARY.ID;

SELECT * FROM PERSONAL_INFO;
SELECT * FROM ATTENDANCE;
SELECT P.ID,P.NAME,P.AGE,A.ADATE,A.ASTATUS FROM PERSONAL_INFO P LEFT JOIN ATTENDANCE A ON P.ID=A.ID;


SELECT NAME,CASE 
      WHEN AGE<=23 THEN "UG"
      WHEN AGE<=25 THEN "PG"
      ELSE "PHD"
END AS GRADUATION,AGE FROM PERSONAL_INFO;



#chat GBT JOIN WITH GROUP BY EXAMPLE CODE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO orders VALUES (1, 'John Doe', '2024-01-10');
INSERT INTO orders VALUES (2, 'Jane Smith', '2024-01-11');

INSERT INTO order_items VALUES (101, 1, 'Product A', 2, 10.00);
INSERT INTO order_items VALUES (102, 1, 'Product B', 1, 15.00);
INSERT INTO order_items VALUES (103, 2, 'Product A', 3, 10.00);
INSERT INTO order_items VALUES (104, 2, 'Product C', 2, 20.00);

select *  FROM orders;
select *  FROM order_items;

SELECT
    orders.order_id,
    orders.customer_name,
    orders.order_date,
    SUM(order_items.quantity) AS total_quantity,
    SUM(order_items.quantity * order_items.price) AS total_price
FROM
    orders
JOIN
    order_items ON orders.order_id = order_items.order_id
GROUP BY
    orders.order_id, orders.customer_name, orders.order_date;

















