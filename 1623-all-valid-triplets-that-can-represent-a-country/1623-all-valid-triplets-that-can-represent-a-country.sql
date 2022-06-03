# Write your MySQL query statement below

SELECT
  a.student_name member_a,
  b.student_name member_b,
  c.student_name member_c
FROM schoola a,
  schoolb b,
  schoolc c
WHERE a.student_name != b.student_name
  AND b.student_name != c.student_name
  AND c.student_name != a.student_name
  AND a.student_id  != b.student_id
  AND b.student_id  != c.student_id
  AND c.student_id  != a.student_id
