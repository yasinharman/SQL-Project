WITH number_skills_requested_each_company AS (
    SELECT
        company_dim.company_id,
        company_dim.name AS company_name,
        COUNT(DISTINCT skills_dim.skill_id) AS number_of_skills_requested
    FROM 
        company_dim
    LEFT JOIN job_postings_fact 
        ON company_dim.company_id = job_postings_fact.company_id
    LEFT JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim 
        ON skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY
        company_name,
        company_dim.company_id
),
max_salary_offered AS (
    SELECT
        company_dim.company_id,
        company_dim.name AS company_name,
        MAX(salary_year_avg) AS max_salary
    FROM
        company_dim
    LEFT JOIN job_postings_fact ON job_postings_fact.company_id = company_dim.company_id

    GROUP BY
        company_name,
        company_dim.company_id
    ORDER BY
        max_salary DESC
)

SELECT
    company_dim.name,
    number_skills_requested_each_company.number_of_skills_requested,
    max_salary_offered.max_salary
FROM
    company_dim
lEFT JOIN number_skills_requested_each_company 
    ON number_skills_requested_each_company.company_id = company_dim.company_id
LEFT JOIN max_salary_offered 
    ON max_salary_offered.company_id = company_dim.company_id
ORDER BY
    company_dim.name
