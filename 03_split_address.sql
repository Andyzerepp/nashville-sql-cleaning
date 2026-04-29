SELECT `Property Address` FROM housing LIMIT 5;

-- Add new columns
ALTER TABLE housing ADD PropertyStreet TEXT;
ALTER TABLE housing ADD PropertyCity TEXT;

-- Split on the comma
UPDATE housing
SET PropertyStreet = TRIM(SUBSTR(`Property Address`, 1, INSTR(`Property Address`, ',') - 1)),
    PropertyCity   = TRIM(SUBSTR(`Property Address`, INSTR(`Property Address`, ',') + 1));

-- Verify
SELECT `Property Address`, PropertyStreet, PropertyCity
FROM housing LIMIT 10;


