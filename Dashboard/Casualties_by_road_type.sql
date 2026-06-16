--query for Casualties by road type of CY Casualties and PY Casualties--
SELECT road_type, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022'
GROUP BY road_type 

SELECT road_type, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2021'
GROUP BY road_type

--query for Casualties by road type in fatal,serious and slight condition--
SELECT road_type, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Fatal'
GROUP BY road_type

SELECT road_type, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2021' AND accident_severity = 'Fatal'
GROUP BY road_type

SELECT road_type, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Serious'
GROUP BY road_type

SELECT road_type, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2021' AND accident_severity = 'Serious'
GROUP BY road_type

SELECT road_type, SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Slight'
GROUP BY road_type

SELECT road_type, SUM(number_of_casualties) AS PY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2021' AND accident_severity = 'Slight'
GROUP BY road_type
