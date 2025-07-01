-- Task 6: Sales Trend Analysis Using Aggregations
-- Full Script: Create DB, Table, and Run Sales Analysis

-- Step 0: Create and Use New Database
CREATE DATABASE IF NOT EXISTS sales_insights;
USE sales_insights;

-- Step 1: Create Table Structure Matching the CSV
CREATE TABLE IF NOT EXISTS online_sales_sample (
    order_id VARCHAR(20),
    order_date DATE,
    amount DECIMAL(10,2),
    product_id VARCHAR(10)
);

-- ✅ At this point, import 'online_sales_sample.csv' using Table Data Import Wizard
-- (In MySQL Workbench, right-click 'sales_insights' → Table Data Import Wizard → Select CSV → Create new table if not done)

-- Step 2: Analyze Monthly Revenue and Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,                -- Extract the year
    EXTRACT(MONTH FROM order_date) AS month,              -- Extract the month
    SUM(amount) AS monthly_revenue,                       -- Total revenue per month
    COUNT(DISTINCT order_id) AS order_volume              -- Total orders per month
FROM 
    online_sales_sample
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- Step 3: Top 3 Months by Revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM 
    online_sales_sample
GROUP BY 
    year, month
ORDER BY 
    monthly_revenue DESC
LIMIT 3;
