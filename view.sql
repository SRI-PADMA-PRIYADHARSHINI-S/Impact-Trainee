create database Aspire_Practices;
use Aspire_Practices;

select * from Product;

CREATE TABLE ProductSales(
Admin_Id INT NOT NULL PRIMARY KEY,
total_prd INT NOT NULL  
);
INSERT INTO ProductSales value(201,0);
DROP TABLE ProductSales;
DELIMITER $$
CREATE TRIGGER Product_count AFTER INSERT ON Product FOR EACH ROW
BEGIN
DECLARE prodCount INT;
SElECT  COUNT(Prd_Id) INTO prodCount FROM Product;
UPDATE ProductSales SET total_prd=prodCount WHERE Admin_Id=201;
END $$
DELIMITER ;

DROP TRIGGER Product_count;

INSERT INTO Product Value (107,'LED Light',8,2000);

SELECT * FROM ProductSales;

CREATE TABLE employee_details(
EMP_ID INT NOT NULL PRIMARY KEY,
EMP_NAME VARCHAR(200) NOT NULL,
EMP_DOJ DATE NOT NULL,
EMP_DEG VARCHAR(200) NOT NULL,
EMP_SALARY INT NOT NULL

);

SELECT * FROM employee_details;

INSERT  employee_details VALUE (104,'ram','2015-07-17','Developer',60000);
INSERT  employee_details VALUE (101,'kavi','2022-03-1','Tester',70000);
INSERT  employee_details VALUE (102,'ragu','2018-08-7','HR',85000);
INSERT  employee_details VALUE (103,'jothika','2023-11-13','Developer',40000);
INSERT  employee_details VALUE (105,'ram','2013-05-23','JavaDeveloper',100000);
DELIMITER $$

CREATE PROCEDURE EMP_DOJ(IN EMP_DY DATE) 
BEGIN
DECLARE EMP_Y INT;
SET EMP_Y := YEAR(EMP_dY);

SELECT * FROM employee_details WHERE YEAR(EMP_DOJ) = EMP_Y;

END $$

DELIMITER ; 

CALL EMP_DOJ('2013-05-23');
