# How many customers are repeat buyers vs one-time buyers?
# SELECT * FROM customers;

USE olist;

SELECT
    'One-Time Buyer' AS customer_type,
    COUNT(*) AS num_customers
FROM
(
    SELECT
        c.customer_unique_id
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) = 1
) AS one_time

UNION ALL

SELECT
    'Repeat Buyer' AS customer_type,
    COUNT(*) AS num_customers
FROM
(
    SELECT
        c.customer_unique_id
    FROM customers AS c
    JOIN orders AS o
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
    HAVING COUNT(o.order_id) > 1
) AS repeat_buyers;
