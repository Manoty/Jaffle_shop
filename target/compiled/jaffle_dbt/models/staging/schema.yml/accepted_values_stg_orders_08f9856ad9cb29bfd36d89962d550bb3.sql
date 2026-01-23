
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "jaffle_dbt"."main"."stg_orders"
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','returned','return_pending'
)


