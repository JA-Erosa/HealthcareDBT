{% snapshot snapshot_patients %}
{{
  config(
    target_schema='snapshots',
    unique_key='patient_id',
    strategy='check',
    check_cols=['birthdate', 'gender', 'race', 'ethnicity', 'deathdate']
  )
}}

select
  id as patient_id,
  birthdate,
  gender,
  race,
  ethnicity,
  deathdate
from {{ source('raw', 'patients') }}

{% endsnapshot %}