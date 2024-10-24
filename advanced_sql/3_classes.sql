-- January Jobs
CREATE TABLE january_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February Jobs
CREATE TABLE february_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March Jobs
CREATE TABLE march_jobs AS 
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

select job_posted_date
from march_jobs;




/*

label new column as follows:
'Anywhere' as 'remote'
'NY' as 'local'
-otherwise onsite

*/