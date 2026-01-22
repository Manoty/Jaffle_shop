--New customer acquisition

{{ config(materialized='table') }}

with first_orders as (
    select
        customer_id,
        min(order_date) as first_order_date
    from {{ ref('stg_orders') }}
    group by 1
)

select
    date_trunc('month', first_order_date) as month,
    count(customer_id) as new_customers
from first_orders
group by 1
order by 1
