# dbt Ecommerce Warehouse

A beginner-friendly analytics engineering project built with **dbt Core** and **DuckDB**.

This project models a small ecommerce dataset into a clean analytics warehouse using a layered dbt structure:
- **Seeds** for input data
- **Staging models** for cleaning and standardization
- **Mart models** for dimensions, facts, and business-ready summaries

## Tech Stack

- **dbt Core**
- **DuckDB**
- **SQL**
- **Git / GitHub**
- **dbt Docs** for documentation and lineage

## Project Structure

```text
models/
├── staging/
│   ├── stg_customers.sql
│   ├── stg_products.sql
│   ├── stg_orders.sql
│   └── stg_order_items.sql
└── marts/
    ├── dim_customers.sql
    ├── dim_products.sql
    ├── fct_order_items.sql
    ├── fct_orders.sql
    ├── daily_sales_summary.sql
    └── product_sales_summary.sql

    Data Modeling Approach

This project follows a simplified analytics engineering pattern:

Staging layer: cleans raw source data and standardizes data types
Dimension tables: describe business entities such as customers and products
Fact tables: store measurable business events such as order items and orders
Summary marts: provide reporting-ready aggregated datasets
Models
Staging Models
stg_customers: cleaned customer data
stg_products: cleaned product data
stg_orders: cleaned order data
stg_order_items: cleaned order item data
Dimension Models
dim_customers: one row per customer
dim_products: one row per product
Fact Models
fct_order_items: one row per order item with quantity and line revenue
fct_orders: one row per order with aggregated order amount and quantity

Summary Models
daily_sales_summary: daily completed-order revenue, quantity, and average order value
product_sales_summary: product-level revenue and quantity summary for completed orders
Example Business Questions Answered
What is total revenue by day?
What is the average order value over time?
Which products generate the most revenue?
How many orders were completed each day?
Which product categories perform best?
How to Run the Project
1. Create and activate a virtual environment
python -m venv .venv
.\.venv\Scripts\Activate.ps1

2. Install dependencies
pip install dbt-core dbt-duckdb

3. Load seed data
dbt seed --profiles-dir .
4. Build models
dbt run --profiles-dir .
5. Run tests
dbt test --profiles-dir .
6. Generate docs
dbt docs generate --profiles-dir .
dbt docs serve --profiles-dir . --port 8081
Documentation and Lineage

The project includes dbt documentation and a lineage graph showing dependencies from raw inputs to staging, marts, and summary models.

Future Improvements
Add more data quality tests
Add GitHub Actions CI workflow
Add customer lifetime value model
Add category-level summary marts
Add dashboard layer on top of the marts

