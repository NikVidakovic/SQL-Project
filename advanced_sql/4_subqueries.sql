with january_jobs as (
    SELECT * 
    FROM job_postings_fact
    where EXTRACT (month from job_posted_date)=1
    )

    select * 
    from january_jobs;

/*
find the company with most job oppenings
-get the total number of job postings per company id
-return the total number of jobs with the company name 
*/

with company_job_count as
(select
company_id,
count(*) as total_jobs
from job_postings_fact
GROUP BY company_id
)

select 
company_dim.name,
company_job_count.total_jobs
from company_dim 
left join company_job_count on company_dim.company_id = company_job_count.company_id
ORDER BY total_jobs desc; 
 

