# Write your MySQL query statement below
WITH RECURSIVE nums AS (
    SELECT 1 AS value
    UNION ALL
    SELECT value + 1 AS value
    FROM nums
    WHERE nums.value < (select max(customer_id) from Customers)
)
SELECT value as ids
FROM nums
left join Customers
on nums.value = Customers.customer_id
where customer_id is null