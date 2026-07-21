/*Function 01: Department Minimum Salary

Create a Function.

Requirements:
Create a Function that:
Accepts department_id.
Returns the minimum salary in that department.
*/

/* Function */

CREATE OR REPLACE FUNCTION min_sal(p_dep_id IN NUMBER)
RETURN NUMBER
IS
    min_salary NUMBER;
BEGIN
    SELECT MIN(e.salary)
    INTO min_salary
    FROM employee e
    WHERE e.department_id = p_dep_id;

    RETURN min_salary;
END;
/

/* Execution */

DECLARE
    result NUMBER;
BEGIN
    result := min_sal(30);

    DBMS_OUTPUT.PUT_LINE('Minimum Salary = ' || result);
END;
/