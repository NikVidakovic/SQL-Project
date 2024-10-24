/*
find job posting from the first quarter that have a salary greater then $70K
-combine job posting tables from the first quarter of 2023 (jan-mar)
-gets job postings with an average yearly salary > 70,000$
*/

select 
    quarter1_job_posting.job_title_short,
    quarter1_job_posting.job_location,
    quarter1_job_posting.job_via,
    quarter1_job_posting.job_posted_date::date,
    quarter1_job_posting.salary_year_avg
 from (
SELECT *
from january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT *
from march_jobs) 
as quarter1_job_posting
where quarter1_job_posting.salary_year_avg > 70000
and job_title_short = 'Data Analyst'
ORDER BY quarter1_job_posting.salary_year_avg DESC;
