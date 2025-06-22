/*
Find the companies that have the most job openings
- Get the total number of job postings per company id
- Return the total number of jobs with the company name
*/

WITH company_job_count AS (
    SELECT
            company_id,
            COUNT(*) AS total_jobs
    FROM 
            job_postings_fact
    GROUP BY
            company_id
)

SELECT
    company_dim.name as company_name,
    company_job_count.total_jobs
FROM
    company_dim
JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    company_job_count.total_jobs DESC