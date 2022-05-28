# Write your MySQL query statement below
SELECT 
    a.id AS p1, 
    b.id AS p2, 
    ABS(a.x_value - b.x_value) * ABS(a.y_value - b.y_value) AS area
FROM Points a JOIN Points b
ON a.id < b.id AND a.x_value <> b.x_value AND a.y_value <> b.y_value
ORDER BY area DESC, p1, p2