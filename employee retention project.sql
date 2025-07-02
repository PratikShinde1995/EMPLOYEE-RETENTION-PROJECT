create DATABASE HR;
USE HR;
SELECT count(*)
FROM HR_2 - COPY;
SELECT count(*) FROM hr.`hr_2 - copy`;
SELECT * FROM HR2; 
select count(*) from hrtable;

/*1.Average Attrition rate for all Departments*/

SELECT DEPARTMENT,round(AVG(ATTRITION)*100,2) AS "ATTRITION RATE"
FROM HRTABLE
GROUP BY DEPARTMENT
ORDER BY round(AVG(ATTRITION)*100,2);

UPDATE HRTABLE
SET ATTRITION=0
WHERE ATTRITION="NO";

/*2.Average Hourly rate of Male Research Scientist*/
select gender,avg(hourlyrate)
from hrtable
where gender in("male") and jobrole in ("research scientist")
group by gender;

/*3.Attrition rate Vs Monthly income stats*/
select attrition,round(avg(monthlyincome),2) as "AVG MONTHLY INCOME"
from hr2 inner join hrtable
on hr2.`Employee ID`=hrtable.employeenumber
where attrition=1
group by attrition;

/*4.Average working years for each Department*/
SELECT DEPARTMENT,ROUND(AVG(TOTALWORKINGYEARS),2)
FROM HR2 INNER JOIN HRTABLE
ON hr2.`Employee ID`=hrtable.employeenumber
GROUP BY DEPARTMENT
order by ROUND(AVG(TOTALWORKINGYEARS),2);

/*5.Job Role Vs Work life balance*/
SELECT JOBROLE,ROUND(AVG(WORKLIFEBALANCE),2) AS "WORK LIFE BAMLANCE"
FROM HR2 INNER JOIN HRTABLE
ON hr2.`Employee ID`=hrtable.employeenumber
GROUP BY JOBROLE
order by ROUND(AVG(WORKLIFEBALANCE),2) DESC;

/*6.Attrition rate Vs Year since last promotion relation*/
SELECT AVG(YEARSSINCELASTPROMOTION)
FROM HR2 INNER JOIN HRTABLE
ON hr2.`Employee ID`=hrtable.employeenumber
WHERE ATTRITION=1
GROUP BY ATTRITION;

