-- 1. Add one person to the employees table with the name Albert
INSERT INTO employees (Name, Position, Join_Date, Year_of_Experience, Salary)
VALUES ('Albert', 'enginner', '2024-01-24', 2.5, 50);

-- 2. Update table with position engineer with salary $85
UPDATE employees
SET Salary = 85
WHERE Position = 'engineer';

-- 3. Calculate total salary expenditure for the year 2021
SELECT SUM(Salary) AS Total_Salary_2021
FROM employees
WHERE (Join_Date <= '2021-12-31' AND (Release_Date IS NULL OR Release_Date >= '2021-01-01'))
OR (Join_Date BETWEEN '2021-01-01' AND '2021-12-31')
OR (Release_Date BETWEEN '2021-01-01' AND '2021-12-31');

-- 4. Sort and display the 3 employees with the most Years of Experience
SELECT Name, Position, Year_of_Experience
FROM employees
ORDER BY Year_of_Experience DESC
LIMIT 3;

-- 5. Write a subquery for employees with position engineer who have experience less than or equal to 3 years
SELECT *
FROM employees
WHERE Position = 'enginner'
AND Year_of_Experience <= 3;