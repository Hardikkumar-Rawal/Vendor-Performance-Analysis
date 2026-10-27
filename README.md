
# Vendor performance Analysis

## 1. Project Overview

This project brings vendor purchasing, sales, and freight information together to analyze vendor and product performance. The workflow uses SQL Server (SSMS) to prepare and combine the data, Python (Jupyter Notebook) for data cleaning and exploratory analysis, and Power BI to present business metrics in an interactive dashboard.
The supplied cleaned dataset contains 10,692 rows and 18 columns from **million of records**. It includes vendor and brand identifiers, product descriptions, freight costs, purchase and sales measures, and derived performance metrics.


## 2. Business Questions

 1. Identify underperforming brands that require promotional or pricing adjustments.

 2. Determine top vendors contributing to sales and gross profit.

 3. Analyze the impact of bulk purchasing on unit costs.
 4. Assess inventory turnover to reduce holding costs and improve efficiency.
 5. Investigate the profitability between high-performing and low-performing
vendors.

## 3. Tools Used

- #### SSMS (SQL):
  Data aggregation, Joins, and Creation of Summary Tables

- #### Jupyter Notebook (Python): 
  Data Preparation and Exploratory Analysis

  Pandas — Tabular data manipulation and CSV export

  NumPy — Numerical checks and handling infinite values

  SQLAlchemy + pyodbc — Connection between Python and SQL Server

- #### Power BI:
  Dashboarding and Visual Analytics
## 4. Project Workflow

#### 1. SQL Server / SSMS
- Summarize and combine vendor freight, purchase, and sales information into a vendor-sales summary table.
- Include product descriptions alongside vendor and brand details.
- Make the consolidated table for analysis.

#### 2. Python / Jupyter Notebook
- Connect to SQL Server using SQLAlchemy and `pyodbc`.
- Load the `Vendor____Sales____Summary` table into a pandas DataFrame.
- Inspect data types, missing values, vendor names, and product descriptions.
- Convert `volume` to a numeric type and trim extra whitespace from `vendorname`.
- Fill missing values with `0` before calculating derived fields.
- Calculate gross profit, profit margin, stock turnover, and sales-to-purchase ratio.

- Export the cleaned dataset to CSV and write the DataFrame back to SQL Server.

#### 3. Power BI
- Use the cleaned vendor-sales-summary data to build a Vendor Performance Dashboard.
- Include KPI cards and visual analyses for sales, purchases, profit, purchase contribution, vendor sales, product sales, low-stock-turnover vendors, and brand performance.
<img width="1061" height="596" alt="Vendor Performance Analysis" src="https://github.com/user-attachments/assets/1d92b892-17d8-4f13-8ef8-cd5fc428c37a" />

## 5. Skills Demonstrated
- SQL Server (SSMS): Data extraction, joins, aggregations, and table creation

- Python: Data analysis and manipulation

- Pandas & NumPy: Data cleaning, missing-value handling, and numerical calculations

- Exploratory Data Analysis (EDA): Data inspection and quality checks

- Feature Engineering: Calculating gross profit, profit margin, and stock turnover

- Database Connectivity: Connecting Python to SQL Server using SQLAlchemy and pyodbc

- Power BI: Interactive dashboards, KPI cards, and data visualization
## 6. Conclusion
This project demonstrates an end-to-end analytics workflow: consolidating data in SQL Server, cleaning and engineering features in Python, and communicating vendor and product performance through Power BI. The cleaned CSV and notebook provide the data-preparation workflow, while the Power BI file provides the dashboard layer for exploring the resulting metrics.

#### Domain:
Supply Chain and Logistics
#### Author:
Hardikkumar Rawal
