SELECT 
  `Parcel ID`,
  `Property Address`,
  `Sale Date`,
  `Sale Price`,
  `Legal Reference`,
  COUNT(*) as duplicate_count
FROM housing
GROUP BY `Parcel ID`, `Property Address`, `Sale Date`, `Sale Price`, `Legal Reference`
HAVING COUNT(*) > 1;
----------------------------------------------
-----------------------------------------
WITH duplicates AS (
  SELECT field1,
    ROW_NUMBER() OVER (
      PARTITION BY `Parcel ID`, `Property Address`, `Sale Date`, `Sale Price`, `Legal Reference`
      ORDER BY field1
    ) AS row_num
  FROM housing
)
SELECT COUNT(*) FROM duplicates WHERE row_num > 1;

-- Delete the duplicates (keep one copy of each)
DELETE FROM housing
WHERE field1 NOT IN (
  SELECT MIN(field1)
  FROM housing
  GROUP BY `Parcel ID`, `Property Address`, `Sale Date`, `Sale Price`, `Legal Reference`
);

