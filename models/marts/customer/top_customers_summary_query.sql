with summary as (
    select
        count(distinct customer_id) as total_customers,
        sum(order_amount) as total_revenue,
        avg(order_amount) as avg_order_value
    from {{ source('customers_source', 'orders') }}
)

select *
from summary
