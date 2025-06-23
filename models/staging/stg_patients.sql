with source as (
    select * from {{ source('raw', 'patients') }}
)

select
    id as patient_id,
    birthdate,
    deathdate,
    gender,
    race,
    ethnicity
from source