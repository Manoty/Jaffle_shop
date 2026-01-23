--Orders per month



select
    date_trunc('month', order_date) as month,
    count(*) as total_orders
from "jaffle_dbt"."main"."stg_orders"
group by 1
order by 1