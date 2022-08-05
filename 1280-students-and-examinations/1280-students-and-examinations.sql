# Write your MySQL query statement below
select s.student_id, student_name, su.subject_name, coalesce(count(e.student_id),0) as attended_exams
from students s
cross join subjects su
left join Examinations e 
on e.student_id=s.student_id and su.subject_name = e.subject_name
group by 1,2,3
order by 1,3

