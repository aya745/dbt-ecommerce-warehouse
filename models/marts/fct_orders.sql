select
    order_id,
    customer_id,
    order_date,
    status,
    count(order_item_id) as number_of_items,
    sum(quantity) as total_quantity,
    sum(line_amount) as order_amount
from {{ ref('fct_order_items') }}
group by
    order_id,
    customer_id,
    order_date,
    status