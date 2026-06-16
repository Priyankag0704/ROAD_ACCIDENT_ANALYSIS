SELECT * FROM road_accident;

--query to find Primary KPI of the Dashboard-- 
SELECT sum(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022'

SELECT COUNT(DISTINCT accident_index) AS CY_Accidents
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022'

SELECT sum(number_of_casualties) AS CY_Fatal_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Fatal'

SELECT sum(number_of_casualties) AS CY_Serious_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Serious'

SELECT sum(number_of_casualties) AS CY_Slight_Casualties
FROM road_accident
WHERE accident_severity = 'Slight'

--query to find out percentage for serious,slight and fatal
SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))*100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))FROM road_accident) AS PCT
FROM road_accident
WHERE accident_severity='Fatal'

SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))*100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))FROM road_accident) AS PCT
FROM road_accident
WHERE accident_severity='Serious'

SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))*100/
(SELECT CAST(SUM(number_of_casualties) AS Decimal(10,2))FROM road_accident) AS PCT
FROM road_accident
WHERE accident_severity='Slight'

--query to find Secondary KPI of the dashboard--
SELECT
    CASE 
       WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
       WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
       WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
       WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
       WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
       ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
    FROM road_accident
    --WHERE EXTRACT(YEAR FROM accident_date) = '2022'
    GROUP BY
       CASE
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
     END 

--query to find Secondary KPI for Fatal Condition--
SELECT
    CASE 
       WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
       WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
       WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
       WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
       WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
       ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
    FROM road_accident
    WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Fatal'
    GROUP BY
       CASE
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
     END 

--query to find Secondary KPI for Serious Condition--
SELECT
    CASE 
       WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
       WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
       WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
       WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
       WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
       ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
    FROM road_accident
    WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Serious'
    GROUP BY
       CASE
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
     END 

--query to find Secondary KPI for Slight Condition--
SELECT
    CASE 
       WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
       WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
       WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
       WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
       WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
       ELSE 'Other'
    END AS vehicle_group,
    SUM(number_of_casualties) AS CY_Casualties
    FROM road_accident
    WHERE EXTRACT(YEAR FROM accident_date) = '2022' AND accident_severity = 'Slight'
    GROUP BY
       CASE
        WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
        WHEN vehicle_type IN ('Car' , 'Taxi/Private hire car') THEN 'Cars'
        WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc', 'Pedal cycle') THEN 'Bike'
        WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
        WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Van'
        ELSE 'Other'
     END 