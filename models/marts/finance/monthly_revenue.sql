--Total revenue per month

{{ config(materialized='table') }}

select
    date_trunc('month', o.order_date) as month,
    sum(p.amount) as revenue
from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id
group by 1
order by 1
