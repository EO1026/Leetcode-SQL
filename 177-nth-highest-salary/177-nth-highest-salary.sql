CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct salary
      from
      (select salary, dense_rank() over (order by salary desc) as rk
      from employee)temp1
      where rk = N
  );
END