WITH deduplicated AS(
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY LOWER(TRIM(EMAIL)) 
            ORDER BY DATE(LASTTRANSACTION) DESC NULLS LAST, 
            'AUTO'
            )  AS RN
    FROM 
        CUSTOMERS
    WHERE
        EMAIL IS NOT NULL AND
        TRIM(EMAIL) != ''
)
SELECT 
    ID,
    NULLIF(TRIM(REGEXP_REPLACE(SPLIT_PART(name, ',', 1), '[^a-zA-Z0-9 ]', '')), '') 
        AS first_name,
    NULLIF(TRIM(REGEXP_REPLACE(SPLIT_PART(name, ',', 2), '[^a-zA-Z0-9 ]', '')), '') 
        AS last_name,
    LTRIM(PHONE, '+0') AS PHONE_STANDARDIZED ,
    EMAIL,
    ADDRESS,
    REGION,
    COUNTRY,
    COALESCE(NULLIF(TRIM(company), ''), 'N/A') AS company,
    TO_DATE(DOB, 'MMMM DD, YYYY') AS DOB,
    TO_DATE(LASTTRANSACTION, 'AUTO') AS lasttransaction_date,
    FLOOR(DATEDIFF(years,TO_DATE(DOB, 'MMMM DD, YYYY'), CURRENT_DATE())) AS AGE,
    DATEDIFF(days, DATE(LASTTRANSACTION, 'AUTO'), CURRENT_DATE()) AS daySinceLastOrder,
FROM 
    deduplicated
WHERE 
    RN=1
 