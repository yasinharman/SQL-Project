SELECT
    company_dim.name,
    COUNT(job_id) AS job_count

FROM
    job_postings_fact 

JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE 
    EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2 AND
    job_postings_fact.job_health_insurance = TRUE

GROUP BY
    company_dim.name

HAVING
    COUNT(job_id) > 1

ORDER BY 
    job_count DESC;