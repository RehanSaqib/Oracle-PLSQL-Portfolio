/*Cursor 01: Department Employee Report

Create a Cursor.

Requirements:
Create an Explicit Cursor that:
Retrieves all employees from a specific department.

Display:
Employee ID
Employee Name
Department ID
Salary
*/

/* Procedure */

CREATE OR REPLACE PROCEDURE dept_emp_report(p_dep_id IN NUMBER)
IS
    v_emp_id   NUMBER;
    v_name     VARCHAR2(25);
    v_dep_id   NUMBER;
    v_salary   NUMBER;

    CURSOR c_emp IS
        SELECT e.emp_id,
               e.first_name,
               e.department_id,
               e.salary
        FROM employee e
        WHERE e.department_id = p_dep_id;
BEGIN

    OPEN c_emp;

    LOOP

        FETCH c_emp
        INTO v_emp_id,
             v_name,
             v_dep_id,
             v_salary;

        EXIT WHEN c_emp%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_emp_id || ' ' ||
            v_name || ' ' ||
            v_dep_id || ' ' ||
            v_salary
        );

    END LOOP;

    CLOSE c_emp;

END;
/

/* Execution */

BEGIN
    dept_emp_report(30);
END;
/