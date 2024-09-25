WITH raw_customers AS (
    SELECT * FROM {{ source('ecommerce', 'customers')}}
)
SELECT 
    customer_id,
    name,
    email,
    country,
FROM raw_customers
WHERE email IS NOT NULL