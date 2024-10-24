select
count(job_id) as job_posted_count,
EXTRACT(MONTH from job_posted_date) as month
from 
job_postings_fact
where job_title_short = 'Data Analyst'
group BY MONTH
ORDER BY job_posted_count
;