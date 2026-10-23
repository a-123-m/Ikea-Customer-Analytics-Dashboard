# IKEA Gifting | Customer Analytics & RFM Segmentation
## An End-to-End Data Analytics Project using SQL Server, Python and Power BI
<p align="center">
<img width="802" height="312" alt="image" src="https://github.com/user-attachments/assets/79e9e2db-5132-438b-baea-9c8bc451238c" />
</p>

# Project Overview
An end-to-end customer analytics solution for IKEA Gifting, a UK-based online retailer specializing in giftware and home decor.
Using historical retail transaction data from December 2009 - December 2011, I built a repeatable analytics workflow to clean transactional records, calculate customer-level metrics, segment customers using Recency, Frequency and Monetary (RFM) analysis, identify customers inactive for 90 days and present actionable insights through a three-page interactive Power BI report.

The project combines SQL-based data preparation, Python-based customer segmentation and Power BI reporting to translate raw transactional data into business insights.

| Component | Details |
|---|---|
| **Business Domain** | E-commerce / Retail Analytics |
| **Business Problem** | Customer value identification and retention analysis |
| **Data Source** | UCI Machine Learning Repository - Online Retail II Dataset |
| **Data Period** | December 2009 – December 2011 |
| **Original Dataset Size** | Approximately 1.07 million transaction records |
| **Data Extraction & Cleaning** | Microsoft SQL Server |
| **Customer Segmentation** | Python, Pandas & NumPy |
| **Data Visualization** | Microsoft Power BI |
| **Analysis Techniques** | Data Cleaning, RFM Segmentation, Churn Flagging, Trend Analysis & KPI Reporting |
| **Final Deliverable** | Three-page Interactive Power BI Report |

# Business Problem
IKEA Gifting's transaction history contains valuable information about purchasing behavior, customer value and engagement. However, transaction records alone do not provide a structured view of which customers contribute the most revenue or which customers may be disengaging.
Without customer-level analysis, marketing and retention teams may struggle to:
* Distinguish high-value customers from occasional buyers.
* Identify customers who have stopped purchasing.
* Understand customer purchasing patterns over time.
* Compare customer value and retention risk across geographic markets.
* Prioritize customer engagement and retention activities.

The objective of this project was to transform historical transaction data into a structured customer analytics solution that supports data-driven decision-making.

# Business Objectives
* Extract and clean raw transaction data using SQL Server Management Studio (SSMS).
* Prepare a reliable, analysis-ready transaction dataset.
* Calculate customer-level Recency, Frequency and Monetary metrics using Python.
* Assign customer scores and meaningful RFM segments.
* Flag customers with no recorded purchase activity in the trailing 90 days.
* Analyze customer value, revenue contribution and retention trends.
* Build a three-page interactive Power BI report.
* Analyze and identify key insights

# Dashboard Walkthrough
https://github.com/user-attachments/assets/fdbdad08-fa3b-4bd6-8be8-fd95544727ea

# Dashboard Preview
<img width="1285" height="801" alt="Screenshot 2026-10-23 130344" src="https://github.com/user-attachments/assets/a2842ccb-b370-4c23-82ee-a4d03fbb768f" />
<img width="1281" height="807" alt="Screenshot 2026-10-23 130419" src="https://github.com/user-attachments/assets/69298b00-ce58-452f-b2db-fe8036f4b09d" />
<img width="1282" height="802" alt="Screenshot 2026-10-23 130434" src="https://github.com/user-attachments/assets/877a9795-cebc-4bd7-8b0e-71b4ba0baa19" />
<img width="1286" height="803" alt="Screenshot 2026-10-23 130454" src="https://github.com/user-attachments/assets/9b52da99-5476-4a56-9feb-4faef6f7e402" />
<img width="1287" height="802" alt="Screenshot 2026-10-23 130512" src="https://github.com/user-attachments/assets/9c06a9a1-15a6-4627-be33-1a34e8f0edf1" />
<img width="1286" height="806" alt="Screenshot 2026-10-23 130538" src="https://github.com/user-attachments/assets/8457f6ab-c8db-408c-8683-4f346e32a6e7" />

