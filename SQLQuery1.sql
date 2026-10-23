use ikea_db;
select * from [ikea_db].[dbo].[Year_2009_2010];
select * from [ikea_db].[dbo].[Year_2010_2011];

-- COUNT rows in both tables
select COUNT(*) as total_rows from [ikea_db].[dbo].[Year_2009_2010];
select COUNT(*) as total_rows from [ikea_db].[dbo].[Year_2010_2011];

-- Combine both the tables using UNION ALL() - allows duplicates as well and convert types safely
select 
Invoice,StockCode,Description,Quantity,
COALESCE(
TRY_CONVERT(datetime2,InvoiceDate,120),
TRY_CONVERT(datetime2,InvoiceDate,105)
) AS InvoiceDate,
TRY_CONVERT(decimal(10,2),Price) AS Price,
Customer_ID, Country, '2009-2010' AS SourceSheet
INTO [ikea_db].[dbo].[Ikea_combined]
from [ikea_db].[dbo].[Year_2009_2010]

UNION ALL

select 
Invoice,StockCode,Description,Quantity,
COALESCE(   -- returns first NON NULL as result
TRY_CONVERT(datetime2,InvoiceDate,120), -- yyyy:mm:dd hh:mi:ss
TRY_CONVERT(datetime2,InvoiceDate,105) -- dd:mm:yyyy
) AS InvoiceDate,
TRY_CONVERT(decimal(10,2),Price) AS Price,
Customer_ID, Country, '2010-2011' AS SourceSheet
from [ikea_db].[dbo].[Year_2010_2011]

select * from [ikea_db].[dbo].[Ikea_combined];
select COUNT(*) as total_combined_rows from [ikea_db].[dbo].[Ikea_combined];

-- After conversion of types, check if any failed dates/prices
select COUNT(*) as failed_dates from [ikea_db].[dbo].[Ikea_combined] WHERE InvoiceDate IS NULL;
select COUNT(*) as failed_price from [ikea_db].[dbo].[Ikea_combined] WHERE Price IS NULL;

-- Check 1 : Missing CustomerID
select COUNT(*) as missing_customerid from [ikea_db].[dbo].[Ikea_combined] WHERE Customer_ID IS NULL;

-- Check 2 : Negative or 0 quantity
select COUNT(*) as negative_qty from [ikea_db].[dbo].[Ikea_combined] WHERE Quantity <= 0;

-- Check 3 : Missing Description
select COUNT(*) as missing_desc from [ikea_db].[dbo].[Ikea_combined] WHERE Description IS NULL;

-- Check for duplicates
select Invoice,StockCode,Description,Quantity,InvoiceDate,Price,Customer_ID,Country,COUNT(*) as duplicate_count
from [ikea_db].[dbo].[Ikea_combined]
GROUP BY Invoice,StockCode,Description,Quantity,InvoiceDate,Price,Customer_ID,Country
HAVING COUNT(*)>1;

select * from [ikea_db].[dbo].[Ikea_combined] WHERE Description = 'VINTAGE SNAKES & LADDERS' AND Invoice='489517' AND StockCode = '21912'; -- exact duplicates

-- Remove duplicates (Deduplication) , since there is exact duplicates we need to keep only 1 record

WITH Deduped AS
(
select *, ROW_NUMBER() OVER(PARTITION BY Invoice,StockCode,Description,Quantity,InvoiceDate,Price,Customer_ID,Country ORDER BY (SELECT NULL)) as rn
from [ikea_db].[dbo].[Ikea_combined]
)
select Invoice,StockCode,Description,Quantity,InvoiceDate,Price,Customer_ID,Country,SourceSheet
INTO Final_cleaned_Ikea
from Deduped WHERE rn=1;


select * from Final_cleaned_Ikea;