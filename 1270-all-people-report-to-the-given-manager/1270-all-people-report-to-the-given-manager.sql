# Write your MySQL query statement below
SELECT E1.employee_id
FROM Employees AS E1
LEFT JOIN Employees AS E2
ON E1.manager_id = E2.employee_id
LEFT JOIN Employees AS E3
ON E2.manager_id = E3.employee_id
WHERE E3.manager_id = 1
AND E1.employee_id != 1