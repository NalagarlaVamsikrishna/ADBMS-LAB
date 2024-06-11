DELIMITER $$
create   procedure finds_employees (in id int)
begin
select*from employees ;
end $$
DELIMITER ;
call finds_employees(101);
