# Write your MySQL query statement below
SELECT  ROUND(MIN(SQRT(POWER((b.x - a.x),2) + POWER((b.y - a.y), 2))), 2) as shortest
FROM Point2D a JOIN Point2D b 
WHERE  (a.x, a.y) <> (b.x, b.y)