# Write your MySQL query statement below
SELECT
  sale_date,
  SUM(CASE WHEN fruit = 'oranges' THEN -sold_num ELSE sold_num END) diff
FROM sales
GROUP BY sale_date
