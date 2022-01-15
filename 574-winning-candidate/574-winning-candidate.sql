# Write your MySQL query statement below
select c.name 
from candidate c
inner join vote v
on c.ID=v.candidateID
group by v.candidateID
order by count(candidateId) desc
limit 1