# Write your MySQL query statement below
with cte1 as (
	select activity, 
	           count(*) as count, 
               dense_rank() over(order by count(*) desc) as 'rnk'
     from Friends  
     group by activity)
select cte1.activity from cte1 where cte1.rnk <> 1 and cte1.rnk <> (select max(cte1.rnk) from cte1)