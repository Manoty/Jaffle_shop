--Summary by payment method
│
{{ config(materialized='table') }}

select
    payment_method,
    count(*) as payment_count,
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1
order by total_amount desc
