SELECT f1.follower, count(DISTINCT f2.follower) as num
FROM follow f1
JOIN follow f2
ON f1.follower = f2.followee
GROUP BY f1.follower
HAVING num>=1
ORDER BY f1.follower
