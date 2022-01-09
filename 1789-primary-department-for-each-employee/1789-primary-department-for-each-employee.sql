# Write your MySQL query statement below
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' 
OR employee_id not in (SELECT employee_id FROM Employee WHERE primary_flag = 'Y')