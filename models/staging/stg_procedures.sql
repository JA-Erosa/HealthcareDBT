with source as (
    select * from {{ source('raw', 'procedures') }}
)

select
    id as procedure_id,
    patient,
    encounter,
    code,
    description,
    startdate as procedure_start,
    stopdate as procedure_end
from source