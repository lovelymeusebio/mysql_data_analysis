# What is the month-over-month change in revenue?

use olist;
with month_rev as
(
	select
		date_format(o.order_purchase_timestamp, '%Y-%m') as month,
		round(SUM(op.payment_value),2) as total_revenue
	from orders as o
	join order_payments as op
		on op.order_id = o.order_id
	group by month
),

revenue_lag as
(
select
	month,
    total_revenue,
    lag(total_revenue) over (order by month) as prev_month
from month_rev
)
select
month,
total_revenue,
prev_month,
-- ROUND(
-- 	(total_revenue - prev_month) / prev_month,
-- 2) AS mom_change,
round(
	(total_revenue - prev_month) / prev_month * 100,
2) as mom_change_pct
from revenue_lag
  order by month;