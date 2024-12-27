WITH
-- More cheap and efficient to call the source once and refer downstream to this CTE
cte_source AS (
SELECT 
  * 
FROM `project.dataset.gym_members_exercise_tracking_refined`
)
  
SELECT
  'age' AS field_name,
  AVG(age) AS mean,
  MIN(age) AS min,
  MAX(age) AS max,
  STDDEV(age) AS stddev
FROM cte_source 
  
UNION ALL

SELECT
  'weight_kg' AS field_name,
  AVG(weight_kg) AS mean,
  MIN(weight_kg) AS min,
  MAX(weight_kg) AS max,
  STDDEV(weight_kg) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'height_m' AS field_name,
  AVG(height_m) AS mean,
  MIN(height_m) AS min,
  MAX(height_m) AS max,
  STDDEV(height_m) AS stddev
FROM cte_source

UNION ALL
  
SELECT
  'max_bpm' AS field_name,
  AVG(max_bpm) AS mean,
  MIN(max_bpm) AS min,
  MAX(max_bpm) AS max,
  STDDEV(max_bpm) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'avg_bpm' AS field_name,
  AVG(avg_bpm) AS mean,
  MIN(avg_bpm) AS min,
  MAX(avg_bpm) AS max,
  STDDEV(avg_bpm) AS stddev
FROM  cte_source 
  
UNION ALL
  
SELECT
  'resting_bpm' AS field_name,
  AVG(resting_bpm) AS mean,
  MIN(resting_bpm) AS min,
  MAX(resting_bpm) AS max,
  STDDEV(resting_bpm) AS stddev
FROM cte_source
  
UNION ALL
  
SELECT
  'session_duration_hours' AS field_name,
  AVG(session_duration_hours) AS mean,
  MIN(session_duration_hours) AS min,
  MAX(session_duration_hours) AS max,
  STDDEV(session_duration_hours) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'calories_burned' AS field_name,
  AVG(calories_burned) AS mean,
  MIN(calories_burned) AS min,
  MAX(calories_burned) AS max,
  STDDEV(calories_burned) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'fat_percentage' AS field_name,
  AVG(fat_percentage) AS mean,
  MIN(fat_percentage) AS min,
  MAX(fat_percentage) AS max,
  STDDEV(fat_percentage) AS stddev
FROM  cte_source 
  
UNION ALL
  
SELECT
  'water_intake_liters' AS field_name,
  AVG(water_intake_liters) AS mean,
  MIN(water_intake_liters) AS min,
  MAX(water_intake_liters) AS max,
  STDDEV(water_intake_liters) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'bmi' AS field_name,
  AVG(bmi) AS mean,
  MIN(bmi) AS min,
  MAX(bmi) AS max,
  STDDEV(bmi) AS stddev
FROM cte_source 
  
UNION ALL
  
SELECT
  'workout_frequency_days_week' AS field_name,
  AVG(workout_frequency_days_week) AS mean,
  MIN(workout_frequency_days_week) AS min,
  MAX(workout_frequency_days_week) AS max,
  STDDEV(water_intake_liters) AS stddev
FROM cte_source

