{{ config(materialiezed='table')}}


WITH raw_products AS (
    SELECT * FROM {{ source('raw', 'products') }}
)
SELECT
    product_id::INT,
    product_name::VARCHAR,
    category::VARCHAR,
    CAST(price AS NUMERIC(10, 2)) AS price
FROM raw_products
WHERE product_name IS NOT NULL
