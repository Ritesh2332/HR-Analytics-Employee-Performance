show databases;
create database project;
use project;

create table employee(
employee_id int,
department varchar(100),
region varchar(100),
education varchar(100),
gender varchar(10),
recruitment_channel varchar(100),
no_of_trainings int,
age int,
previous_year_rating int,
length_of_service int,
KPIs_met_more_than_80 tinyint,
awards_won tinyint,
avg_training_score int
);

-- Checking the imported data--
select count(*) from employee;
select * from employee limit 5;
 
-- 1. The average age of employees in each department and gender group.
SELECT department, gender, ROUND(AVG(age), 2) AS average_age
FROM employee
GROUP BY department, gender;

-- 2. The top 3 departments with the highest average training scores
SELECT department, ROUND(AVG(avg_training_score), 2) AS average_training_score
FROM employee
GROUP BY department
ORDER BY average_training_score DESC
limit 3;

-- 3. The percentage of employees who have won awards in each region
SELECT region, ROUND((SUM(awards_won) / COUNT(*) * 100), 2) AS percentage_award_winning
FROM employee
GROUP BY region;

-- 4. The number of employees who have met more than 80% of KPIs for each recruitment channel and education level.
SELECT recruitment_channel, education, COUNT(*) AS num_employees
FROM employee
WHERE KPIs_met_more_than_80 = 1
GROUP BY recruitment_channel, education;

-- 5. The average length of service for employees in each department, considering only employees with previous year ratings greater than or equal to 4
SELECT department, ROUND(AVG(length_of_service), 2) AS average_length_of_service
FROM employee
WHERE previous_year_rating >= 4
GROUP BY department;

-- 6. The top 5 regions with the highest average previous year ratings
SELECT region, ROUND(AVG(previous_year_rating), 2) AS average_previous_year_rating
FROM employee
GROUP BY region
ORDER BY average_previous_year_rating DESC
limit 5;

-- 7. the departments with more than 100 employees having a length of service greater than 5 years.
SELECT department
FROM employee
WHERE department IN (
    SELECT department
    FROM employee
    WHERE length_of_service > 5
    GROUP BY department
    HAVING COUNT(*) > 100
);

-- 8. The average length of service for employees who have attended more than 3 trainings, grouped by department and gender.
SELECT department, gender, ROUND(AVG(length_of_service), 2) AS average_length_of_service
FROM employee
WHERE no_of_trainings > 3
GROUP BY department, gender;

-- 9. the percentage of female employees who have won awards, per department. Also show the number of female employees who won awards and total female employees.
SELECT department,
COUNT(CASE WHEN gender = 'f' THEN 1 END) AS num_female_employees,
COUNT(CASE WHEN gender ='f' AND awards_won = 1 THEN 1 END) AS num_female_employees_awarded,
ROUND((COUNT(CASE WHEN gender = 'f' AND awards_won = 1 THEN 1 END) * 100.0 / NULLIF(COUNT(CASE WHEN gender = 'f' THEN 1 END), 0)), 2) AS percentage_female_awarded
FROM employee
GROUP BY department;

-- 10. the percentage of employees per department who have a length of service between 5 and 10 years.
SELECT department,
ROUND((COUNT(CASE WHEN length_of_service >= 5 AND length_of_service <= 10 THEN 1 END) * 100.0 / COUNT(*)), 2) AS percentage
FROM employee
GROUP BY department;

-- 11. the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, grouped by department and region.
SELECT department, region, COUNT(*) AS num_employees
FROM employee
WHERE KPIs_met_more_than_80 = 1 AND awards_won > 0
GROUP BY department, region
ORDER BY num_employees DESC
limit 3;

-- 12. The average length of service for employees per education level and gender, considering only those employees who have completed more than 2 trainings and have an average training score greater than 75 
SELECT education, gender, ROUND(AVG(length_of_service), 2) AS average_length_of_service
FROM employee
WHERE no_of_trainings > 2 AND avg_training_score > 75
GROUP BY education, gender;

-- 13. For each department and recruitment channel, the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and have a length of service greater than 10 years.
SELECT department, recruitment_channel, COUNT(*) AS num_employees
FROM employee
WHERE KPIs_met_more_than_80 = 1 AND previous_year_rating = 5 AND length_of_service > 10
GROUP BY department, recruitment_channel;

-- 14. The percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and an average training score above 70, grouped by department and gender
SELECT department, gender,
ROUND((COUNT(CASE WHEN awards_won = 1 AND (previous_year_rating = 4 OR previous_year_rating = 5) AND avg_training_score > 70 THEN 1 END) * 100.0 / COUNT(*)), 2) AS percentage
FROM employee
GROUP BY department, gender;

-- 15. the top 5 recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and an age between 25 and 45 years, grouped by department and recruitment channel.
SELECT recruitment_channel, department,
ROUND(AVG(length_of_service), 2) AS average_length_of_service
FROM employee
WHERE KPIs_met_more_than_80 = 1 AND previous_year_rating = 5 AND age BETWEEN 25 AND 45
GROUP BY recruitment_channel, department
ORDER BY average_length_of_service DESC
limit 5;
 
 
