SELECT
  emp.firstName,
  emp.lastName,
  sls.cars_sold
FROM employee AS emp
INNER JOIN (
  SELECT
    employeeId,
    COUNT(DISTINCT salesId) AS cars_sold
  FROM sales
  WHERE soldDate >= '2023-01-01'
  GROUP BY employeeId
  HAVING COUNT(DISTINCT salesId) > 5
) AS sls
USING (employeeId)
ORDER BY cars_sold DESC