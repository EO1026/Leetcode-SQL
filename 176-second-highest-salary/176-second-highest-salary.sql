# Write your MySQL query statement below
select if (max(r) < 2, null, a.salary) as SecondHighestSalary 
from (select id, salary, dense_rank() over (order by salary desc) as r from Employee) as a
where r = 2

