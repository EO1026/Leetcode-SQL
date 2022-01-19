# Write your MySQL query statement below
select new_id as id, student
from (select id, student, 
      if (id = (select max(id) from seat) and mod(id, 2) != 0, id,  
      if (mod(id, 2) = 0, id - 1, id + 1)) as new_id
      from seat) as a
order by new_id