# Dataset
The project uses the Online Retail II dataset, available through the UCI Machine Learning Repository.
The dataset contains historical online retail transactions spanning December 2009 to December 2011.
The original dataset contains approximately 1.07 million records and includes invoice details, product descriptions, quantities, prices, customer identifiers and countries.

## Data Dictionary
| Column | Description |
|---|---|
| `Invoice` | Transaction or invoice identifier |
| `StockCode` | Product identifier |
| `Description` | Product description |
| `Quantity` | Units purchased |
| `InvoiceDate` | Date and time of the transaction |
| `Price` | Unit price of the product |
| `Customer ID` | Customer identifier |
| `Country` | Customer's country |

# Technology stack
| Tool | Role in the Project |
|---|---|
| Microsoft SQL Server | Data extraction, cleaning, transformation and validation |
| Python | Customer-level analysis, RFM scoring and segment assignment |
| Jupyter Notebook | Interactive Python analysis and documentation |
| Microsoft Power BI | Interactive report development and business storytelling |
| DAX | Measures and KPI calculations |

# End-to-End Workflow

<ol>
  <li><b>Business Understanding</b></li>
  <p>Before working with the data, I tried to understand the business problem, expected deliverables and key analytical questions.</p>
  <li><b>Data Extraction and Cleaning in SQL Server</b></li>
  <p>The raw dataset was imported in SQL server, the source data was inspected and important data cleaning steps like standardizing data types, identify incomplete records, identify duplicate records, handling negative values etc. and then the final cleaned analysis ready table was created. </p>
  <li><b>Customer-Level RFM Analysis in Python</b></li>
  <p>After cleaning the data in SQL Server, Python was used to aggregate customer transactions, calculate RFM metrics and assign customer segments.</p>
  <li><b>Interactive Dashboard Development</b></li>
  <p>A 3 page interactive PowerBI report that shows overall business performance and RFM analysis by segments were created with interactive bookmarks, filters and drill through.</p>
</ol>

# Business Questions
* Who are our most valuable customers, and how much revenue do they actually contribute to the business?
* Which customers have gone quiet and are at risk of churning entirely?
* How does customer value and retention trend over time, month over month and year over year?
* How does customer value and churn risk differ across the geographic markets we serve?
* What specific, concrete actions should the business take for each customer segment identified?

# Key Insights

## Business Overview
* **High Churn:** 50.86% of customers churned, highlighting a need to improve retention. 
* **Top Revenue Segment:** Champions contribute 68% of total revenue, making them important to retain. 
* **At-Risk Customers:** At Risk customers generate $1.59M; targeted offers may encourage repeat purchases. 
* **Lost Customers:** 1,524 customers are Lost, making it important to understand why they left. 
* **Monthly Revenue:** November records the highest revenue ($2.32M), while February records the lowest ($0.95M). 
* **Quarterly Revenue:** Q4 generates the highest revenue at $6.2M, suggesting stronger year-end sales. 
* **Annual Revenue:** Revenue remains stable around $8.3M–$8.4M after 2010, indicating slower growth. 
* **Customer Trend:** Customer count peaks in November before declining in December, which may reflect seasonal patterns. 
* **Customer Growth:** Customer count remains around 4.2K in 2010 and 2011, suggesting limited growth during this period.

## RFM Analysis
* **Customer Value:** Champions have the highest average customer value (9.2K), making them the most valuable segment.
* **RFM Scores:** Champions lead in Recency, Frequency, and Monetary scores, while Lost customers score lowest in Recency and Frequency.
* **Monthly Churn:** Churn drops to around 25% in September but rises to 32.62% in December, highlighting a need to monitor retention.
* **Quarterly Churn:** Churn declines from 48.02% in Q1 to 34.14% in Q4, indicating improved retention over the year.
* **Annual Churn:** Churn peaks at 56.30% in 2010 before falling to 31.52% in 2011.
* **Retention Opportunity:** Loyal and At Risk customers have an average value of around 1.9K, making them potential targets for retention campaigns.
* **Country Performance:** The UK has the largest customer base (5,353) and the highest revenue, with moderate Recency and strong Frequency and Monetary scores.
* **Customer Value by Country:** EIRE has the highest average customer value (123K), followed by Singapore and the Netherlands (25K each), while Denmark records the lowest (6K).
