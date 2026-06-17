--query for Casualties by light condition--
SELECT 
    CASE 
       WHEN light_conditions IN ('Daylight') THEN 'Day'
       WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END AS Light_Condition,
       CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE EXTRACT(YEAR FROM accident_date) = '2022') AS DECIMAL(10,2)) AS CY_Casualties_PCT
       FROM road_accident
       WHERE EXTRACT(YEAR FROM accident_date) = '2022'
       GROUP BY
          CASE
            WHEN light_conditions IN ('Daylight') THEN 'Day'
            WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END

--query for Casualties by light condition in Fatal,Serious and Slight Condition--
SELECT 
    CASE 
       WHEN light_conditions IN ('Daylight') THEN 'Day'
       WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END AS Light_Condition,
       CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Fatal') AS DECIMAL(10,2)) AS CY_Casualties_PCT
       FROM road_accident
       WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Fatal'
       GROUP BY
          CASE
            WHEN light_conditions IN ('Daylight') THEN 'Day'
            WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END

SELECT 
    CASE 
       WHEN light_conditions IN ('Daylight') THEN 'Day'
       WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END AS Light_Condition,
       CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Serious') AS DECIMAL(10,2)) AS CY_Casualties_PCT
       FROM road_accident
       WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Serious'
       GROUP BY
          CASE
            WHEN light_conditions IN ('Daylight') THEN 'Day'
            WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END

SELECT 
    CASE 
       WHEN light_conditions IN ('Daylight') THEN 'Day'
       WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END AS Light_Condition,
       CAST(CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) * 100 / (SELECT CAST(SUM(number_of_casualties) AS DECIMAL(10,2)) FROM road_accident WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Slight') AS DECIMAL(10,2)) AS CY_Casualties_PCT
       FROM road_accident
       WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Slight'
       GROUP BY
          CASE
            WHEN light_conditions IN ('Daylight') THEN 'Day'
            WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit', 'Darkness - no lighting') THEN 'Night'
       END