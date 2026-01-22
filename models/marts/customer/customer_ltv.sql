--Lifetime value per customer

{{ config(materialized='table') }}

select
    o.customer_id,
    sum(p.amount) as lifetime_value
from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id
group by 1
order by lifetime_value desc
