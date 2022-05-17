# Write your MySQL query statement below
SELECT t.visited_on, t.amount, round(t.amount/7,2) as average_amount
FROM
    (SELECT
        min(t1.visited_on) over () as inital_day,
        t1.visited_on,
        sum(t1.amount) over (order by visited_on rows between 6 preceding and current row) as amount
    FROM 
        (SELECT sum(amount) as amount, visited_on FROM Customer GROUP BY visited_on) t1) t
WHERE datediff(t.visited_on, t.inital_day)>=6 -- make sure we start from day 7
