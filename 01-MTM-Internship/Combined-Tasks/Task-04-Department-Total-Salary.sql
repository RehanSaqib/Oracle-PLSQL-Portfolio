/*Task 4: Department Total Salary
Create a Function + Cursor + Procedure.
Requirements:
Create a Function that:
Accepts department_id
Returns total salary of that department.
Create a Cursor that:
Selects all departments.
Create a Procedure that:
Uses the cursor
Calls the function
Displays
Department ID
Total Salary*/


create or replace function tot_sal (p_dep_id in number)
return number
is
tot_salary number ;
begin
  select sum(e.salary) into tot_salary
  from employee e
  where  e.department_id=p_dep_id
  group by e.department_id;
  return tot_salary;
end ;


create or replace procedure show_data
is
total number ;
begin
  for i in (select e.department_id
    from employee e)loop
    total:= tot_sal (i.department_id);
    dbms_output.put_line(i.department_id||' '||total);
    end loop;
end;  


declare
begin
   show_data();
end;