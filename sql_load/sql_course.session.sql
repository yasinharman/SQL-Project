WITH first_quarter_jobs AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

SELECT
    sd.skills AS skill_name,
    COUNT(sjd.skill_id) AS skill_count,
    EXTRACT(MONTH FROM fqj.job_posted_date) AS month,
    EXTRACT(YEAR FROM fqj.job_posted_date) AS year
FROM
    first_quarter_jobs fqj
JOIN skills_job_dim sjd ON sjd.job_id = fqj.job_id
JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
GROUP BY
    sd.skills,
    EXTRACT(MONTH FROM fqj.job_posted_date),
    EXTRACT(YEAR FROM fqj.job_posted_date)
ORDER BY
    year,
    month,
    skill_name;

