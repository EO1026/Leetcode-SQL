# Write your MySQL query statement below
SELECT
    user1_id,
    user2_id
FROM (
    SELECT
        Relations.user_id AS user1_id,
        SubRelations.user_id AS user2_id,
        DENSE_RANK() OVER(ORDER BY COUNT(SubRelations.follower_id) DESC) AS common_followers_rank
    FROM Relations
    JOIN Relations AS SubRelations
    ON (
        Relations.user_id < SubRelations.user_id
        AND
        Relations.follower_id = SubRelations.follower_id
    )
    GROUP BY Relations.user_id, SubRelations.user_id
) AS CommonFollowers
WHERE common_followers_rank = 1;