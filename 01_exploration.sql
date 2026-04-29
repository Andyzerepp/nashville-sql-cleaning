--| Missing owner names | 31,317 | 31,317 (excluded from analysis) |
--| Missing Property | 159 |
--| Missing Sale | 0 |
SELECT COUNT(*) FROM housing;

SELECT * FROM housing LIMIT 100;

SELECT 
  COUNT(*) - COUNT(`Property Address`) AS missing_address,
  COUNT(*) - COUNT(`Owner Name`) AS missing_owner,
  COUNT(*) - COUNT(`Sale Price`) AS missing_price
FROM housing;

SELECT `Sale Date` FROM housing LIMIT 5;