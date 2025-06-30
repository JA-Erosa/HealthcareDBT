select
    cast(id as string) as claim_transaction_id,
    cast(claimid as string) as claim_id,
    cast(patientid as string) as patient_id,
    cast(type as string) as transaction_type,
    cast(amount as numeric) as transaction_amount,
    cast(todate as date) as todate,
    cast(fromdate as date) as fromdate,

from {{ source('raw', 'claims_transactions') }}