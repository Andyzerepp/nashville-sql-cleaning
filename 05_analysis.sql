SELECT 
  `Property City`,
  COUNT(*) AS total_sales,
  ROUND(AVG(`Sale Price`), 2) AS avg_sale_price,
  ROUND(MIN(`Sale Price`), 2) AS min_price,
  ROUND(MAX(`Sale Price`), 2) AS max_price
FROM housing
WHERE `Sale Price` > 0
GROUP BY `Property City`
ORDER BY avg_sale_price DESC
LIMIT 15;

















SELECT `Sold As Vacant`, COUNT(*) 
FROM housing 
GROUP BY `Sold As Vacant`;




ALTER TABLE housing drop SaleDateCleaned;










SELECT `Property Street`, `Property City` 
FROM housing 
WHERE `Property Street` IS NOT NULL
LIMIT 10;




















