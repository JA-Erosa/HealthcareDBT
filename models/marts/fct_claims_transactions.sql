with claims as (
    select *
    from {{ ref('stg_claims') }}
),

transactions as (
    select *
    from {{ ref('stg_claims_transactions') }}
),

joined as (
    select
        ct.claim_transaction_id,
        ct.claim_id,
        cl.patient_id,
        cl.provider_id,
        cl.encounter_id,
        cl.payer_id,
        ct.transaction_type,
        ct.transaction_amount,
        ct.transaction_date,
        cl.service_start_date,
        cl.service_end_date,

        -- Duration of service
        datediff(day, cl.service_start_date, cl.service_end_date) as service_duration_days,

        {{ dbt_utils.generate_surrogate_key([
            'ct.claim_transaction_id'
        ]) }} as claim_transaction_sk

    from transactions ct
    left join claims cl on ct.claim_id = cl.claim_id
)

select
    claim_transaction_sk,
    claim_transaction_id,
    claim_id,
    patient_id,
    provider_id,
    encounter_id,
    payer_id,
    transaction_type,
    transaction_amount,
    transaction_date,
    service_start_date,
    service_end_date,
    service_duration_days,
    cast(transaction_date as date) as transaction_day

from joined