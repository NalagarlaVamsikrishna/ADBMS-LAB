DELIMITER $$
create   procedure get_employees ()
begin
select*from employees;
end $$
DELIMITER ;
call get_employees();