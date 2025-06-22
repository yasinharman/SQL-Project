SELECT
    company_id,
    name,

    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size

FROM (
    SELECT
        company_dim.company_id,
        company_dim.name,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM company_dim
    INNER JOIN job_postings_fact
        ON job_postings_fact.company_id = company_dim.company_id
    GROUP BY
        company_dim.company_id,
        company_dim.name
) AS company_job_count
