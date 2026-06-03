use mydatabase;
show tables;

select * from crop_production;
select * from Climate_Agriculture;

# Q1. Display total production for each state. Sort in descending order.
SELECT State, SUM(Production) AS total_production
FROM Crop_Production
GROUP BY State
ORDER BY total_production DESC;

# Q2. Find average annual rainfall.
SELECT AVG(Annual_Rainfall) AS average_annual_rainfall
FROM Climate_Agriculture;

# Q3. Display crops with production greater than 50,000.
SELECT Crop, Production
FROM Crop_Production
WHERE Production > 50000;

# Q4. Show total production and average rainfall for each crop.

SELECT
    c.Crop,
    SUM(c.Production) AS total_production,
    AVG(cl.Annual_Rainfall) AS average_rainfall
FROM Crop_Production c
JOIN Climate_Agriculture cl
ON c.Record_ID = cl.Record_ID
GROUP BY c.Crop;

# Q5. Display states where total production is greater than 200000.
SELECT State,
       SUM(Production) AS total_production
FROM Crop_Production
GROUP BY State
HAVING SUM(Production) > 200000;

# Q6. Find crops whose average production is higher than overall average production.
SELECT Crop,
       AVG(Production) AS avg_production
FROM Crop_Production
GROUP BY Crop
HAVING AVG(Production) >
(
    SELECT AVG(Production)
    FROM Crop_Production
);

# Q7. Display state-wise total production and average fertilizer usage.
SELECT
    c.State,
    SUM(c.Production) AS total_production,
    AVG(cl.Fertilizer) AS average_fertilizer_usage
FROM Crop_Production c
JOIN Climate_Agriculture cl
ON c.Record_ID = cl.Record_ID
GROUP BY c.State;

# Q8. Find the state with the highest total production.
SELECT State,
       SUM(Production) AS total_production
FROM Crop_Production
GROUP BY State
ORDER BY total_production DESC
LIMIT 1;

# Q9. Find crops grown where rainfall is above overall average rainfall.
SELECT DISTINCT c.Crop
FROM Crop_Production c
JOIN Climate_Agriculture cl
ON c.Record_ID = cl.Record_ID
WHERE cl.Annual_Rainfall >
(
    SELECT AVG(Annual_Rainfall)
    FROM Climate_Agriculture
);

# Q10. Find states where the total production is greater than 200000 and the average annual rainfall is greater than 800 mm. 
#Display state, total production, and average rainfall. Sort by total production in descending order.
SELECT
    c.State,
    SUM(c.Production) AS total_production,
    AVG(cl.Annual_Rainfall) AS average_rainfall
FROM Crop_Production c
JOIN Climate_Agriculture cl
ON c.Record_ID = cl.Record_ID
GROUP BY c.State
HAVING SUM(c.Production) > 200000
   AND AVG(cl.Annual_Rainfall) > 800
ORDER BY total_production DESC;

