# use olist;
#
# select * from customers;
# select * from geolocation;
# select * from orders;
# select * from products;
#
#
# -- Who are the top 10 customers by total amount spent?
# select * from customers;
# select * from orders;
# select * from order_payments;

use olist;

select
    c.customer_id,
    sum(op.payment_value) as total_spent
from customers as c
join orders as o on c. customer_id = o.customer_id
join order_payments as op on o.order_id = op.order_id
group by c.customer_id
order by total_spent desc
limit 10;