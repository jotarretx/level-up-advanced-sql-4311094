SELECT
  cust.firstName,
  cust.lastName,
  sls.customerId,
  sls.salesAmount,
  sls.soldDate
FROM customer AS cust
FULL OUTER JOIN sales AS sls
ON cust.customerId = sls.customerId