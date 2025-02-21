SELECT
    c.customer_id,
    c.name,
    c.email,
    c.country,
    cb.total_orders,
    cb.total_spent,
    cb.avg_order_value
FROM {{ ref('stg_customers') }} c
JOIN {{ ref('int_customer_behavior') }} cb
ON c.customer_id = cb.customer_id
ORDER BY cb.total_spent DESC
