with patients as (
    select * from {{ ref('stg_patients') }}
)

select
    patient_id,
    birthdate,
    gender,
    race,
    ethnicity,
    deathdate,

    -- Calculate age at death or current age
    case
        when deathdate is not null then datediff(year, birthdate, deathdate)
        else datediff(year, birthdate, current_date)
    end as age

from patients