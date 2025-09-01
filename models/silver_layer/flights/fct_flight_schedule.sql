{{
  config(
    materialized = 'table',
    )
}}

select  flight_id,
        flight_no,
        scheduled_departure,
        scheduled_arrival,
        departure_airport as departure_airport_id,
        arrival_airport as arrival_airport_id,
        status,
        aircraft_code as aircraft_id,
        actual_departure,
        actual_arrival,
        now()::date load_date
from {{ ref('stg_flights__flights') }} as tt