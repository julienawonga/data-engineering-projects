SELECT
    sales_month,
    category,
    product_id,
    SUM(total_sales) AS total_sales,
    SUM(total_orders) AS total_orders
FROM {{ ref('int_sales_summary') }}
GROUP BY sales_month, category, product_id
ORDER BY sales_month, total_sales DESC