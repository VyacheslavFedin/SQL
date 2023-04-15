USE hw_5;
DROP TABLE IF EXISTS trains;
CREATE TABLE trains
(
    -- id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	
    train_id INT,
    station VARCHAR(25),
    station_time TIME
    
);

INSERT trains
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
	(120, "Palo Alto", "12:49:00"), 
	(120, "San Jose", "13:30:00"); 
    
SELECT *
FROM trains;

SELECT
	train_id,
	station,
    station_time,
    TIMEDIFF( LEAD(station_time) OVER (ORDER BY train_id, station_time), station_time ) AS "time_to_next_station" 
    
FROM trains
-- GROUP BY train_id; --  не понял как сделать