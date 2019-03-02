-- выбрать аэропорты, способные принять а380

SELECT AIRPORT_ID FROM AIRPORTS
WHERE Able_to_accomodate_A380=1


-- выбрать авиалинии, не использующие самолеты производства РФ

SELECT AIRLINE_ID FROM AIRLINES
INNER JOIN AC_Brands
ON AIRLINE_ID=BRAND_ID WHERE Country_of_manufacture!='Russia'


-- выбрать авиалинии, использующие самолеты с maiden flight в 20 веке

SELECT AIRLINE_ID FROM AIRLINES
INNER JOIN PLANES
ON AIRPLINE_ID=PLANE_ID WHERE Year_of_Maiden_Flight<2000


-- выбрать авиалинии, не использующие Falcon X7

SELECT AIRLINE_ID FROM AIRLINES
WHERE Dassault_Falcon_7X !=1


--Посчитать кол-во самолетов вместимостью до 20 человек у каждой компании
SELECT SUM(PLANES_NUMBER) FROM FLEETS
INNER JOIN PLANES
ON PLANE_ID=PLANE_ID WHERE Pas_Capacity<21
GROUP BY AIRLINE_ID


--Средняя дальность полета у самолетов, которые выпущены после 2000 года 
SELECT AVG(Range) FROM PLANES
WHERE Year_of_Maiden_Flight>1999


--Средняя дальность полетов у каждой авиакомпании
SELECT AVG(Range) FROM PLANES
INNER JOIN AIRLINES
ON PLANE_ID=AIRLINE_ID GROUP BY AIRLINE_ID


--Общая сумма дальностей всего флота компании
SELECT SUM(Range) FROM PLANES
INNER JOIN FLEETS
ON PLANE_ID=PLANE_ID GROUP BY AIRLINE_ID


--Посчитать самолеты в каждом флоте, у которых больше 20 пассажиров
SELECT COUNT(PLANE_ID) FROM FLEETS
INNER JOIN PLANES
ON PLANE_ID=PLANE_ID WHERE Pas_Capacity<20
GROUP BY AIRLINE_ID