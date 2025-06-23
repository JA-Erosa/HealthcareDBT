with source as (
    select * from {{ source('raw', 'medications') }}
)

select
    id as medication_id,
    patient,
    encounter,
    code,
    description,
    startdate as medication_start,
    stopdate as medication_end
from source