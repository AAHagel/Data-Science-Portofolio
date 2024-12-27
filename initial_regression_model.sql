CREATE OR REPLACE MODEL `project.dataset.gym_members_exercise_analysis_model`
OPTIONS( model_type='linear_reg', input_label_cols=['calories_burned']) AS
  
SELECT 
  age,
  workout_type_code,
  calories_burned
FROM `project.dataset.gym_members_exercise_tracking_refined`
