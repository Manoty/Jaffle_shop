with source as (

    select
        id as customer_id,
        first_name,
        last_name
    from "jaffle_dbt"."main"."raw_customers"

)

select * from source