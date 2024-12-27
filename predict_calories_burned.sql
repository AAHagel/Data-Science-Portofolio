SELECT
  age,
  weight_kg,
  session_duration_hours,
  is_cardio,
  is_hiit,
  is_strength,
  is_yoga,
  calories_burned,
  predicted_calories_burned -- Compare calories burned vs predicted calories burned
FROM
  ML.PREDICT(MODEL `project.dataset.gym_members_exercise_analysis_model`, (
    SELECT
      age,
      weight_kg,
      session_duration_hours,
      is_cardio,
      is_hiit,
      is_strength,
      is_yoga,
      calories_burned
    FROM
      `project.dataset.gym_members_exercise_tracking_refined`
  ))
