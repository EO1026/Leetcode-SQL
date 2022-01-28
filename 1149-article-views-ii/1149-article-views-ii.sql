# Write your MySQL query statement below
select distinct viewer_id as id
from (select viewer_id, count(distinct article_id) as ct, view_date
     from views
     group by viewer_id, view_date
     having ct>1 ) as tmp
order by 1 asc