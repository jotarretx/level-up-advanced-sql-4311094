WITH monthly_sales AS (
  SELECT
    strftime('%Y', soldDate) AS year,
    strftime('%m', soldDate) AS month,
    count(salesAmount) AS carsSold
  FROM sales
  GROUP BY year, month
  ORDER BY year, month
)
SELECT 
  year,
  month,
  carsSold,
  LAG(carsSold, 1, 0) OVER (ORDER BY year, month) AS carsSoldLM
FROM monthly_sales