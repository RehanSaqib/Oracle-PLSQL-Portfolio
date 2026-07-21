/*Procedure 01: Employee Basic Information

Create a Procedure.

Requirements:
Create a Procedure that:
Accepts employee_id.

Displays:
Employee Name
Department ID
Salary
Hire Date
*/

/* Procedure */

CREATE OR REPLACE PROCEDURE emp_info(p_emp_id IN NUMBER)
IS
    v_name      VARCHAR2(25);
    v_dep_id    NUMBER;
    v_salary    NUMBER;
    v_hire_date DATE;
BEGIN

    SELECT e.first_name,
           e.department_id,
           e.salary,
           e.hire_date
    INTO v_name,
         v_dep_id,
         v_salary,
         v_hire_date
    FROM employee e
    WHERE e.emp_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Department ID : ' || v_dep_id);
    DBMS_OUTPUT.PUT_LINE('Salary        : ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Hire Date     : ' || v_hire_date);

END;
/

/* Execution */

BEGIN
    emp_info(101);
END;
/