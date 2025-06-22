SELECT
    job_id,
    salary_year_avg,
    job_title,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Lead%' OR job_title ILIKE '%Manager%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Remote'
        WHEN job_work_from_home = FALSE THEN 'Not Remote'
        ELSE 'Not Specified'
    END AS remote_option

FROM job_postings_fact

WHERE
    salary_year_avg IS NOT NULL

GROUP BY
    job_id

ORDER BY
    salary_year_avg DESC

LIMIT 50;