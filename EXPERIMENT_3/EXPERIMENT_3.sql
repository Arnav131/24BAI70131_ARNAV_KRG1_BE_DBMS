declare
    -- declaration of the variables --
    emp_id       number := 101;
    emp_name     varchar2(50):= 'Arnav';
    emp_salary   number := 50000;
    bonus        number;
    total_salary number;

-------------------------------------------
begin
    -- calculate bonus --
    bonus := emp_salary * 0.10;
    -- total salary --
    total_salary := emp_salary + bonus;


-------------------------------------------
    -- OUTPUT --
    dbms_output.put_line('Employee Details');
    dbms_output.put_line('----------------------');
    dbms_output.put_line('Employee ID          :'|| emp_id);
    dbms_output.put_line('Employee Name        :'|| emp_name);
    dbms_output.put_line('Employee Base Salary :'||emp_salary);
    dbms_output.put_line('Bonus given (10%)    :'|| bonus);
    dbms_output.put_line('Total Salary         :'||total_salary);
end;