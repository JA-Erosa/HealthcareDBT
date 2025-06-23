with source as (
    select * from {{ source('raw', 'conditions') }}
)

select
    code as condition_id,
    patient,
    encounter,
    code,
    description,
    startdate,
    stopdate
from source