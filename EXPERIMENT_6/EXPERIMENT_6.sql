drop table if exists employee;



create table employee
(
	emp_id int primary key,
	emp_name varchar(50),
	salary int
);




insert into employee values(101, 'Arnav', 10000);
insert into employee values(102, 'Anshu', 20000);
insert into employee values(103, 'Anuj', 25000);
insert into employee values(104, 'Akshveer', 32000);
insert into employee values(105, 'Akash', 30000);

select * from employee




-----------------------Implicit cursor----------------------------

update employee
set salary = salary + 3000
where emp_id = 101;

select * from employee








--------------------------Explicit Cursor-----------------------------------
DO $$
DECLARE
    emp INT;
    sal INT;
    emp_cursor CURSOR FOR 
        SELECT emp_id, salary FROM employee;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp, sal;
        EXIT WHEN NOT FOUND;

        UPDATE employee
        SET salary = sal * 1.10
        WHERE emp_id = emp;

    END LOOP;

    CLOSE emp_cursor;
END $$;

SELECT * FROM employee;