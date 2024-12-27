-- Create or replace the table with necessary transformations, checks, and renaming
CREATE OR REPLACE TABLE `project.dataset.gym_members_exercise_tracking_refined` AS
  
WITH 

cte_cleaned_data AS (
SELECT DISTINCT -- Removes duplicates
  
  -- Age: Remove invalid ages (e.g., negative or unrealistic values)
  CASE
    WHEN Age < 18 OR Age > 100 THEN NULL
    ELSE Age
  END AS age,
  
  -- Gender: If NULL, set to 'Other'
  CASE
    WHEN Gender IS NULL THEN "Other"
    ELSE Gender
  END AS gender,
  
  -- Weight: Remove invalid weight values (e.g., negative or unrealistic)
  CASE
    WHEN Weight__kg_ <20 OR Weight__kg_ >200  THEN NULL
    ELSE Weight__kg_
  END AS weight_kg,
  
-- Weight: Remove invalid height values (e.g., negative or unrealistic)
  CASE
    WHEN Height__m_ < 1.0 OR Height__m_ > 2.5 THEN NULL  
    ELSE Height__m_
  END AS height_m,
  
  -- Max BPM: Remove unrealistic max BPM values (e.g., below 40 or above 220)
  CASE
    WHEN Max_BPM < 40 OR Max_BPM > 220 THEN NULL  
    ELSE Max_BPM
  END AS max_bpm
  
  -- Average BPM: Remove unrealistic average BPM values (e.g., below 40 or above 180)
  CASE
    WHEN Avg_BPM < 40 OR Avg_BPM > 180 THEN NULL
    ELSE Avg_BPM
  END AS avg_bpm,
  
  -- Resting BPM: Remove unrealistic resting BPM values (e.g., below 40 or above 120)
  CASE
    WHEN Resting_BPM < 40 OR Resting_BPM > 120 THEN NULL
    ELSE Resting_BPM
  END AS resting_bpm,
  
  -- Session Duration: Remove unrealistic session durations (e.g., negative values or more than 12 hours)
  CASE
    WHEN Session_Duration__hours_ < 0 OR Session_Duration__hours_ > 12 THEN NULL
    ELSE Session_Duration__hours_
  END AS session_duration_hours,
  
  -- Calories Burned: Remove unrealistic calories burned values (e.g., below 50 or above 5000)
  CASE
    WHEN Calories_Burned < 50 OR Calories_Burned > 5000 THEN NULL
    ELSE Calories_Burned
  END AS calories_burned,
  
  -- Workout Type: If NULL, set to 'Unknown'
  CASE
    WHEN Workout_Type IS NULL THEN 'Unknown'
    ELSE Workout_Type
  END AS workout_type,
  
  -- Fat Percentage: Remove unrealistic fat percentages (e.g., below 0 or above 100)
  CASE
    WHEN Fat_Percentage < 0 OR Fat_Percentage > 100 THEN NULL
    ELSE Fat_Percentage
  END AS fat_percentage,
  
  -- Water Intake: Remove unrealistic water intake values (e.g., below 0 or above 10 litres)
  CASE
    WHEN Water_Intake__liters_ < 0 OR Water_Intake__liters_ > 10 THEN NULL
    ELSE Water_Intake__liters_
  END AS water_intake_liters,
  
  -- Workout Frequency: Remove unrealistic workout frequencies (e.g., below 0 or more than 7 days/week)
  CASE
    WHEN Workout_Frequency__days_week_ < 0 OR Workout_Frequency__days_week_ > 7 THEN NULL
    ELSE Workout_Frequency__days_week_
  END AS workout_frequency_days_week,
  
  -- Experience Level: Remove unrealistic experience levels (e.g., below 1 or above 5)
  CASE
    WHEN Experience_Level < 1 OR Experience_Level > 5 THEN NULL
    ELSE Experience_Level
  END AS experience_level,
  
  -- BMI: Remove unrealistic BMI values (e.g., below 10 or above 50)
  CASE
    WHEN BMI < 10 OR BMI > 50 THEN NULL
    ELSE BMI
  END AS bmi
FROM `project.dataset.gym_members_exercise_tracking`
WHERE
  Age > 0 -- Age is directly associated with fitness performance so it is important to have values for all records
  AND Session_Duration__hours_ > 0 -- A must because active duration can have a major impact on all the other metrics
) 
  
SELECT * FROM cte_cleaned_data

