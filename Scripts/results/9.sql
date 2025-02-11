SELECT
  sls.salesId,
  sls.inventoryId,
  sls.salesAmount,
  sls.soldDate
FROM sales AS sls
INNER JOIN (
  SELECT DISTINCT 
    inv.inventoryId
  FROM inventory AS inv
  INNER JOIN model AS mdl
  USING (modelId)
  WHERE mdl.EngineType = 'Electric'
) AS elc
USING (inventoryId)