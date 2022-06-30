# Write your MySQL query statement below
WITH CTE AS 
(
    SELECT A.team_id, A.name, RANK() OVER (ORDER BY points DESC, name ASC) AS rnk, 
	A.points + B.points_change AS current_points
    FROM TeamPoints A LEFT JOIN PointsChange B ON A.team_id = B.team_id
)


SELECT C.team_id, C.name, CAST(C.rnk AS SIGNED) - CAST(D.rnk AS SIGNED) AS rank_diff 
FROM CTE C LEFT JOIN 
(SELECT team_id, RANK() OVER (ORDER BY current_points DESC, name ASC) AS rnk FROM CTE
) D ON C.team_id = D.team_id