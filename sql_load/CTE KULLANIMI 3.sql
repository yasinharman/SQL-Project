WITH company_job_postings AS (
    SELECT
        company_dim.company_id,
        name AS company_name,
        COUNT(job_postings_fact.job_id) AS number_of_job_postings
    FROM
        company_dim
    JOIN job_postings_fact ON job_postings_fact.company_id = company_dim.company_id
    GROUP BY
        company_dim.company_id
)

SELECT
    company_job_postings.company_id,
    company_job_postings.company_name,
    CASE
        WHEN company_job_postings.number_of_job_postings < 10 THEN 'Small'
        WHEN company_job_postings.number_of_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM
    company_job_postings
