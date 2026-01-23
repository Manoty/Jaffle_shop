with source as (

    select
        id as payment_id,
        order_id,
        payment_method,
        amount
    from "jaffle_dbt"."main"."raw_payments"

)

select * from source