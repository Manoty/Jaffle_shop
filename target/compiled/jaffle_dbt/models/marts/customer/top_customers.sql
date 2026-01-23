--Top spenders



select
    customer_id,
    sum(amount) as total_spent
from "jaffle_dbt"."main"."stg_orders" o
join "jaffle_dbt"."main"."stg_payments" p
    on o.order_id = p.order_id
group by 1
order by total_spent desc
limit 10