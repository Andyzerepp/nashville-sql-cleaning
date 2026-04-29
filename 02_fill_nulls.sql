--| Missing property addresses | 159 |
-- See the problem
SELECT * FROM housing
WHERE `Property Address` IS NULL
LIMIT 10;

SELECT UniqueID FROM housing LIMIT 5;

-- Find rows where we CAN fill in the address
SELECT 
  a.`Parcel ID`, 
  a.`Property Address`, 
  b.`Parcel ID`, 
  b.`Property Address`
FROM housing a
JOIN housing b
  ON a.`Parcel ID` = b.`Parcel ID`
  AND a.`UniqueID` != b.`UniqueID`
WHERE a.`Property Address` IS NULL;

-- Fill them in
UPDATE housing
SET `Property Address` = (
  SELECT b.`Property Address`
  FROM housing b
  WHERE housing.`Parcel ID` = b.`Parcel ID`
    AND housing.`UniqueID` != b.`UniqueID`
    AND b.`Property Address` IS NOT NULL
  LIMIT 1
)
WHERE `Property Address` IS NULL;

-- Verify nulls are gone
SELECT COUNT(*) FROM housing WHERE `Property Address` IS NULL;