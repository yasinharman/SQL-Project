/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that re available remotely
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts.
*/

SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    job_work_from_home
FROM
    job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id

WHERE
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL AND
    -- LOWER(job_title) LIKE '%data_analyst%'
    job_title_short = 'Data Engineer'
ORDER BY
    salary_year_avg DESC

LIMIT 10;
