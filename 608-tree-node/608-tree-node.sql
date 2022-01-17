# Write your MySQL query statement below
SELECT DISTINCT t1.id, (CASE
    WHEN t1.p_id is Null THEN 'Root'
    WHEN t1.id = t2.p_id THEN 'Inner'
    ELSE 'Leaf'
    END) AS type
FROM tree t1 LEFT JOIN tree t2
ON t1.id = t2.p_id
ORDER BY t1.id