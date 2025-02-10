SELECT
  emp.firstName,
  emp.lastName,
  MIN(sls.salesAmount) AS least_expensive,
  MAX(sls.salesAmount) AS most_expensive
FROM employee AS emp
INNER JOIN sales AS sls
USING (employeeId)
WHERE sls.soldDate >= '2023-01-01'
GROUP BY emp.firstName, emp.lastName