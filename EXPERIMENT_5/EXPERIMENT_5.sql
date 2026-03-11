drop table if exists employee

----------------------------

CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INTEGER
)


-------------------------------
INSERT INTO employee (emp_name, department, salary) VALUES
('Rahul', 'IT', 35001),
('Sneha', 'HR', 42000),
('Amit', 'Finance', 51003),
('Priya', 'Marketing', 60000),
('Rohit', 'IT', 45555),
('Anjali', 'Finance', 38000),
('Vikas', 'Sales', 47007),
('Neha', 'HR', 52000)

----------------------------------

SELECT * FROM employee

----------------------------------


-- querry for even salary --
SELECT emp_id, emp_name, department, salary
FROM employee
WHERE salary % 2 = 0


-------------------------------------

-- querry for odd salary --

SELECT emp_id, emp_name, department, salary
FROM employee
WHERE salary % 2 != 0


-----------------------------------

-- using conditional logic --

SELECT 
    emp_id,
    emp_name,
    department,
    salary,
    CASE
        WHEN salary % 2 = 0 THEN 'Even Salary'
        ELSE 'Odd Salary'
    END AS salary_type
FROM employee