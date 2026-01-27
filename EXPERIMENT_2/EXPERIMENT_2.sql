CREATE TABLE employee(
	emp_id NUMERIC PRIMARY KEY,
	emp_name VARCHAR(50),
	department VARCHAR(50),
	salary NUMERIC(10,2),
	joining_date DATE
)

INSERT INTO employee VALUES (101, 'Arnav', 'IT', 19000, '2020-02-12')
INSERT INTO employee VALUES (102, 'Akashveer', 'HR', 22000, '2019-03-10')
INSERT INTO employee VALUES (103, 'Anuj', 'Sales', 35000, '2021-07-18')
INSERT INTO employee VALUES (104, 'Muskan', 'IT', 55000, '2018-09-22')
INSERT INTO employee VALUES (105, 'Aryan', 'Finance', 32000, '2022-01-05')
INSERT INTO employee VALUES (106, 'Manisena', 'Sales', 13000, '2020-12-03')
INSERT INTO employee VALUES (107, 'Shreya', 'HR', 12000, '2017-04-11')

SELECT * FROM employee

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 30000


SELECT department, AVG(salary) AS avg_salary
FROM employee
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC