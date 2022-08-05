# Write your MySQL query statement below
select distinct author_id as id
from(select article_id, author_id, count(viewer_id)
from views 
where viewer_id=author_id
group by article_id, author_id
having count(viewer_id)>=1
) a
order by 1 asc
