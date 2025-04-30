-- 1. Tambahkan satu personal dalam table dengan nama employee Albert
INSERT INTO employees (Name, Position, Join_Date, Year_of_Experience, Salary)
VALUES ('Albert', 'enginner', '2024-01-24', '2.5 Years', 50);

-- 2. Update table dengan posisi enginner with salaray $85
UPDATE employees
SET Salary = 85
WHERE Position = 'enginner';

-- 3. Hitung total pengeluaran salary saat tahun 2021
SELECT SUM(Salary) AS Total_Salary_2021
FROM employees
WHERE (Join_Date <= '2021-12-31' AND (Release_Date IS NULL OR Release_Date >= '2021-01-01'))
OR (Join_Date BETWEEN '2021-01-01' AND '2021-12-31')
OR (Release_Date BETWEEN '2021-01-01' AND '2021-12-31');

-- 4. Sorting menampilkan 3 employee paling banyak yang memiliki Years of Experience
SELECT Name, Position, Year_of_Experience
FROM employees
ORDER BY CAST(SUBSTRING(Year_of_Experience, 1, LOCATE(' ', Year_of_Experience) - 1) AS DECIMAL) DESC
LIMIT 3;

-- 5. Tuliskan subquery untuk employee dengan posisi engginer yang memiliki exeperience kurang dari sama dengan 3 tahun
SELECT *
FROM employees
WHERE Position = 'enginner'
AND CAST(SUBSTRING(Year_of_Experience, 1, LOCATE(' ', Year_of_Experience) - 1) AS DECIMAL) <= 3;