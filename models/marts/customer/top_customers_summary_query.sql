{{ config(materialized='table') }}

with customer_totals as (
    select
        o.customer_id,
        sum(p.amount) as total_spent
    from {{ ref('stg_orders') }} o
    join {{ ref('stg_payments') }} p
        on o.order_id = p.order_id
    group by o.customer_id
),

customer_summary as (
    select
        count(distinct customer_id) as total_customers,
        avg(total_spent) as avg_customer_spend,
        max(total_spent) as max_customer_spend,
        min(total_spent) as min_customer_spend
    from customer_totals
)

select *
from customer_summary