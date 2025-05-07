SELECT *
FROM hr_test.hr;

-- attrition rate
WITH att_rate AS (
SELECT 
	COUNT(*) AS total_employees,
	COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) AS gone
FROM hr_test.hr
)
SELECT 
	ROUND((gone * 100.0) / total_employees, 2) AS attrition_rate
FROM
	att_rate;

-- attrition rate by gender
SELECT 
	"Gender",
	ROUND(COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS att_rate
FROM 
	hr_test.hr
GROUP BY
	"Gender";
	
-- attrition rate by department
SELECT 
	"Department",
	ROUND(COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS att_rate
FROM 
	hr_test.hr
GROUP BY
	"Department";

-- attrition rate by work life balance
SELECT 
	"WorkLifeBalance",
	ROUND(COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS att_rate
FROM 
	hr_test.hr
GROUP BY
	"WorkLifeBalance"
ORDER BY "WorkLifeBalance";

-- attrition rate by time at company
SELECT 
	"YearsAtCompany",
	ROUND(COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS att_rate
FROM 
	hr_test.hr
WHERE 
	"YearsAtCompany" <= 25
GROUP BY
	"YearsAtCompany"
ORDER BY "YearsAtCompany";

-- average tenure by attrition status (y/n)
SELECT 
	employee_attrition AS status,
	ROUND(AVG("YearsAtCompany"), 2) AS avg_tenure
FROM 
	hr_test.hr
GROUP BY employee_attrition;

-- attr rate by job satisfaction
SELECT 
	"JobSatisfaction",
	ROUND(COUNT(CASE WHEN employee_attrition = 'Yes' THEN 1 ELSE NULL END) * 100.0 / COUNT(*), 2) AS attr_rate
FROM 
	hr_test.hr
GROUP BY
	"JobSatisfaction"
