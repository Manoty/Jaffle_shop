
  
    
    

    create  table
      "jaffle_dbt"."main"."monthly_revenue__dbt_tmp"
  
    as (
      --Total revenue per month



select
    date_trunc('month', o.order_date) as month,
    sum(p.amount) as revenue
from "jaffle_dbt"."main"."stg_orders" o
join "jaffle_dbt"."main"."stg_payments" p
    on o.order_id = p.order_id
group by 1
order by 1
    );
  
  