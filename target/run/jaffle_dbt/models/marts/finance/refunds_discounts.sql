
  
    
    

    create  table
      "jaffle_dbt"."main"."refunds_discounts__dbt_tmp"
  
    as (
      --Refunds, discounts per month


select
    payment_method,
    sum(case when amount = 0 then 1 else 0 end) as zero_amount_payments
from "jaffle_dbt"."main"."stg_payments"
group by 1
    );
  
  