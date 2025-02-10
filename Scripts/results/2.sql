SELECT
  firstName,
  lastName
FROM employee
WHERE employeeId NOT IN (SELECT DISTINCT employeeId FROM sales)
AND title = 'Sales Person'