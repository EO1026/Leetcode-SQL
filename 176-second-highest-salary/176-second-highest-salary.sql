# Write your MySQL query statement below
select max(salary) as SecondHighestSalary from
(select salary
, rank() over (order by salary desc) as rk
from Employee
group by salary) a
where rk =2

