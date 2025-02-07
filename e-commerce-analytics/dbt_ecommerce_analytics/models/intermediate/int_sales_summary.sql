WITH sales_data AS (
    SELECT
        o.order_id,
        o.order_date,
        o.total_price,
        p.product_id,
        p.category
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_products') }} p
    ON o.product_id = p.product_id
)
SELECT
    category,
    DATE_TRUNC('month', order_date) AS sales_month,
    product_id,
    SUM(total_price) AS total_sales,
    COUNT(order_id) AS total_orders
FROM sales_data
GROUP BY category, sales_month, product_id
ORDER BY sales_month, category
