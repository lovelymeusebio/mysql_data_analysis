# What percent of total revenue comes from the top category?
# SELECT * FROM product_category_name
# SELECT * FROM order_items;
# SELECT * FROM order_payments

USE olist;

WITH category_revenue AS
(
    SELECT
        p.product_category_name AS product_category,
        ROUND(SUM(op.payment_value), 2) AS total_revenue
    FROM products AS p
    JOIN order_items AS oi ON oi.product_id = p.product_id
    JOIN order_payments AS op ON op.order_id = oi.order_id
    GROUP BY p.product_category_name
),
ranked_categories AS
(
    SELECT
        product_category,
        total_revenue,
        RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM category_revenue
)
SELECT
    product_category,
    ROUND(total_revenue, 2) AS top_category_revenue,
    ROUND(total_revenue / SUM(total_revenue) OVER() * 100, 2) AS revenue_percentage
FROM ranked_categories
LIMIT 1;