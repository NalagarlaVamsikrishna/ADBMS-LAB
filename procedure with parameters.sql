DELIMITER $$
create   procedure find_employees (in id int)
begin
select*from employees where emp_id = id;
end $$
DELIMITER ;
call find_employees(0);