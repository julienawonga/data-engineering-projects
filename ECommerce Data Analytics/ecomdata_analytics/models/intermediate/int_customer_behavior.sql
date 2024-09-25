WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_price) AS total_spent,
        AVG(total_price) AS avg_order_value
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.name,
    c.email,
    c.country,
    co.total_orders,
    co.total_spent,
    co.avg_order_value
FROM {{ ref('stg_customers') }} c
JOIN customer_orders co
ON c.customer_id = co.customer_id
ORDER BY total_spent DESC