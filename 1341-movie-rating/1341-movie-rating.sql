# Write your MySQL query statement below
(SELECT u.name AS results
FROM MovieRating r INNER JOIN Users u using(user_id)
GROUP BY user_id
ORDER BY COUNT(r.user_id) DESC , u.name
LIMIT 1)

UNION

(SELECT m.title AS results
FROM MovieRating r INNER JOIN Movies m using(movie_id)
WHERE MONTH(r.created_at) = '02'
GROUP BY r.movie_id
ORDER BY AVG(r.rating) DESC , m.title
LIMIT 1)