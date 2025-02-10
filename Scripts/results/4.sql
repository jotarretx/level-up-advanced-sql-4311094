SELECT
  emp.firstName,
  emp.lastName,
  emp.title,
  CASE WHEN sls.cars_sold IS NULL THEN 0
    ELSE sls.cars_sold END AS cars_sold
FROM employee AS emp
LEFT JOIN (
  SELECT
    employeeId,
    COUNT(DISTINCT salesId) AS cars_sold
  FROM sales
  GROUP BY employeeId
) AS sls
USING(employeeId)
WHERE emp.title = 'Sales Person'
ORDER BY cars_sold DESC;