WITH skill_count AS (
        SELECT
            skill_id,
            COUNT(*) AS count
        FROM 
            skills_job_dim
        GROUP BY
            skill_id
        ORDER BY
            count DESC
        LIMIT 5
)

SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    skill_count.count
FROM
    skills_dim
JOIN skill_count ON skill_count.skill_id = skills_dim.skill_id 






