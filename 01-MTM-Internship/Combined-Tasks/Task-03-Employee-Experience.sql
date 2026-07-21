/*Task 3: Employee Experience
Create a Function + Cursor + Procedure.
Requirements:
Create a Function that:
Accepts hire_date
Returns total experience in years.
Create a Cursor that:
Selects employee name, hire_date, department_id.
Create a Procedure that:
Uses the cursor
Calls the function
Displays:
Employee Name
Department ID
Hire Date
Experience (Years) */


create or replace function re_hire_date(p_h_date in date)
return number 
is
years number;
begin
  select trunc(months_between(sysdate,e.hire_date)/12) into years
  from employee e
  where e.hire_date=p_h_date;
  return years;
end;



---------------------------

create or replace procedure emp_data
is
begin 
  for i in (select e.first_name,e.department_id,e.hire_date, re_hire_date(e.hire_date) as years
    from employee e )loop
    DBMS_OUTPUT.PUT_LINE(i.first_name||' '||i.department_id||' '||i.hire_date||'     '||  i.years);
    end loop;
end ; 



declare 
begin 
   emp_data();
end ;