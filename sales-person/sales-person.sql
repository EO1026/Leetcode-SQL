# Write your MySQL query statement below
SELECT name 
FROM salesperson 
WHERE sales_id NOT IN (SELECT o.sales_id
                       FROM orders as o
                       LEFT JOIN company as c
                       ON c.com_id=o.com_id
                       WHERE c.name = "RED") 



