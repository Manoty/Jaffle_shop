--Top spenders

{{ config(materialized='table') }}

select
    customer_id,
    sum(amount) as total_spent
from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id
group by 1
order by total_spent desc
limit 10
