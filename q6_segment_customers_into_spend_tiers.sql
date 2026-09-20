# Segment customers into spend tiers (Low / Medium / High).
# SELECT * FROM customers;
# SELECT * FROM orders;
# SELECT * FROM order_payments;


USE olist;

WITH customer_spend AS
(
    SELECT
        c.customer_id AS customer,
        ROUND(SUM(op.payment_value), 2) AS total_sales
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    JOIN order_payments AS op
        ON op.order_id = o.order_id
    GROUP BY c.customer_id
),

customer_tiers AS
(
    SELECT
        customer,
        total_sales,
        NTILE(3) OVER (ORDER BY total_sales) AS tier
    FROM customer_spend
)

SELECT
    CASE
        WHEN tier = 1 THEN 'LOW'
        WHEN tier = 2 THEN 'MEDIUM'
        WHEN tier = 3 THEN 'HIGH'
    END AS spend_tier,
    COUNT(*) AS customer_count,
    ROUND(SUM(total_sales), 2) AS total_revenue
FROM customer_tiers
GROUP BY tier
ORDER BY tier;
