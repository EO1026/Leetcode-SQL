CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
    select if (max(r) < N, null, Salary) 
    from ( select *, 
          dense_rank() over (order by salary desc) as r 
          from Employee
    ) as t
    where r = N
  );END