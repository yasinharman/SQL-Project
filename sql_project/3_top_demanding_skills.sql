/*
Question: What are the most in-demand skills for data analysts?
- Identify the top 5 in demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers
*/

SELECT
    skills_dim.skills AS skill_name,
    COUNT(*) AS demand_count
FROM 
    skills_job_dim
JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Engineer'
GROUP BY
    skills_dim.skill_id
ORDER BY
    demand_count DESC
LIMIT 5; 






