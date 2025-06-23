with source as (
    select * from {{ source('raw', 'conditions') }}
)

select
    id as condition_id,
    patient,
    encounter,
    code,
    description,
    startdate,
    stopdate
from source