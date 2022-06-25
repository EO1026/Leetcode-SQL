# Write your MySQL query statement below
with cte as (select candidate_id, interview_id
from candidates
where years_of_exp >= 2)

select c.candidate_id
from rounds r
join cte c
on r.interview_id = c.interview_id
group by 1
having sum(r.score) > 15