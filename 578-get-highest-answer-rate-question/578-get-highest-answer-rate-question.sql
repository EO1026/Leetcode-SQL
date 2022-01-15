# Write your MySQL query statement below
SELECT question_id AS survey_log
FROM surveylog
GROUP BY question_id
ORDER BY SUM(action="answer")/SUM(action="show") DESC
LIMIT 1; 