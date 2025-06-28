# Northwind SQL Analysis

## Overview
This project analyzes the Northwind database to demonstrate advanced SQL proficiency in extracting and analyzing business data. The goal is to showcase my ability to write complex SQL queries using Common Table Expressions (CTEs), window functions, and joins to derive actionable insights on sales, customer behavior, and operational performance.

## Project Structure
The repository contains SQL scripts, each addressing a specific business question:
- `01_summary_metrics.sql`: Summarizes total customers, orders, and sales.
- `02_monthly_sales.sql`: Tracks monthly sales trends and percentage changes.
- `03_top_customers.sql`: Ranks top customers by order frequency and value.
- `04_category_performance.sql`: Analyzes product category sales and pricing.
- `05_employee_performance.sql`: Evaluates employee sales and average order value.
- `06_customer_retention.sql`: Identifies loyal customers based on order frequency.
- `07_top_products.sql`: Ranks products by revenue and flags inactive products.
- `08_order_fulfillment.sql`: Assesses shipping times and delayed orders.
- `09_category_price_ranking.sql`: Finds cheapest and most expensive products per category.
- `10_monthly_new_customers.sql`: Analyzes new customer acquisition trends.

## Database
The Northwind database is a sample relational database simulating a trading company's operations, with tables like `customers`, `orders`, `order_details`, `products`, `categories`, and `employees`.

## Objectives
- Demonstrate advanced SQL skills, including CTEs, window functions (`RANK`, `LAG`, `FIRST_VALUE`), and aggregations.
- Derive business insights to support decision-making, such as identifying top customers, sales trends, and operational inefficiencies.
- Organize modular, maintainable SQL scripts for clarity and scalability.

## Setup and Usage
1. **Prerequisites**: A SQL DBMS (e.g., PostgreSQL, MySQL) with the Northwind database installed.
2. **Installation**: Load the Northwind schema and data (available from Microsoft or open-source repositories).
3. **Running Queries**: Execute each `.sql` file in your DBMS to view results.
4. **Expected Output**: Each script returns metrics or insights (e.g., sales trends, top customers).

## Technologies
- **SQL**: Core language for querying and analysis.
- **DBMS**: Compatible with PostgreSQL, MySQL, or similar systems.
