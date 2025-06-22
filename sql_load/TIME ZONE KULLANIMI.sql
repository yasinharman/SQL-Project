SELECT 
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month

FROM 
    job_postings_fact

GROUP BY
    month

ORDER BY
    month