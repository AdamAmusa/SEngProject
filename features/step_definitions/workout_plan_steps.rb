Given(/the following workout plans exist/) do |workout_plans_table|
  workout_plans_table.hashes.each do |workout_plan|
    WorkoutPlan.create!(
      day: workout_plan[:day],
      workouts_attributes: JSON.parse(workout_plan["workouts"])
    )
  end
end