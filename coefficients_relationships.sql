SELECT 
  processed_input,
  CASE
    WHEN processed_input = "__INTERCEPT__" THEN "β0"
    WHEN processed_input = "age" THEN "β1"
    WHEN processed_input = "session_duration_hours" THEN "β2"
    WHEN processed_input = "weight_kg" THEN "β3"
    WHEN processed_input = "is_strength" THEN "β4"
    WHEN processed_input = "is_cardio" THEN "β5"
    WHEN processed_input = "is_hiit" THEN "β6"
    WHEN processed_input = "is_yoga" THEN "β7"
  END AS coefficient,   
  weight,
  CASE
    WHEN weight IS NULL OR weight = 0 THEN "No significant relationship"
    WHEN weight < 0 THEN "Negative impact; inverse relationship"
    WHEN weight > 0 THEN "Positive impact; direct relationship"
  END AS relationship
  FROM 
  (
    SELECT processed_input, weight FROM
      ML.WEIGHTS(MODEL `project.dataset.gym_members_exercise_analysis_model`)
  ) 
 
