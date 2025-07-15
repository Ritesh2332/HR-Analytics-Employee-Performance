Analyzing Employee’s Performance for HR Analytics
Dataset - https://www.kaggle.com/datasets/sanjanchaudhari/employees-performance-for-hr-analytics

Data Pre-processing:
The analysis journey began with data preprocessing, where I meticulously cleaned the 'Uncleaned_employees_final_dataset'. Duplicate rows were eliminated, and irrelevant data types in numeric columns were filtered out using Python.

Exporting Cleaned Dataset:
The cleaned dataset was exported as a CSV file with UTF-8 encoding, facilitating seamless analysis. This refined dataset was saved separately for further exploration.

SQL Queries:
A series of SQL queries were executed to delve into various facets of the dataset:

1. Average Age by Department and Gender: The average age of employees in each department and gender group was calculated, shedding light on demographic characteristics using SQL's AVG() function.

2. Top Departments by Average Training Scores: The top 3 departments with the highest average training scores were identified, providing insights into training effectiveness through SQL's AVG() function and the TOP clause.

3. Percentage of Employees with Awards by Region: By leveraging SQL's COUNT() function and percentage calculation, the percentage of employees who received awards in each region was computed, highlighting regional recognition.

4. Number of Employees with KPIs > 80% by Recruitment Channel and Education Level: The count of employees exceeding 80% in KPIs, categorized by recruitment channel and education level, was determined using SQL's COUNT() function and grouping.

5. Average Length of Service by Department with Previous Year Rating >= 4: The average length of service for employees in each department, specifically those with previous year ratings greater than or equal to 4, was calculated through SQL's AVG() function and conditional filtering.

6. Top Regions by Average Previous Year Ratings: The top 5 regions boasting the highest average previous year ratings were revealed using SQL's AVG() function and the TOP clause.

7. Departments with More than 100 Employees and Length of Service > 5 years: Departments housing over 100 employees with a service duration exceeding 5 years were identified with SQL's COUNT() function and filtering.

8. Average Length of Service for Employees with More than 3 Trainings: The average length of service for employees with more than 3 training sessions, partitioned by department and gender, was computed via SQL's AVG() function and grouping.

9. Percentage of Female Employees with Awards by Department: SQL's COUNT() function and percentage calculation were employed to ascertain the percentage of female employees who received awards per department. Additionally, the count of award-winning female employees and the total number of female employees were displayed.

10. Percentage of Employees with Length of Service between 5 and 10 years: SQL's COUNT() function and percentage calculation were utilized to determine the percentage of employees per department with service durations ranging from 5 to 10 years.

11. Top Regions by Employees with KPIs > 80% and Awards: The top 3 regions with the highest number of employees meeting KPIs exceeding 80% and receiving at least one award, categorized by department and region, were unveiled. This was accomplished through the TOP clause, COUNT() function, and grouping in SQL.

12. Average Length of Service by Education Level and Gender with Training and Score Criteria: SQL's AVG() function, conditional filtering, and grouping were harnessed to compute the average length of service for employees, segmented by education level and gender, who completed more than 2 trainings and achieved an average training score surpassing 75.

Each SQL query was meticulously crafted to address specific analytical questions, aggregating data, applying filters based on conditions, grouping data by relevant criteria, and calculating summary statistics.

Data Visualization in Power BI:
Apart from SQL analysis, the project's findings were brought to life through data visualization in Power BI. This visualization provided an intuitive and engaging representation of key insights extracted from the dataset, enhancing the overall understanding of employee performance and related metrics.

Dashboard 1 -
