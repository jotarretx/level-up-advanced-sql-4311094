WITH monthly_sales AS (
  SELECT
    strftime('%Y', soldDate) AS year,
    strftime('%m', soldDate) AS month,
    SUM(salesAmount) AS salesAmount
  FROM sales
  GROUP BY year, month
)
SELECT
  year,
  month,
  salesAmount,
  SUM(salesAmount) OVER (
    PARTITION BY year
    ORDER BY year, month
  ) AS annualSalesRunningTotal
FROM monthly_sales