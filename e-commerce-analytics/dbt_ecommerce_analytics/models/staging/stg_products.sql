WITH raw_products AS (
    SELECT * FROM {{ source('ecommerce', 'products') }}
)
SELECT
    product_id,
    product_name,
    category,
    CAST(price AS NUMERIC(10, 2)) AS price
FROM raw_products
WHERE product_name IS NOT NULL
