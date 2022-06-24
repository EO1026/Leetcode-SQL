# Write your MySQL query statement below
WITH platform_table AS
(SELECT 'Android' AS platform
UNION
SELECT 'IOS'
UNION 
SELECT 'Web')
,experiment_table AS
(SELECT 'Reading' AS experiment_name
UNION
SELECT 'Sports'
UNION 
SELECT 'Programming')
,pairs AS
(SELECT *
FROM platform_table,experiment_table)

SELECT pairs.platform,pairs.experiment_name,IFNULL(num_experiments,0) AS num_experiments
FROM pairs
LEFT JOIN
(SELECT platform,experiment_name,COUNT(experiment_id) AS num_experiments
FROM Experiments
GROUP BY platform,experiment_name) AS t
USING(platform,experiment_name)