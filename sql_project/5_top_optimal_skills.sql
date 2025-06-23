/*
Question: What are the most optimal skills to learn (aka its's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Engineer roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

WITH top_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(*) AS demand_count
    FROM 
        skills_job_dim
    JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Engineer' AND
        job_postings_fact.job_work_from_home = TRUE AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
    ORDER BY
        demand_count DESC
),
average_salary_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0)  AS average_salary
    FROM
        skills_dim
    JOIN skills_job_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_postings_fact.salary_year_avg IS NOT NULL AND
        job_postings_fact.job_title_short = 'Data Engineer'
    GROUP BY
        skills_dim.skill_id,
        skill_name
    ORDER BY
        average_salary DESC
)
SELECT
    skills_dim.skills AS skill_name,
    top_demand.demand_count,
    average_salary_skills.average_salary
FROM
    skills_dim
JOIN top_demand ON top_demand.skill_id = skills_dim.skill_id
JOIN average_salary_skills ON average_salary_skills.skill_id = skills_dim.skill_id
ORDER BY
    demand_count DESC