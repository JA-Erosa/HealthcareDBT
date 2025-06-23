with source as (
    select * from {{ source('raw', 'procedures') }}
)

select
    id as procedure_id,
    patient,
    encounter,
    code,
    description,
    start as procedure_start,
    stop as procedure_end
from source