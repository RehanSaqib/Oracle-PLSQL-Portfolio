/*Task 5: Employees Above Department Average
Create a Function + Cursor + Procedure.

Requirements:
Create a Function that:
Accepts department_id
Returns average salary of that department.

Create a Cursor that:
Selects employees from a department.

Create a Procedure that:
Accepts department_id
Uses the cursor
Displays employees whose salary is greater than the department average.
*/

/* Function */

CREATE OR REPLACE FUNCTION avg_sal(p_dep_id IN NUMBER)
RETURN NUMBER
IS
    avg_salary NUMBER;
BEGIN
    SELECT AVG(e.salary)
    INTO avg_salary
    FROM employee e
    WHERE e.department_id = p_dep_id;

    RETURN avg_salary;
END;
/

/* Procedure */

CREATE OR REPLACE PROCEDURE show_avg_emp(p_dep_id IN NUMBER)
IS
BEGIN
    FOR i IN
    (
        SELECT e.emp_id,
               e.first_name,
               e.department_id,
               e.salary
        FROM employee e
        WHERE e.department_id = p_dep_id
    )
    LOOP
        IF i.salary > avg_sal(p_dep_id) THEN
            DBMS_OUTPUT.PUT_LINE(
                i.emp_id || ' ' ||
                i.first_name || ' ' ||
                i.department_id || ' ' ||
                i.salary
            );
        END IF;
    END LOOP;
END;
/

/* Execution */

BEGIN
    show_avg_emp(30);
END;
/