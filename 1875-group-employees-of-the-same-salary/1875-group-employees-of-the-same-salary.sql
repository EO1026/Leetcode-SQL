# Write your MySQL query statement below
select *
, dense_rank() over (order by salary) as team_id
from employees where salary in
(
select salary from employees
group by salary having count(*)>1
) order by team_id, employee_id
;

