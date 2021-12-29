# Write your MySQL query statement below
select ad_id, ifnull (round(sum(case when action = "clicked" then 1 else 0 end )/sum(case when action = "clicked" then 1 when action = "Viewed" then 1 else 0 end )*100,2),0) as ctr
from ads
group by ad_id
order by ctr DESC, ad_id ASC