# -- Which product categories generate the most revenue?
# USE olist;
#
# SELECT product_category_name FROM products;
# SELECT * FROM products;
# SELECT * FROM order_items;
# SELECT * FROM order_payments;


USE olist;

SELECT
    p.product_category_name AS product_category,
    ROUND(SUM(op.payment_value), 2) AS total_revenue
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.product_id
JOIN order_payments AS op ON op.order_id = oi.order_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;