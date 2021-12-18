# Write your MySQL query statement below
SELECT customer_number 
FROM (SELECT customer_number, COUNT(order_number) 
     FROM orders
     GROUP BY customer_number
     ORDER BY COUNT(order_number) DESC
     LIMIT 1) AS a