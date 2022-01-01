# Write your MySQL query statement below
SELECT
  trim(LOWER(product_name)) product_name,
  DATE_FORMAT(sale_date, '%Y-%m') sale_date,
  COUNT(*) total
FROM Sales
GROUP BY TRIM(LOWER(product_name)),DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY product_name,sale_date
 
