WITH average_salary_per_company AS (
    SELECT
        company_id,
        AVG(salary_year_avg) AS average_salary
    FROM
        job_postings_fact
    WHERE
        salary_year_avg IS NOT NULL
    GROUP BY
        company_id
),

average_salary_all AS (
    SELECT
        AVG(salary_year_avg) AS overall_salary
    FROM
        job_postings_fact
)

SELECT
    company_dim.name AS company_name,
    CASE
        WHEN average_salary_per_company.average_salary > average_salary_all.overall_salary THEN 'Higher than average' 
        WHEN average_salary_per_company.average_salary < average_salary_all.overall_salary THEN 'Lower than average'
    END AS salary_compared_overall

FROM company_dim
JOIN
    average_salary_per_company ON average_salary_per_company.company_id = company_dim.company_id
CROSS JOIN average_salary_all