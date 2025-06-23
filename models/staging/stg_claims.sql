with source as (
    select * from {{ source('raw', 'claims') }}
)

select
    ID as claim_id,
	PATIENTID as patient_id,
	PROVIDERID as provider_id,
	PRIMARYPATIENTINSURANCEID as primary_patient_insurance_id,
	SECONDARYPATIENTINSURANCEID as secondary_patient_insurance_id,
	DEPARTMENTID as department_id,
	PATIENTDEPARTMENTID as patient_department_id,
	DIAGNOSIS1 as primary_diagnosis,
	REFERRINGPROVIDERID as referring_provider_id,
	APPOINTMENTID as appointment_id,
	CURRENTILLNESSDATE as current_illness_date,
	SERVICEDATE as service_date,
	SUPERVISINGPROVIDERID as supervising_provider_id,
	STATUS1 as status1,
	STATUS2 as status2,
	STATUSP as status3,
	OUTSTANDING1 as outstanding,
	LASTBILLEDDATE1 as last_billed_date,
	HEALTHCARECLAIMTYPEID1 as healthcare_claim_type_id
from source