WITH yearly_view AS (
  SELECT
    *,
    strftime('%Y', soldDate) AS year
  FROM sales
)
SELECT
  year,
  ROUND(SUM(salesAmount),2) AS salesAmount,
  CAST(COUNT(salesId) AS INTEGER) AS totalSales
FROM yearly_view
GROUP BY year
ORDER BY year DESC