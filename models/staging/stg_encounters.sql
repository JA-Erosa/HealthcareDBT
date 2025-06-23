with source as (
    select * from {{ source('raw', 'encounters') }}
)

select
    id as encounter_id,
    patient,
    encounterclass,
    startdate as start_time,
    stopdate as end_time,
    reasoncode,
    reasondescription
from source