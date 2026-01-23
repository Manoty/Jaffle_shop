--Lifetime value per customer



select
    o.customer_id,
    sum(p.amount) as lifetime_value
from "jaffle_dbt"."main"."stg_orders" o
join "jaffle_dbt"."main"."stg_payments" p
    on o.order_id = p.order_id
group by 1
order by lifetime_value desc