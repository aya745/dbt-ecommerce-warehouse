select
    p.product_id,
    p.product_name,
    p.category,
    count(distinct f.order_id) as total_orders,
    sum(f.quantity) as total_quantity_sold,
    sum(f.line_amount) as total_revenue
from {{ ref('fct_order_items') }} f
left join {{ ref('dim_products') }} p
    on f.product_id = p.product_id
where f.status = 'completed'
group by
    p.product_id,
    p.product_name,
    p.category
order by total_revenue desc