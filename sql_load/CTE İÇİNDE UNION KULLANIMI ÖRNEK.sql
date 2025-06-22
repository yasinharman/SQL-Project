/*
Find the job postings from the first quarter that have a salary greater than $70k
- Combine job posting tables from the first quarter of 2023
- Gets job postings with an averagte yearly salary > $70,000
*/
WITH first_quarter_jobs AS (
    SELECT *
    FROM
        january_jobs

    UNION ALL

    SELECT *
    FROM
        february_jobs

    UNION ALL

    SELECT *
    FROM
        march_jobs
)
SELECT
    job_title_short,
    company_id,
    job_location,
    salary_year_avg,
    skills_dim.skills
FROM
    first_quarter_jobs
LEFT JOIN skills_job_dim ON skills_job_dim.job_id = first_quarter_jobs.job_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    salary_year_avg >= 70000