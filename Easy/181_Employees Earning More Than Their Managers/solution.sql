
SELECT e1.name AS EMPLOYEE
FROM Employee e1 LEFT JOIN Employee e2
ON e1.ManagerId = e2.Id WHERE e1.Salary > e2.Salary