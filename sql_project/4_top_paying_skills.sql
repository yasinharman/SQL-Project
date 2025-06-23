/*
Question: What are the top skills based on the salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Engineers and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
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
    skill_name
ORDER BY
    average_salary DESC
LIMIT 25;

/*
[
  {
    "skill_name": "node",
    "average_salary": "181862"
  },
  {
    "skill_name": "mongo",
    "average_salary": "179403"
  },
  {
    "skill_name": "ggplot2",
    "average_salary": "176250"
  },
  {
    "skill_name": "solidity",
    "average_salary": "166250"
  },
  {
    "skill_name": "vue",
    "average_salary": "159375"
  },
  {
    "skill_name": "codecommit",
    "average_salary": "155000"
  },
  {
    "skill_name": "ubuntu",
    "average_salary": "154455"
  },
  {
    "skill_name": "clojure",
    "average_salary": "153663"
  },
  {
    "skill_name": "cassandra",
    "average_salary": "150255"
  },
  {
    "skill_name": "rust",
    "average_salary": "147771"
  },
  {
    "skill_name": "drupal",
    "average_salary": "147500"
  },
  {
    "skill_name": "perl",
    "average_salary": "145540"
  },
  {
    "skill_name": "next.js",
    "average_salary": "145000"
  },
  {
    "skill_name": "angular",
    "average_salary": "143319"
  },
  {
    "skill_name": "scala",
    "average_salary": "143161"
  },
  {
    "skill_name": "kafka",
    "average_salary": "143086"
  },
  {
    "skill_name": "gdpr",
    "average_salary": "142369"
  },
  {
    "skill_name": "shell",
    "average_salary": "141725"
  },
  {
    "skill_name": "macos",
    "average_salary": "141617"
  },
  {
    "skill_name": "numpy",
    "average_salary": "141605"
  },
  {
    "skill_name": "opencv",
    "average_salary": "141250"
  },
  {
    "skill_name": "atlassian",
    "average_salary": "140644"
  },
  {
    "skill_name": "ibm cloud",
    "average_salary": "140547"
  },
  {
    "skill_name": "splunk",
    "average_salary": "140156"
  },
  {
    "skill_name": "kubernetes",
    "average_salary": "140092"
  }
]
*/