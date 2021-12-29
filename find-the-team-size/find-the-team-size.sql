# Write your MySQL query statement below
select e.employee_id, t.team_size
from Employee as e
inner join (select team_id, count(employee_id) as team_size
           from employee
           group by team_id) as t
on e.team_id = t.team_id
order by employee_id