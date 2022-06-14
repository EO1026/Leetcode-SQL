# Write your MySQL query statement below
SELECT
    DISTINCT name,mail
FROM (SELECT user_id, mail, name, contest_id,
        contest_id - ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY contest_id) AS diff,
        COUNT(CASE user_id WHEN gold_medal THEN TRUE END) OVER(PARTITION BY user_id ORDER BY contest_id) AS gold_medal_counts
    FROM Users
    JOIN Contests
    ON ( 
        user_id = gold_medal
        OR
        user_id = silver_medal
        OR
        user_id = bronze_medal
    )
) AS UserWinningContests
GROUP BY user_id, diff
HAVING (
    COUNT(contest_id) >= 3
    OR
    MAX(gold_medal_counts) >= 3
);