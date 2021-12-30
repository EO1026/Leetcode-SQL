# Write your MySQL query statement below
select distinct title
from Content c
inner join TVProgram t
on t.content_id = c.content_id
where Kids_content="Y"
and year(program_date)=2020 and month(program_date)=06
and content_type ="Movies"