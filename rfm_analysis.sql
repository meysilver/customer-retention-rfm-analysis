--RFM CALCULATION
SELECT
    customer_id,
    DATEDIFF(MAX(order_date), '2024-01-01') AS recency, 
    COUNT(order_id) AS frequency,
    SUM(total_amount) AS monetary
FROM orders
GROUP BY customer_id;

-- SCORING AND CUSTOMER SEGMENTATION
WITH rfm AS (
    SELECT
        customer_id,
        DATEDIFF('2024-01-01', MAX(order_date)) AS recency,
        COUNT(order_id) AS frequency,
        SUM(total_amount) AS monetary
    FROM orders
    GROUP BY customer_id
)
SELECT *,
    CASE
        WHEN recency <= 30 THEN 3
        WHEN recency <= 90 THEN 2
        ELSE 1
    END AS r_score,
    CASE
        WHEN frequency >= 5 THEN 3
        WHEN frequency >= 2 THEN 2
        ELSE 1
    END AS f_score,
    CASE
        WHEN monetary >= 500 THEN 3
        WHEN monetary >= 150 THEN 2
        ELSE 1
    END AS m_score
FROM rfm;

-- LABELING SEGMENTS
WITH rfm AS (
    SELECT
        customer_id,
        DATEDIFF('2024-01-01', MAX(order_date)) AS recency,
        COUNT(order_id) AS frequency,
        SUM(total_amount) AS monetary
    FROM orders
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT *,
        CASE
            WHEN recency <= 30 THEN 3
            WHEN recency <= 90 THEN 2
            ELSE 1
        END AS r_score,
        CASE
            WHEN frequency >= 5 THEN 3
            WHEN frequency >= 2 THEN 2
            ELSE 1
        END AS f_score,
        CASE
            WHEN monetary >= 500 THEN 3
            WHEN monetary >= 150 THEN 2
            ELSE 1
        END AS m_score
    FROM rfm
)
SELECT *,
    CASE
        WHEN r_score = 3 AND f_score = 3 THEN 'Champion'
        WHEN r_score = 3 AND f_score = 2 THEN 'Loyal'
        WHEN r_score = 2 AND f_score >= 2 THEN 'Potential Loyalist'
        WHEN r_score = 1 AND f_score = 3 THEN 'At Risk'
        WHEN r_score = 1 AND f_score = 1 THEN 'Lost'
        ELSE 'Others'
    END AS segment
FROM rfm_scores;

--TIME TO SECOND PURCHASE
WITH ranked_orders AS (
    SELECT
        customer_id,
        order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM orders
),
first_two AS (
    SELECT
        customer_id,
        MAX(CASE WHEN order_rank = 1 THEN order_date END) AS first_purchase,
        MAX(CASE WHEN order_rank = 2 THEN order_date END) AS second_purchase
    FROM ranked_orders
    WHERE order_rank <= 2
    GROUP BY customer_id
)
SELECT
    customer_id,
    DATEDIFF(second_purchase, first_purchase) AS days_to_return
FROM first_two
WHERE second_purchase IS NOT NULL;

--GROUPIN RETURN TIME INTO BUCKETS
WITH ranked_orders AS (
    SELECT
        customer_id,
        order_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM orders
),
first_two AS (
    SELECT
        customer_id,
        MAX(CASE WHEN order_rank = 1 THEN order_date END) AS first_purchase,
        MAX(CASE WHEN order_rank = 2 THEN order_date END) AS second_purchase
    FROM ranked_orders
    WHERE order_rank <= 2
    GROUP BY customer_id
),
return_times AS (
    SELECT
        customer_id,
        DATEDIFF(second_purchase, first_purchase) AS days_to_return
    FROM first_two
    WHERE second_purchase IS NOT NULL
)
SELECT
    CASE
        WHEN days_to_return <= 30 THEN '0-30 days'
        WHEN days_to_return <= 90 THEN '31-90 days'
        WHEN days_to_return <= 180 THEN '91-180 days'
        ELSE '180+ days'
    END AS return_bucket,
    COUNT(*) AS customers,
    ROUND(AVG(days_to_return), 1) AS avg_days
FROM return_times
GROUP BY return_bucket
ORDER BY MIN(days_to_return);
