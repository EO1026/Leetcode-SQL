# Write your MySQL query statement below
SELECT query_name, round(avg(rating/position),2) as quality, round(100*sum(case when rating<3 then 1 else 0 end)/count(query_name),2) as poor_query_percentage
From queries
group by query_name                        