SELECT 
  `UniqueID`,
  `Parcel ID`,
  `Sale Date`,
  `Sale Price`
FROM housing
LIMIT 10;

CREATE VIEW first_purchase AS
SELECT 
  `Parcel ID`,
  MIN(`Sale Date`) AS first_purchase_date,
  STRFTIME('%Y-%m', MIN(`Sale Date`)) AS cohort_month
FROM housing
WHERE `Sale Price` > 0
GROUP BY `Parcel ID`;


SELECT * FROM first_purchase LIMIT 10;

CREATE VIEW cohort_data AS
SELECT 
  f.`Parcel ID`,
  f.cohort_month,
  STRFTIME('%Y-%m', h.`Sale Date`) AS purchase_month,
  CAST(
    (STRFTIME('%Y', h.`Sale Date`) - STRFTIME('%Y', f.first_purchase_date)) * 12 +
    (STRFTIME('%m', h.`Sale Date`) - STRFTIME('%m', f.first_purchase_date))
  AS INTEGER) AS month_number
FROM housing h
JOIN first_purchase f ON h.`Parcel ID` = f.`Parcel ID`
WHERE h.`Sale Price` > 0;

SELECT * FROM cohort_data LIMIT 1000;
--------------------------------------------


SELECT 
  cohort_month,
  month_number,
  COUNT(DISTINCT `Parcel ID`) AS customers
FROM cohort_data
WHERE month_number BETWEEN 0 AND 11
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;


SELECT 
  c.cohort_month,
  c.month_number,
  c.customers,
  ROUND(100.0 * c.customers / first_month.customers, 1) AS retention_pct
FROM (
  SELECT 
    cohort_month,
    month_number,
    COUNT(DISTINCT `Parcel ID`) AS customers
  FROM cohort_data
  WHERE month_number BETWEEN 0 AND 11
  GROUP BY cohort_month, month_number
) c
JOIN (
  SELECT cohort_month, COUNT(DISTINCT `Parcel ID`) AS customers
  FROM cohort_data
  WHERE month_number = 0
  GROUP BY cohort_month
) first_month ON c.cohort_month = first_month.cohort_month
ORDER BY c.cohort_month, c.month_number;
