# Rank the top 3 products within each category by revenue.
# -- SELECT * FROM products;
# -- SELECT * FROM product_category_name;

USE olist;

WITH product_revenue AS
(
    SELECT
        p.product_id AS product,
        p.product_category_name AS product_category,
        ROUND(SUM(op.payment_value), 2) AS total_revenue
    FROM products AS p
    JOIN order_items AS oi
        ON oi.product_id = p.product_id
    JOIN order_payments AS op
        ON op.order_id = oi.order_id
    GROUP BY
        p.product_id,
        p.product_category_name
),

ranked_product AS
(
    SELECT
        product,
        product_category,
        total_revenue,
        SUM(total_revenue) OVER
            (PARTITION BY product_category) AS category_total_revenue,
        ROW_NUMBER() OVER
        (
            PARTITION BY product_category
            ORDER BY total_revenue DESC
        ) AS rn
    FROM product_revenue
)

SELECT
    product_category,
    product,
    total_revenue,
    rn AS revenue_rank
FROM ranked_product
WHERE rn <= 3
ORDER BY
    category_total_revenue DESC,
    revenue_rank;
