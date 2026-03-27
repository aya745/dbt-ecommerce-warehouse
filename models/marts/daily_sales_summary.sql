select
    order_date,
    count(distinct order_id) as total_orders,
    sum(total_quantity) as total_quantity_sold,
    sum(order_amount) as total_revenue,
    avg(order_amount) as average_order_value
from {{ ref('fct_orders') }}
where status = 'completed'
group by order_date
order by order_date