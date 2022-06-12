WITH diff AS (SELECT *,
        COALESCE(DATEDIFF(LEAD(visit_date,1) OVER(PARTITION BY user_id ORDER BY visit_date ASC), visit_date), DATEDIFF('2021-1-1',visit_date )) AS date_diff
    FROM uservisits)

SELECT user_id, MAX(date_diff) AS biggest_window
FROM diff
GROUP BY user_id
ORDER BY user_id;