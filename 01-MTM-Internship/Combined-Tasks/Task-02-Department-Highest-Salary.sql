/*Task 2: Department Highest Salary
Create a Function + Cursor + Procedure.
Requirements:
Create a Function that:
Accepts department_id
Returns the maximum salary in that department.
Create a Cursor that:
Retrieves employees from a specific department.
Create a Procedure that:
Accepts department_id
Uses the cursor
Displays employees whose salary is equal to the highest salary of that department*/


create or replace function rehan_max_sal(p_dept_id in number) 
return number
is
max_sal number ;
begin 
  select max(e.salary) into max_sal
  from employee e 
  where e.department_id=p_dept_id
  group by e.department_id;
  return max_sal;
  
end;    
----------------------------------

create or replace procedure rehan_show_emp(p_dep_id in number )
is
begin
for i in 
  (select e.emp_id,e.first_name,e.department_id,e.salary
  from employee e
  where e.department_id=p_dep_id
  and e.salary = rehan_max_sal(p_dep_id) ) loop
  dbms_output.put_line(i.emp_id||' '||i.first_name||' '||i.department_id||' '||i.salary);
  end loop ;  
end;



declare

begin 
  rehan_show_emp(30);
end ; 