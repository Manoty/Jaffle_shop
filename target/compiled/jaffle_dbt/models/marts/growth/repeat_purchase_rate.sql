--% of returning customers



with customer_orders as (
    select
        customer_id,
        count(*) as order_count
    from "jaffle_dbt"."main"."stg_orders"
    group by 1
)

select
    count(case when order_count > 1 then 1 end) * 1.0
        / count(*) as repeat_purchase_rate
from customer_orders