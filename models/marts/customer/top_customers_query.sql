{{ config(materialized='table') }}

with customers as (
    select
        o.customer_id,
        sum(p.amount) as total_spent,
        count(o.order_id) as orders_count
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_payments') }} p
        on o.order_id = p.order_id
    group by o.customer_id
)

select *
from customers
order by total_spent desc
limit 50