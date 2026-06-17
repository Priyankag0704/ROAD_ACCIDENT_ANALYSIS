--query for Top 10 locations of Casualties--
SELECT local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
GROUP BY local_authority
ORDER BY Total_Casualties DESC
LIMIT 10

--query for Top 10 locations of Casualties in Fatal, Serious and Slight Condition
SELECT local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Fatal'
GROUP BY local_authority
ORDER BY Total_Casualties DESC
LIMIT 10

SELECT local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Serious'
GROUP BY local_authority
ORDER BY Total_Casualties DESC
LIMIT 10

SELECT local_authority, SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Slight'
GROUP BY local_authority
ORDER BY Total_Casualties DESC
LIMIT 10