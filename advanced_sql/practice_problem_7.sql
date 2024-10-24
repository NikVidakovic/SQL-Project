/*
find the count of the number of remote jobs postings per skill
-display the top 5 skills by their demand in remote jobs
-include skill ID, name, and count of postings requireing the skill
*/

with remote_job_skills as
(
select
    skill_id,
    count(*) as skill_count
FROM skills_job_dim as skills_to_job
INNER JOIN job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
where job_postings.job_work_from_home = True AND
job_postings.job_title_short = 'Data Analyst'
GROUP BY skill_id
)

select 
skills.skill_id,
skills as skill_name,
skill_count
FROM remote_job_skills
INNER join skills_dim as skills on skills.skill_id = remote_job_skills.skill_id
order by skill_count DESC;


