# Write your MySQL query statement below
SELECT
  sale_date,
  ifnull(SUM(CASE WHEN fruit = 'oranges' THEN -sold_num ELSE sold_num END),0) diff
FROM sales
GROUP BY sale_date
