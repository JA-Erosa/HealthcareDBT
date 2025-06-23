with encounters as (
    select * from {{ ref('stg_encounters') }}
),

diagnosis_counts as (
    select
        encounter,
        count(*) as diagnosis_count
    from {{ ref('stg_conditions') }}
    group by encounter
),

procedure_counts as (
    select
        encounter,
        count(*) as procedure_count
    from {{ ref('stg_procedures') }}
    group by encounter
),

medication_counts as (
    select
        encounter,
        count(*) as medications_count
    from {{ ref('stg_medications') }}
    group by encounter
),

claim_totals as (
    select
        appointment_id as encounter_id,
        sum(outstanding) as total_outstanding_amount
    from {{ ref('stg_claims') }}
    group by appointment_id
)

select
    e.encounter_id as encounter_id,
    e.patient as patient_id,
    e.encounterclass as encounter_type,
    e.start_time as start_time,
    e.end_time as end_time,
    datediff(day, e.start_time, e.end_time) as length_of_stay,

    coalesce(diagnosis_count, 0) as diagnosis_count,
    coalesce(procedure_count, 0) as procedure_count,
    coalesce(medications_count, 0) as medications_count,
    coalesce(total_outstanding_amount, 0.0) as total_outstanding_amount

from encounters e
left join diagnosis_counts d on e.encounter_id = d.encounter
left join procedure_counts p on e.encounter_id = p.encounter
left join medication_counts m on e.encounter_id = m.encounter
left join claim_totals c on e.encounter_id = c.encounter_id