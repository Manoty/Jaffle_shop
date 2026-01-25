

with customers as (
    select
        o.customer_id,
        sum(p.amount) as total_spent,
        count(o.order_id) as orders_count
    from "jaffle_dbt"."main"."stg_orders" o
    join "jaffle_dbt"."main"."stg_payments" p
        on o.order_id = p.order_id
    group by o.customer_id
)

select *
from customers
order by total_spent desc
limit 50