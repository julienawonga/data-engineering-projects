WITH raw_orders AS (
    SELECT * FROM {{ source('raw', 'orders') }}
)
SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    CAST(total_price AS NUMERIC(10, 2)) AS total_price,
    order_date
FROM raw_orders
WHERE order_date IS NOT NULL
