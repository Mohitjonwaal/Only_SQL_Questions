-- Average Processing Time Per Machine
-- Companies That Asked This Question: Apple, Bloomberg, Amazon, Microsoft, Adobe

-- Create the Activity table
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type ENUM('start', 'end'),
    timestamp FLOAT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);

-- Insert Example Data
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end', 1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end', 4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end', 5.000);

-- Query to Calculate Average Processing Time
SELECT a1.machine_id, 
ROUND(SUM(a2.timestamp - a1.timestamp) / COUNT(a1.machine_id), 3) AS processing_time
FROM Activity a1
JOIN Activity a2 
ON a1.machine_id = a2.machine_id 
AND a1.process_id = a2.process_id
AND a1.timestamp < a2.timestamp
GROUP BY a1.machine_id;
