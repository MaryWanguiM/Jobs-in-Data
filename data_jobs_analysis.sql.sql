-- Select the database first so the ALTER statement knows where the table is
USE jobs_in_data;

-- The CSV import left a hidden BOM character on the first column name,
-- so rename it back to work_year
ALTER TABLE jobs_in_data13
RENAME COLUMN `ï»¿work_year` TO `work_year`;

-- Summary table used for the Power BI dashboard
SELECT
    work_year,
    job_category,
    salary_currency,
    experience_level,
    work_setting,
    company_location,
    company_size,
    COUNT(*) AS no_of_positions,
    SUM(salary_in_usd) AS sum_salary
FROM jobs_in_data13
GROUP BY 1, 2, 3, 4, 5, 6, 7;
    
