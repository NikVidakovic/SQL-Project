/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying data analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for data analysts, offering insights into employment oppurtunites
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from 
    job_postings_fact
left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where job_title_short = 'Data Analyst' 
and job_location = 'Anywhere'
and salary_year_avg is not null
order BY salary_year_avg DESC
limit 10;