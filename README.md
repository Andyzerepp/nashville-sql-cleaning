# Nashville Housing-SQL Data Cleaning Project

## Overview
Cleaned and standardized a 56,000-row real estate dataset using SQL in DB Browser for SQLite. 
Identified data quality issues, applied targeted fixes, and performed a final analysis query 
to validate the cleaned dataset.

## Tools Used
- SQL (SQLite)
- DB Browser for SQLite

## Dataset
- Source: Kaggle-Nashville Housing Data
- Size: 56,000+ rows of property sales records
- Link: https://www.kaggle.com/datasets/tmthyjames/nashville-housing-data

## Data Quality Issues Found
| Issue | Before | After |
|-------|--------|-------|
| Missing property addresses | 159 | 143 (116 unresolvable) |
| Missing owner names | 31,317 | 31,317 (excluded from analysis) |
| Missing sale prices | 0 | 0 |
| Duplicate rows | 104 | 0 |

## Cleaning Steps
1. Filled 16 missing addresses via ParcelID self-join
2. Split PropertyAddress into Street and City columns
3. Identified and removed 104 duplicate records

## Key Insight from Final Analysis
Nashville had the highest average sale price at $366,624.76, compared to the dataset average of $327,506.91-approximately 12% above the market average, suggesting stronger demand or higher-value property concentration in the Nashville city proper relative to surrounding areas


## Files
<img width="358" height="451" alt="Sold as vacant count" src="https://github.com/user-attachments/assets/3d5f8692-e43d-4e44-935f-87b9caf3f128" />
<img width="459" height="665" alt="Split Address" src="https://github.com/user-attachments/assets/70b808e5-4475-41d3-b822-a98455842ab0" />
<img width="420" height="430" alt="Data Count" src="https://github.com/user-attachments/assets/c413f320-3385-4a7b-b5ea-ede0121c085c" />
