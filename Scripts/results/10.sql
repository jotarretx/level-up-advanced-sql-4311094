SELECT
  emp.firstName,
  emp.lastName,
  mdl.model,
  COUNT(model) AS numberSold,
  RANK() OVER (PARTITION BY sls.employeeId ORDER BY COUNT(model) DESC) AS soldRank
FROM sales AS sls
INNER JOIN employee AS emp
USING (employeeId)
INNER JOIN (
  SELECT
    inv.inventoryId,
    mdl.model
  FROM inventory AS inv
  INNER JOIN model AS mdl
  USING (modelId)
) AS mdl
USING (inventoryId)
GROUP BY sls.employeeId, mdl.model
ORDER BY sls.employeeId