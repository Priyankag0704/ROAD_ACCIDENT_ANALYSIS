--query for casualties of urban or rural area--
SELECT urban_or_rural_area ,CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2))* 100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2)) FROM road_accident WHERE EXTRACT(YEAR from accident_date)='2022') AS DECIMAL(10,2)) AS PCT
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022'
GROUP BY urban_or_rural_area

--query for fatal condition--
SELECT urban_or_rural_area ,CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2))* 100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2)) FROM road_accident WHERE EXTRACT(YEAR from accident_date)='2022' AND accident_severity = 'Fatal') AS DECIMAL(10,2)) AS PCT
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Fatal'
GROUP BY urban_or_rural_area

--query for serious condition--
SELECT urban_or_rural_area ,CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2))* 100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2)) FROM road_accident WHERE EXTRACT(YEAR from accident_date)='2022' AND accident_severity = 'Serious') AS DECIMAL(10,2)) AS PCT
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Serious'
GROUP BY urban_or_rural_area

--query for slight condition--
SELECT urban_or_rural_area ,CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2))* 100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2)) FROM road_accident WHERE EXTRACT(YEAR from accident_date)='2022' AND accident_severity = 'Slight') AS DECIMAL(10,2)) AS PCT
FROM road_accident
WHERE EXTRACT(YEAR from accident_date) = '2022' AND accident_severity = 'Slight'
GROUP BY urban_or_rural_area