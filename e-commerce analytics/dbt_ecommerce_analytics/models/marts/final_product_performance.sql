WITH product_performance AS (
    SELECT
        product_id,
        SUM(total_sales) AS total_revenue,
        SUM(total_orders) AS total_orders
    FROM {{ ref('int_sales_summary') }}
    GROUP BY product_id
)
SELECT
    p.product_id,
    p.product_name,
    p.category,
    pp.total_revenue,
    pp.total_orders
FROM {{ ref('stg_products') }} p
JOIN product_performance pp
ON p.product_id = pp.product_id
ORDER BY pp.total_revenue DESC