# Sales Data Warehouse Project (PostgreSQL ETL)
#### Overview

This project demonstrates the design and implementation of a Sales Data Warehouse using PostgreSQL.
It involves data extraction, transformation, and loading (ETL) from a raw transactional dataset (Superstore Sales Data) into a star schema consisting of dimension and fact tables for efficient analytics and reporting.

The goal is to build a scalable data warehouse that supports advanced business intelligence queries such as sales performance, customer segmentation, and profitability analysis.

## Project Objectives
* Design a star schema optimized for analytical queries.
* Perform data cleaning, transformation, and validation before loading.
* Implement dimension and fact tables with referential integrity.
* Validate the ETL pipeline to ensure data consistency across all tables.
* Enable rich SQL-based analytics and reporting from the warehouse.

##  Dataset
###### Source: Kaggle – Superstore Sales Dataset
###### Description: Contains information about sales transactions, customers, products, shipping modes, and order details.
Column	Description
Order ID	Unique identifier for each order
Order Date	Date when order was placed
Ship Date	Date when order was shipped
Ship Mode	Shipping category
Customer ID	Unique customer identifier
Customer Name	Full name of the customer
Segment	Market segment (Consumer, Corporate, etc.)
Country/Region	Customer’s region
Category	Product category
Sub-Category	Product subcategory
Product Name	Product sold
Sales	Total sales amount
Quantity	Units sold
Discount	Discount applied
Profit	Profit earned

##  Data Warehouse Schema (Star Schema)
### Fact Table

###### fact_sales
Column	Description
sales_id	Surrogate key
order_id	Order identifier
customer_id	FK - dim_customer
product_id	FK - dim_product
ship_id	FK - dim_ship
order_date_id	FK - dim_date
ship_date_id	FK - dim_date
quantity	Quantity sold
discount	Discount percentage
profit	Profit from sale
sales	Total sales amount
### Dimension Tables

###### dim_customer

Column	Description
customer_id	Surrogate key
customer_name	Customer full name
segment	Customer segment
region	Customer region

###### dim_product

Column	Description
product_id	Surrogate key
category	Product category
sub_category	Subcategory
product_name	Product name

###### dim_ship

Column	Description
ship_id	Surrogate key
ship_mode	Shipping mode

###### dim_date

Column	Description
date_id	Surrogate key
full_date	Actual date
day	Day of month
month	Month
quarter	Quarter
year	Year
##### ETL Workflow

* Extract – Load raw data from the CSV file into a staging table in PostgreSQL.

* Transform – Clean, normalize, and standardize data (handle duplicates, nulls, and date formats).

* Load – Populate dimension tables first, followed by the fact table with validated keys.

* Validate – Ensure referential integrity by checking valid foreign keys across all relationships.
