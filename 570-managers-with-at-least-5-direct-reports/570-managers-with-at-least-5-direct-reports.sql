# Write your MySQL query statement below
select e.name as name
from (select managerid, count(id) ct from employee group by managerid having ct>=5 ) p
join employee e
on p.managerid = e.id