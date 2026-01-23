--Segmentation (e.g., high/medium/low)



with customer_spend as (
    select
        o.customer_id,
        sum(p.amount) as total_spent
    from "jaffle_dbt"."main"."stg_orders" o
    join "jaffle_dbt"."main"."stg_payments" p
        on o.order_id = p.order_id
    group by 1
)

select
    customer_id,
    total_spent,
    case
        when total_spent >= 5000 then 'high_value'
        when total_spent >= 2000 then 'medium_value'
        else 'low_value'
    end as customer_segment
from customer_spend