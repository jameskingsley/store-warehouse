--creating tables

-- dim_date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    date DATE,
    year INT,
    month INT,
    day INT,
    quarter INT,
    week_num INT
);

-- dim_customer
CREATE TABLE dim_customer (
    customer_id VARCHAR PRIMARY KEY,
    customer_name VARCHAR,
    segment VARCHAR,
    city VARCHAR,
    state VARCHAR,
    country VARCHAR,
    region VARCHAR
);

-- dim_product
CREATE TABLE dim_product (
    product_id VARCHAR PRIMARY KEY,
    product_name VARCHAR,
    category VARCHAR,
    sub_category VARCHAR
);

-- dim_ship
CREATE TABLE dim_ship (
    ship_mode VARCHAR PRIMARY KEY,
    shipping_cost NUMERIC,
    order_priority VARCHAR
);

-- fact_sales
CREATE TABLE fact_sales (
    fact_id SERIAL PRIMARY KEY,
    order_id VARCHAR,
    order_date_id INT REFERENCES dim_date(date_id),
    ship_date_id INT REFERENCES dim_date(date_id),
    customer_id VARCHAR REFERENCES dim_customer(customer_id),
    product_id VARCHAR REFERENCES dim_product(product_id),
    ship_mode VARCHAR REFERENCES dim_ship(ship_mode),
    sales NUMERIC,
    profit NUMERIC,
    quantity INT,
    discount NUMERIC,
    shipping_cost NUMERIC
);

--alter table
ALTER TABLE fact_sales
ADD CONSTRAINT unique_order_product UNIQUE (order_id, product_id);

--checking tables
select * from fact_sales;


