-- Create the database if it doesn’t exist
CREATE DATABASE ecomm_db;

-- Connect to the new database (this part won't work inside an SQL script)
-- \c ecomm_db;

-- The rest must be executed inside ecomm_db
\connect ecomm_db;


CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price NUMERIC(10, 2) NOT NULL,
    order_date TIMESTAMP NOT NULL
);

ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);

\copy customers FROM '/csv_data/customers.csv' DELIMITER ',' CSV HEADER;
\copy products FROM '/csv_data/products.csv' DELIMITER ',' CSV HEADER;
\copy orders FROM '/csv_data/orders.csv' DELIMITER ',' CSV HEADER;

