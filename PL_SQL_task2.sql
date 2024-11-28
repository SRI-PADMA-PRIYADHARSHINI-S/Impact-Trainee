CREATE TABLE factorial_results (
    num INT,
    factorial INT
);
DELIMITER $$

CREATE PROCEDURE calculate_factorial(IN num INT)
BEGIN
    DECLARE factorial INT DEFAULT 1;
    DECLARE i INT;

    -- Calculate factorial
    SET i = 1;
    WHILE i <= num DO
        SET factorial = factorial * i;
        SET i = i + 1;
    END WHILE;

    -- Insert result into the table
    INSERT INTO factorial_results (num, factorial) VALUES (num, factorial);
END$$

DELIMITER ;

CALL calculate_factorial(5);  -- Replace 5 with any number for factorial

SELECT * FROM factorial_results;

-- Insert Fibonacci Series into a Table
CREATE TABLE fibonacci_series (
    term_number INT,
    fibonacci_number INT
);
DELIMITER $$

CREATE PROCEDURE generate_fibonacci(IN n INT)
BEGIN
    DECLARE first_term INT DEFAULT 0;
    DECLARE second_term INT DEFAULT 1;
    DECLARE next_term INT;
    DECLARE i INT DEFAULT 1;

    -- Insert the first two terms
    IF n >= 1 THEN
        INSERT INTO fibonacci_series (term_number, fibonacci_number) VALUES (i, first_term);
        SET i = i + 1;
    END IF;

    IF n >= 2 THEN
        INSERT INTO fibonacci_series (term_number, fibonacci_number) VALUES (i, second_term);
        SET i = i + 1;
    END IF;

    -- Generate and insert the rest of the Fibonacci terms
    WHILE i <= n DO
        SET next_term = first_term + second_term;
        INSERT INTO fibonacci_series (term_number, fibonacci_number) VALUES (i, next_term);
        SET first_term = second_term;
        SET second_term = next_term;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
CALL generate_fibonacci(10);  -- Replace 10 with the number of terms for Fibonacci series

SELECT * FROM fibonacci_series;

-- Insert Reversed String into a Table

CREATE TABLE reversed_strings (
    original_string VARCHAR(100),
    reversed_string VARCHAR(100)
);

DELIMITER $$

CREATE PROCEDURE reverse_string(IN input_string VARCHAR(100))
BEGIN
    DECLARE reversed_string VARCHAR(100) DEFAULT '';
    DECLARE length_of_string INT;
    DECLARE i INT;

    -- Get the length of the string
    SET length_of_string = LENGTH(input_string);
    
    -- Reverse the string
    SET i = length_of_string;
    WHILE i > 0 DO
        SET reversed_string = CONCAT(reversed_string, SUBSTRING(input_string, i, 1));
        SET i = i - 1;
    END WHILE;

    -- Insert the original and reversed string into the table
    INSERT INTO reversed_strings (original_string, reversed_string) 
    VALUES (input_string, reversed_string);
END$$

DELIMITER ;

CALL reverse_string('hello');  -- Replace 'hello' with any string to reverse
SELECT * FROM reversed_strings;


--  Insert Prime Check into a Table

CREATE TABLE prime_check (
    num INT,
    is_prime BOOLEAN
);

DELIMITER $$

CREATE PROCEDURE check_prime(IN num INT)
BEGIN
    DECLARE is_prime BOOLEAN DEFAULT TRUE;
    DECLARE i INT DEFAULT 2;

    -- Prime number check logic
    IF num <= 1 THEN
        SET is_prime = FALSE;
    ELSE
        WHILE i <= FLOOR(SQRT(num)) DO
            IF num MOD i = 0 THEN
                SET is_prime = FALSE;
                LEAVE;
            END IF;
            SET i = i + 1;
        END WHILE;
    END IF;

    -- Insert result into the table
    INSERT INTO prime_check (num, is_prime) VALUES (num, is_prime);
END$$

DELIMITER ;

SELECT * FROM prime_check;


-- Insert Sum of Digits into a Table

CREATE TABLE digit_sum (
    num INT,
    sum_of_digits INT
);

DELIMITER $$


CREATE PROCEDURE calculate_digit_sum(IN num INT)
BEGIN
    DECLARE sum_of_digits INT DEFAULT 0;
    DECLARE digit INT;

    -- Calculate sum of digits
    WHILE num > 0 DO
        SET digit = num MOD 10;
        SET sum_of_digits = sum_of_digits + digit;
        SET num = num DIV 10;
    END WHILE;

    -- Insert sum of digits into the table
    INSERT INTO digit_sum (num, sum_of_digits) VALUES (num, sum_of_digits);
END$$

DELIMITER ;
CALL calculate_digit_sum(12345);  -- Replace 12345 with any number

SELECT * FROM digit_sum;

