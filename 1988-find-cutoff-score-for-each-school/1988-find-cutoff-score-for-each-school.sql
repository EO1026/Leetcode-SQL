# Write your MySQL query statement below
with a as (select capacity, max(student_count)as student_count
from schools 
cross join exam 
where capacity-student_count>=0
group by capacity) # list the max student_count matching each capacity

select school_id, ifnull(min(score),-1) as score 
from schools 
left join a on schools.capacity=a.capacity  #left join is necessary here because there might schools too small for each student_count
left join exam on a.student_count=exam.student_count
group by school_id #group by and min() will resolve the potential situations when two different scores have the same student_count
