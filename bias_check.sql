SELECT 
  "Gender" AS category,
   gender AS category_values,
   COUNT(*) AS group_distribution
FROM `project.dataset.gym_members_exercise_tracking_refined`
GROUP BY 1,2 
  
UNION ALL

SELECT 
  "Workout Type" AS category,
   workout_type AS category_values,
       COUNT(*) AS group_distribution
FROM `project.dataset.gym_members_exercise_tracking_refined`
GROUP BY 1,2 

UNION ALL

SELECT 
  "Experience Level" AS category,
   CAST(experience_level AS STRING) AS category_values,
   COUNT(*) AS group_distribution
FROM `project.dataset.gym_members_exercise_tracking_refined`
GROUP BY 1,2 

ORDER BY 1
