# Wrie your MySQL query statement below
WITH NewFriendship AS
(
    SELECT user1_id, user2_id
    FROM Friendship

    union all

    SELECT user2_id as user1_id, user1_id as user2_id
    FROM Friendship
)


SELECT f1.user1_id, f2.user1_id AS user2_id, SUM(f1.user2_id=f2.user2_id) as common_friend
FROM NewFriendship f1 JOIN NewFriendship f2 ON f1.user2_id=f2.user2_id AND f1.user1_id<f2.user1_id
WHERE (f1.user1_id, f2.user1_id) IN (SELECT user1_id, user2_id FROM Friendship)
GROUP BY f1.user1_id, f2.user1_id
HAVING common_friend>=3