WITH raw_customers AS (
    SELECT * FROM {{ source('raw', 'customers')}}
)
SELECT 
    customer_id,
    name,
    email,
    country
FROM raw_customers
WHERE email IS NOT NULL