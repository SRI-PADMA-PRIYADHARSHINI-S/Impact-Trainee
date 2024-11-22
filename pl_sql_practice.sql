create database employee;
USE employee;

CREATE TABLE employee_table(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    salary int NOT NULL,  
    PRIMARY KEY (id)  
);  
show tables;
INSERT INTO employee_table VALUES  
(101, 'Jo', 30000), 
(102, 'ram', 30000),  
(103, 'jaya', 28634),  
(104, 'tharu', 4578843);


desc employee_table;
select * from employee_table;
SELECT *  FROM employee_table WHERE id = '103' 
AND id < 105;  

delete  FROM employee_table WHERE id = 103
OR id = 104;  

DELIMITER $$
CREATE PROCEDURE emp1_details(IN id INT)
BEGIN
SELECT * FROM employee_table WHERE id=id;
 
END $$
DELIMITER ;
CALL emp1_details(101);


DELIMITER $$
CREATE FUNCTION empdetails(salary INT) RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN 
DECLARE emp1_details VARCHAR(2000);
SELECT CONCAT(id,';',name,';',salary,';') INTO emp1_details  FROM employee_table WHERE salary > salary LIMIT 1;
RETURN employee_table;
END $$
 
DELIMITER ;
 select emp1_details(101);
DROP FUNCTION empdetails;
 
DELIMITER $$

CREATE PROCEDURE product
(IN colValue CHAR(20))
BEGIN
  INSERT INTO MyTable(MyColumn) VALUES(colValue);
END //
DELIMITER ;




