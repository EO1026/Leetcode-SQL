# Write your MySQL query statement below
select distinct a.viewer_id as id
from Views a
join Views b
on a.view_date=b.view_date and a.viewer_id=b.viewer_id
where a.article_id!=b.article_id
order by id
 
