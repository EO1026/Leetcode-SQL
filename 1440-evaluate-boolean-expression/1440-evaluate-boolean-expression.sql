# Write your MySQL query statement below
select e.left_operand,
       e.operator,
       e.right_operand,
       if(case e.operator
           when '=' then l.value = r.value
           when '>' then l.value > r.value
           when '<' then l.value < r.value
       end = 1, 'true', 'false') as value
from Expressions e
left join Variables l on e.left_operand = l.name
left join Variables r on e.right_operand = r.name
