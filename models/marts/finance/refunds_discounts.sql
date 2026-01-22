--Refunds, discounts per month
{{ config(materialized='table') }}

select
    payment_method,
    sum(case when amount = 0 then 1 else 0 end) as zero_amount_payments
from {{ ref('stg_payments') }}
group by 1
