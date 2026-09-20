# -- What is the monthly revenue trend across the dataset?
# select * from orders;
# select * from order_payments;

use olist;

select
	date_format(o.order_purchase_timestamp, '%Y-%m') as month,
    round(sum(op.payment_value),2) as total_revenue
from orders as o
join order_payments as op
	on op.order_id = o.order_id
group by month
order by month;
