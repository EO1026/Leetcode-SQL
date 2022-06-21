# Write your MySQL query statement below
select a.school_id, ifnull(a.score, -1) as 'score'
from
(select*, rank() over(partition by s.school_id order by (s.capacity-e.student_count) asc, e.score asc) as 'rank'
from Schools s left join Exam e on s.capacity >=e.student_count
order by s.school_id) a
where a.rank = 1