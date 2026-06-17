--query for monthly trend of CY vs PY Casualties--
SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2022'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2021'
GROUP BY TO_CHAR(accident_date,'FMMonth')

--query for CY vs PY Casualties monthly trend in Fatal, Serious, Slight Condition--
SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2022' AND accident_severity = 'Fatal'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2021' AND accident_severity = 'Fatal'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2022' AND accident_severity = 'Serious'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2021' AND accident_severity = 'Serious'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2022' AND accident_severity = 'Slight'
GROUP BY TO_CHAR(accident_date,'FMMonth')

SELECT TO_CHAR(accident_date,'FMMonth') AS Month_Name, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) ='2021' AND accident_severity = 'Slight'
GROUP BY TO_CHAR(accident_date,'FMMonth')