
-- THIS IS CREATE PROCEDURE --

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
);


-- INSERT OPERATION --
CREATE OR REPLACE PROCEDURE insert_student(
    p_name VARCHAR,
    p_age INT,
    p_department VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO students(name , age , department)
    VALUES(p_name , p_age,p_department);
    RAISE NOTICE 'Student Inserted Successfully.';
END;
$$;

-- CALLING --
CALL insert_student('Arnav' , 20 , 'CSE');






-------------------------------------------------------------------------
-------------------------------------------------------------------------


-- READ OPERATION --
CREATE OR REPLACE PROCEDURE get_student(p_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    rec students%ROWTYPE;
BEGIN
    SELECT * INTO rec FROM students WHERE id = p_id;
    IF FOUND THEN
        RAISE NOTICE 'ID: %, Name: %, Age: %, Dept: %',
            rec.id, rec.name, rec.age, rec.department;
    ELSE
        RAISE NOTICE 'Student not found.';
    END IF;
END;
$$;

-- Call
CALL get_student(1);





---------------------------------------------------------------------------
---------------------------------------------------------------------------






-- UPDATE OPERATION --
CREATE OR REPLACE PROCEDURE update_student(
    p_id INT,
    p_name VARCHAR,
    p_age INT,
    p_department VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE students
    SET name = p_name,
        age = p_age,
        department = p_department
    WHERE id = p_id;

    IF FOUND THEN
        RAISE NOTICE 'Student updated successfully.';
    ELSE
        RAISE NOTICE 'Student ID not found.';
    END IF;
END;
$$;

-- Call
CALL update_student(1, 'ARNAV', 21, 'IT');





-- =================================================================================== --











-- DELETE OPERATION --
CREATE OR REPLACE PROCEDURE delete_student(p_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM students WHERE id = p_id;

    IF FOUND THEN
        RAISE NOTICE 'Student deleted successfully.';
    ELSE
        RAISE NOTICE 'Student ID not found.';
    END IF;
END;
$$;

-- Call
CALL delete_student(1);




-- READ ALL -- 
CREATE OR REPLACE PROCEDURE get_all_students()
LANGUAGE plpgsql
AS $$
DECLARE
    rec students%ROWTYPE;
BEGIN
    FOR rec IN SELECT * FROM students LOOP
        RAISE NOTICE 'ID: %, Name: %, Age: %, Dept: %',
            rec.id, rec.name, rec.age, rec.department;
    END LOOP;
END;
$$;

-- Call
CALL get_all_students();








-- TO VERIFY RESULTS --
SELECT * FROM students;