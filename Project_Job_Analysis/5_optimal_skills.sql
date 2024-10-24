/*
question: What are the most optimal skills to leran (high-demand and high-paying skill)
- Identify skills in high demand and associated with high average salaries for data analyst roles
- Focus on remote positions with specified salaries
- Why? Targets skills that offer job security (in high demand) and finantial benefits (high salaries),
   offering strategic insights for career development in data analysis
*/

WITH skills_demand as
(
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg is NOT NULL
AND job_work_from_home = TRUE
group by skills_dim.skill_id
),

average_salary AS(
SELECT 
    skills_job_dim.skill_id,
    round(avg(salary_year_avg),2) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND salary_year_avg is NOT NULL
AND job_work_from_home = TRUE
group by skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from
    skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
    LIMIT 25;
