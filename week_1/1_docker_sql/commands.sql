-- Implicit inner join:
SELECT
tpep_pickup_datetime,
tpep_dropoff_datetime,
total_amount,
CONCAT(zpu."Borough", '/', zpu."Zone") AS "pickup_loc",
CONCAT(zdo."Borough", '/', zdo."Zone") AS "dropoff_loc"
FROM
yellow_taxi_trips t,
zones zpu,
zones zdo
WHERE
t."PULocationID" = zpu."LocationID" AND
t."DOLocationID" = zdo."LocationID"
LIMIT 100;

-- Explicit inner join (Same as above with minor changes):
SELECT
tpep_pickup_datetime,
tpep_dropoff_datetime,
total_amount,
CONCAT(zpu."Borough", '/', zpu."Zone") AS "pickup_loc",
CONCAT(zdo."Borough", '/', zdo."Zone") AS "dropoff_loc"
FROM
yellow_taxi_trips t JOIN zones zpu
ON t."PULocationID" = zpu."LocationID"
JOIN zones zdo
ON t."DOLocationID" = zdo."LocationID"
LIMIT 100;

-- Left Join (Same as above with just 1 keyword change):
-- This is done to check if there are null values that don't correspond in both tables
SELECT
tpep_pickup_datetime,
tpep_dropoff_datetime,
total_amount,
CONCAT(zpu."Borough", '/', zpu."Zone") AS "pickup_loc",
CONCAT(zdo."Borough", '/', zdo."Zone") AS "dropoff_loc"
FROM
yellow_taxi_trips t LEFT JOIN zones zpu
ON t."PULocationID" = zpu."LocationID"
LEFT JOIN zones zdo
ON t."DOLocationID" = zdo."LocationID"
LIMIT 100;