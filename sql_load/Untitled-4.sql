/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_job_skills AS(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    INNER JOIN
        job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    GROUP BY
        skill_id
)

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    remote_job_skills.skill_count
FROM
    skills_dim
INNER JOIN
    remote_job_skills ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY
    remote_job_skills.skill_count DESC
LIMIT 5;


    

