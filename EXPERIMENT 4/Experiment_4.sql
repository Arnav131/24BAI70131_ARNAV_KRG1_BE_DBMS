DECLARE
    num INTEGER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is positive.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is non-positive.');
    END IF;
END;

/



DECLARE
    marks INTEGER := 85;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A+ | Status: Excellent');
    ELSIF marks >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A | Status: Very Good');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B | Status: Satisfactory');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: F | Status: Needs Improvement');
    END IF;
END;
/


DECLARE
    day_num  INTEGER := 3;
    day_name VARCHAR2(20);
BEGIN
    day_name :=
        CASE day_num
            WHEN 1 THEN 'Monday'
            WHEN 2 THEN 'Tuesday'
            WHEN 3 THEN 'Wednesday'
            WHEN 4 THEN 'Thursday'
            WHEN 5 THEN 'Friday'
            WHEN 6 THEN 'Saturday'
            WHEN 7 THEN 'Sunday'
            ELSE 'Invalid Day Number'
        END;

    DBMS_OUTPUT.PUT_LINE(
        'Input Number: ' || day_num || ', Day Name: ' || day_name
    );
END;
/