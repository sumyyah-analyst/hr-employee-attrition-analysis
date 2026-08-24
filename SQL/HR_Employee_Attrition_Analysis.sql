-- Final SQL Portfolio Script 🎯



--### 1. Database & Table

```sql
USE HR_Employee_Attrition;
GO

-- HR Employee Attrition Analysis
-- Dataset: IBM HR Analytics Employee Attrition
-- Rows: 1,470
-- Columns: 35
```

### 2. Data Validation

```sql
-- Check total rows
SELECT COUNT(*) AS Total_Rows
FROM dbo.[HR-EmployeeAttrition];


-- Check duplicate Employee Numbers
SELECT
    EmployeeNumber,
    COUNT(*) AS Duplicate_Count
FROM dbo.[HR-EmployeeAttrition]
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;


-- Check missing values in key columns
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(EmployeeNumber) AS EmployeeNumber,
    COUNT(Age) AS Age,
    COUNT(Attrition) AS Attrition,
    COUNT(Department) AS Department,
    COUNT(JobRole) AS JobRole,
    COUNT(Gender) AS Gender,
    COUNT(MonthlyIncome) AS MonthlyIncome,
    COUNT(OverTime) AS OverTime
FROM dbo.[HR-EmployeeAttrition];
```

### 3. Overall Workforce KPIs

```sql
SELECT
    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    SUM(CASE WHEN Attrition = 0 THEN 1 ELSE 0 END) AS Active_Employees,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate,

    CAST(AVG(Age) AS DECIMAL(5,2)) AS Average_Age,

    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income

FROM dbo.[HR-EmployeeAttrition];
```

### 4. Attrition by Department

```sql
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY Department
ORDER BY Employees_Left DESC;
```

### 5. Attrition by Job Role

```sql
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY JobRole
ORDER BY Employees_Left DESC;
```

### 6. Attrition by Gender

```sql
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY Gender
ORDER BY Attrition_Rate DESC;
```

### 7. Attrition by Age Group

```sql
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS Age_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]

GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END

ORDER BY Attrition_Rate DESC;
```

### 8. Attrition by Income Band

```sql
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome <= 7000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Band,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]

GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome <= 7000 THEN 'Medium'
        ELSE 'High'
    END

ORDER BY Attrition_Rate DESC;
```

### 9. OverTime & Attrition

```sql
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;
```

### 10. Attrition by Education Field

```sql
SELECT
    EducationField,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY EducationField
ORDER BY Attrition_Rate DESC;
```

### 11. Work-Life Balance & Attrition

```sql
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,

    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.[HR-EmployeeAttrition]
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

