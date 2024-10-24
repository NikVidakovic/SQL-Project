/*
question: What are the most in-demand skills for data analysts?
- Identify the top 5 in-demand skills for data analysts.
- Focus on all job postings
- Why? Retrieve the top 5 skills with the highest demand in the job market,
   providing insights into the most valuable skills for job seekers.

*/

SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
AND job_work_from_home = TRUE
group by skills
order by demand_count DESC
LIMIT 5;

/*
Result is that top skills are sql, excel, python, tableau and power bi
*/

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]