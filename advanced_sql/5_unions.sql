--get jobs and companies from january, feb and march

SELECT
job_title_short,
company_id,
job_location
from 
january_jobs

UNION ALL

select
job_title_short,
company_id,
job_location
FROM 
february_jobs

UNION ALL

select
job_title_short,
company_id,
job_location
FROM 
march_jobs;