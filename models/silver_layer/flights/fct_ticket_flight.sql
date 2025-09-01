{{
  config(
    materialized = 'table',
    )
}}
select
    t1.ticket_no,
    t1.flight_id,
    t1.fare_conditions,
    t1.amount,
    t2.boarding_no,
    t2.seat_no,
    now()::date as load_date
from 
    {{ ref('stg_flights__ticket_flights') }} as t1 
    left join {{ ref('stg_flights__boarding_passes') }} as t2 on t1.ticket_no = t2.ticket_no
