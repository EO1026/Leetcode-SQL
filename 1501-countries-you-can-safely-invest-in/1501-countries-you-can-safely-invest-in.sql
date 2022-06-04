# Write your MySQL query statement below
WITH t1 AS (SELECT caller_id, duration
            FROM calls
            UNION ALL
            SELECT callee_id, duration
            FROM calls),
t2 AS (SELECT LEFT(p.phone_number, 3) country_code, 
              AVG(t1.duration) call_duration
        FROM person p
        JOIN t1
        ON p.id = t1.caller_id
        GROUP BY country_code)
                
SELECT ct.name country
FROM t2
JOIN country ct
ON t2.country_code = ct.country_code
WHERE t2.call_duration > (SELECT AVG(t1.duration) FROM t1)