with conditions as (
    select * from {{ ref('stg_conditions') }}
),

patients as (
    select patient_id from {{ ref('dim_patients') }}
),

joined as (
    select
        c.condition_id,
        c.patient,
        c.encounter,
        c.code,
        c.description,
        c.start as condition_start,
        c.stop as condition_end
    from conditions c
    left join patients p
      on c.patient = p.patient_id
)

select *
from joined