/*Task 1: Department Salary Report
Create a function, cursor, and procedure that work together.
Requirements:
Create a Function that:
Accepts employee_id
Returns the annual salary (salary * 12).
Create a Cursor that:
Selects employee_id, first_name, salary, department_id from employees.
Create a Procedure that:
Uses the cursor
Calls the function for each employee
Displays:
Employee Name
Department ID
Monthly Salary
Annual Salary*/



create or replace function rehan_annual_sal (p_emp_id in number )
return number 
is
an_sal number ;
begin
  select e.salary*12 into an_sal
  from employee e 
  where e.emp_id=p_emp_id;
  return an_sal;
end;   
---------------------------------------
create or replace procedure rehan_cursor 
is
c_emp_name varchar2(25);
c_dep_id number ;
c_m_salary number ;
c_ann_salary number ;
cursor c_emp is 
select e.first_name,e.department_id,e.salary,rehan_annual_sal(e.emp_id) as "annual salary"
from employee e ;
begin
  open c_emp;
  loop 
    fetch c_emp into c_emp_name,c_dep_id,c_m_salary,c_ann_salary;
    exit when c_emp%NOTFOUND;
    dbms_output.put_line(c_emp_name||' '||c_dep_id||' '||c_m_salary ||' '|| c_ann_salary);
    end loop ;
        CLOSE c_emp;
end; 



declare 

begin
  rehan_cursor();
end ;