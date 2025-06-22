/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/
WITH skill_count_cte AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim
    JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_postings_fact.job_work_from_home = TRUE
    GROUP BY
        skill_id
)

SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    skill_count_cte.skill_count
FROM
    skill_count_cte
JOIN skills_dim ON skills_dim.skill_id = skill_count_cte.skill_id
LIMIT 5;



