with customers as (
    select
        customer_id,
        customer_name,
        sum(order_amount) as total_spent,
        count(order_id) as orders_count
    from {{ source('customers_source', 'orders') }}
    group by customer_id, customer_name
)

select *
from customers
order by total_spent desc
limit 50
