# Write your MySQL query statement below
select student_id, course_id, grade 
from (select student_id, 
      course_id, 
      grade, 
      rank()over(partition by student_id order by grade desc, course_id) as rk
     from enrollments) as a
where rk = 1
order by student_id asc