WITH monthly_view_2021 AS (
  SELECT
    *,
    strftime('%m', soldDate) AS month,
    strftime('%Y', soldDate) AS year
  FROM sales
)
SELECT
  emp.firstName,
  emp.lastName,
  sls.JanSales,
  sls.FebSales,
  sls.MarSales,
  sls.AprSales,
  sls.MaySales,
  sls.JunSales,
  sls.JulSales,
  sls.AugSales,
  sls.SepSales,
  sls.NovSales,
  sls.DecSales,
  sls.TotalSales
FROM employee AS emp
INNER JOIN (
  SELECT
    employeeId,
    ROUND(SUM(CASE WHEN month = '01' THEN salesAmount ELSE 0 END), 2) AS JanSales,
    ROUND(SUM(CASE WHEN month = '02' THEN salesAmount ELSE 0 END), 2) AS FebSales,
    ROUND(SUM(CASE WHEN month = '03' THEN salesAmount ELSE 0 END), 2) AS MarSales,
    ROUND(SUM(CASE WHEN month = '04' THEN salesAmount ELSE 0 END), 2) AS AprSales,
    ROUND(SUM(CASE WHEN month = '05' THEN salesAmount ELSE 0 END), 2) AS MaySales,
    ROUND(SUM(CASE WHEN month = '06' THEN salesAmount ELSE 0 END), 2) AS JunSales,
    ROUND(SUM(CASE WHEN month = '07' THEN salesAmount ELSE 0 END), 2) AS JulSales,
    ROUND(SUM(CASE WHEN month = '08' THEN salesAmount ELSE 0 END), 2) AS AugSales,
    ROUND(SUM(CASE WHEN month = '09' THEN salesAmount ELSE 0 END), 2) AS SepSales,
    ROUND(SUM(CASE WHEN month = '10' THEN salesAmount ELSE 0 END), 2) AS OctSales,
    ROUND(SUM(CASE WHEN month = '11' THEN salesAmount ELSE 0 END), 2) AS NovSales,
    ROUND(SUM(CASE WHEN month = '12' THEN salesAmount ELSE 0 END), 2) AS DecSales,
    ROUND(SUM(salesAmount),2) AS TotalSales
  FROM monthly_view_2021
  WHERE year = '2021'
  GROUP BY employeeId
) AS sls
USING (employeeId)