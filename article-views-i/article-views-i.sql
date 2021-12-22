# Write your MySQL query statement below
select distinct Author_id as id 
from views
WHERE viewer_id = author_id
order by author_id asc
