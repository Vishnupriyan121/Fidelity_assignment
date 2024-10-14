CREATE TABLE Worker (
    WORKER_ID SERIAL PRIMARY KEY,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    JOINING_DATE DATE NOT NULL,
    SALARY INTEGER NOT NULL,
    DEPARTMENT INTEGER
);
ALTER TABLE Worker ALTER COLUMN DEPARTMENT TYPE VARCHAR(50);
CREATE TABLE Title (
    WORKER_REF_ID INTEGER REFERENCES Worker(WORKER_ID),
    WORKER_TITLE VARCHAR(50) NOT NULL,
    AFFECTED_FROM DATE NOT NULL
);

CREATE TABLE Bonus (
    WORKER_REF_ID INTEGER REFERENCES Worker(WORKER_ID),
    BONUS_AMOUNT INTEGER NOT NULL,
    BONUS_DATE DATE NOT NULL
);
-- Insert data into the Worker table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
  (1, 'Monika', 'Arora', 100000, '2020-02-14', 'HR'),
  (2, 'Niharika', 'Verma', 80000, '2011-02-14', 'Admin'),
  (3, 'Vishal', 'Singhal', 300000, '2020-02-14', 'HR'),
  (4, 'Amitabh', 'Singh', 500000, '2020-02-14', 'Admin'),
  (5, 'Vivek', 'Bhati', 500000, '2011-06-14', 'Admin'),
  (6, 'Vipul', 'Diwan', 200000, '2011-06-14', 'Account'),
  (7, 'Satish', 'Kumar', 75000, '2020-01-14', 'Account'),
  (8, 'Geetika', 'Chauhan', 90000, '2011-04-14', 'Admin');

-- Insert data into the Bonus table
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
  (1, 5000, '2020-02-16'),
  (2, 3000, '2011-06-16'),
  (3, 4000, '2020-02-16'),
  (1, 4500, '2020-02-16'),
  (2, 3500, '2011-02-16'),
  (4, 4500, '2020-02-16'),
  (5, 3500, '2011-02-16');

-- Insert data into the Title table
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
  (1, 'Manager', '2016-02-20'),
  (2, 'Executive', '2016-06-11'),
  (8, 'Executive', '2016-06-11'),
  (5, 'Manager', '2016-06-11'),
  (4, 'Asst. Manager', '2016-06-11'),
  (7, 'Executive', '2016-06-11'),
  (6, 'Lead', '2016-06-11'),
  (3, 'Lead', '2016-06-11');
  SELECT 
    w.FIRST_NAME, 
    w.SALARY, 
    t.WORKER_TITLE
FROM 
    Worker w
INNER JOIN 
    Title t ON w.WORKER_ID = t.WORKER_REF_ID;
--2.QUESTION FOR FINDING THE COUNT OF WORKERS BASED ON THE HIGHEST SALARY	
CREATE OR REPLACE FUNCTION get_worker_count_by_nth_highest_salary(n INTEGER)
RETURNS INTEGER AS
$$
DECLARE
    nth_highest_salary DECIMAL;
    worker_count INTEGER;
BEGIN
    -- Find the nth highest salary
    WITH ranked_salaries AS (
        SELECT SALARY,
               RANK() OVER (ORDER BY SALARY DESC) AS salary_rank
        FROM Worker
    )
    SELECT SALARY INTO nth_highest_salary
    FROM ranked_salaries
    WHERE salary_rank = n;

    -- Count workers with the nth highest salary
    SELECT COUNT(*) INTO worker_count
    FROM Worker
    WHERE SALARY = nth_highest_salary;

    RETURN worker_count;
END;
$$
LANGUAGE plpgsql;
SELECT get_worker_count_by_nth_highest_salary(4);