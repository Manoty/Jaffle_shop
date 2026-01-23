with source as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from "jaffle_dbt"."main"."raw_orders"

)

select * from source