# 🚦 Road Accident Data Analysis using PostgreSQL

## 📌 Introduction

This project demonstrates an end-to-end data analysis workflow using **PostgreSQL and SQL** to analyze road accident datasets. The objective is to identify patterns in accident severity, vehicle involvement, road conditions, and environmental factors to generate actionable insights for improving road safety.

The project focuses on transforming raw structured data into meaningful business insights using SQL-based analysis techniques.

---

## 📖 Background

Road accidents pose significant public safety challenges worldwide. Understanding accident patterns helps authorities improve infrastructure, enforce safety regulations, and reduce casualties.

This project answers key analytical questions such as:

* Which vehicle types are most involved in accidents?
* What road conditions contribute to higher accident severity?
* How do accident trends vary over time?
* Which locations are high-risk accident zones?

The analysis is performed using PostgreSQL-based querying and aggregation techniques and can be integrated with visualization tools like Power BI and Tableau.

---

## 🛠 Tools & Technologies Used

* PostgreSQL
* SQL
* pgAdmin 4
* Visual Studio Code
* Git & GitHub
* Power BI / Tableau (Optional)

---

## 📊 Data Analysis & Methodology

### 🚑 Casualty Analysis

* Total casualties
* Fatal casualties
* Serious casualties
* Slight casualties
* Total accidents

### 🚗 Vehicle Type Analysis

* Cars
* Bikes
* Buses
* Vans
* Agricultural vehicles
* Others

### 📅 Time-Series Analysis

* Current Year vs Previous Year monthly trends

### 🛣 Road Type Analysis

* Single carriageway
* Dual carriageway
* Roundabouts
* One-way streets
* Slip roads

### 📍 Location Analysis

* Urban vs Rural distribution
* Top 10 accident-prone locations

### 🌦 Environmental Analysis

* Light conditions
* Weather conditions
* Road surface conditions

---

# 🔍 SQL Queries & Outputs

## 1️⃣ Total Casualties (Current Year - 2022)

### SQL Query

```sql
SELECT SUM(number_of_casualties) AS CY_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = 2022;
```

### Output

| CY_Casualties |
| ------------: |
|       195,737 |

---

## 2️⃣ Total Accidents (Current Year - 2022)

### SQL Query

```sql
SELECT COUNT(DISTINCT accident_index) AS CY_Accidents
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date) = 2022;
```

### Output

| CY_Accidents |
| -----------: |
|      144,419 |

---

## 3️⃣ Casualties by Accident Severity

### SQL Query

```sql
SELECT
    accident_severity,
    SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date)=2022
GROUP BY accident_severity
ORDER BY Total_Casualties DESC;
```

### Output

| Accident Severity | Casualties |
| ----------------- | ---------: |
| Slight            |    165,808 |
| Serious           |     27,045 |
| Fatal             |      2,884 |

---

## 4️⃣ Casualties by Vehicle Type

### SQL Query

```sql
SELECT
CASE
    WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agricultural'
    WHEN vehicle_type IN ('Car','Taxi/Private hire car') THEN 'Cars'
    WHEN vehicle_type IN
    ('Motorcycle 125cc and under',
     'Motorcycle 50cc and under',
     'Motorcycle over 125cc and up to 500cc',
     'Motorcycle over 500cc',
     'Pedal cycle')
     THEN 'Bike'
    WHEN vehicle_type IN
    ('Bus or coach (17 or more pass seats)',
     'Minibus (8 - 16 passenger seats)')
     THEN 'Bus'
    WHEN vehicle_type IN
    ('Goods 7.5 tonnes mgw and over',
     'Goods over 3.5t. and under 7.5t',
     'Van / Goods 3.5 tonnes mgw or under')
     THEN 'Van'
    ELSE 'Others'
END AS Vehicle_Group,
SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date)=2022
GROUP BY Vehicle_Group
ORDER BY Total_Casualties DESC;
```

### Output

| Vehicle Type | Casualties |
| ------------ | ---------: |
| Cars         |    155,804 |
| Van          |     15,905 |
| Bike         |     15,610 |
| Bus          |      6,573 |
| Others       |      1,446 |
| Agricultural |        399 |

---

## 5️⃣ Casualties by Road Type

### SQL Query

```sql
SELECT
    road_type,
    SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date)=2022
GROUP BY road_type
ORDER BY Total_Casualties DESC;
```

### Output

| Road Type          | Casualties |
| ------------------ | ---------: |
| Single carriageway |       145K |
| Dual carriageway   |        32K |
| Roundabout         |        13K |
| One way street     |         3K |
| Slip road          |         3K |

---

## 6️⃣ Urban vs Rural Casualties

### SQL Query

```sql
SELECT
    urban_or_rural_area,
    ROUND(
        SUM(number_of_casualties)*100.0/
        (SELECT SUM(number_of_casualties)
         FROM road_accident
         WHERE EXTRACT(YEAR FROM accident_date)=2022),2
    ) AS Percentage
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date)=2022
GROUP BY urban_or_rural_area;
```

### Output

| Area  | Percentage |
| ----- | ---------: |
| Urban |     61.95% |
| Rural |     38.05% |

---

## 7️⃣ Casualties by Light Conditions

### SQL Query

```sql
SELECT
CASE
    WHEN light_conditions='Daylight'
         THEN 'Day'
    ELSE 'Night'
END AS Light_Condition,
ROUND(
SUM(number_of_casualties)*100.0/
(SELECT SUM(number_of_casualties)
 FROM road_accident
 WHERE EXTRACT(YEAR FROM accident_date)=2022),2
) AS Percentage
FROM road_accident
WHERE EXTRACT(YEAR FROM accident_date)=2022
GROUP BY Light_Condition;
```

### Output

| Light Condition | Percentage |
| --------------- | ---------: |
| Day             |     73.84% |
| Night           |     26.16% |

---

## 8️⃣ Top 10 Locations with Highest Casualties

### SQL Query

```sql
SELECT
    local_authority,
    SUM(number_of_casualties) AS Total_Casualties
FROM road_accident
GROUP BY local_authority
ORDER BY Total_Casualties DESC
LIMIT 10;
```

### Output

| Rank | Location   | Casualties |
| ---: | ---------- | ---------: |
|    1 | Birmingham |    Highest |
|    2 | Leeds      |        ... |
|    3 | Bradford   |        ... |
|  ... | ...        |        ... |

---

## 📈 Key Insights

* Slight casualties account for the majority of road accident casualties.
* Cars contribute to the highest number of casualties among all vehicle types.
* Urban areas experience significantly higher accident rates than rural areas.
* Single carriageways are the most accident-prone road type.
* Daylight conditions account for nearly 74% of casualties.
* Environmental factors such as road surface and weather conditions influence accident severity.

---

## 🎯 Skills Demonstrated

* SQL Data Analysis
* PostgreSQL Database Management
* Data Cleaning & Transformation
* Aggregate Functions
* CASE Statements
* GROUP BY & ORDER BY
* Date Functions
* Time-Series Analysis
* Exploratory Data Analysis (EDA)
* Business Insight Generation
* Problem Solving

---

## 📌 Business Impact

This analysis can support:

* Road safety policy improvements
* Accident hotspot identification
* Infrastructure planning
* Traffic regulation enhancements
* Data-driven decision making

---

## 📚 Conclusion

This project demonstrates how **PostgreSQL and SQL can be leveraged for exploratory data analysis and business insight generation**. By analyzing accident severity, vehicle types, road infrastructure, and environmental factors, meaningful patterns were identified that can contribute to improved road safety strategies.

---

### ⭐ If you found this project useful, feel free to star the repository.
