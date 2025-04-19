# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


WorkoutPlan.destroy_all
Workout.destroy_all


WorkoutPlan.create!(
  day: 'Wednesday',
  workouts_attributes: [
    { name: 'Pull-ups', sets: 2, reps: 5 },
    { name: 'Sit-ups', sets: 1, reps: 50 },
    { name: 'Dips', sets: 5, reps: 10 },
    { name: 'Deadlift', sets: 10, reps: 5}
  ]
)

WorkoutPlan.create!(
  day: 'Tuesday',
  workouts_attributes: [
    { name: 'Dips', sets: 5, reps: 10 },
    { name: 'Pull-ups', sets: 2, reps: 5 },
    {name: 'Bench-Press', sets: 5, reps:15},
    {name: 'lat-pulldown', sets:10, reps:8}
  ]
)

WorkoutPlan.create!(
  day: 'Monday',
  workouts_attributes: [
    { name: 'Push-ups', sets: 5, reps: 10 },
    { name: 'Sit-ups', sets: 1, reps: 50 }, 
    { name: 'Pull-ups', sets: 2, reps: 5 },
    { name: 'Dips', sets: 5, reps: 10 },
  ]
)


WorkoutPlan.create!(
  day: 'Thursday',
  workouts_attributes: [
    { name: 'Squats', sets: 5, reps: 10 },
    { name: 'Dips', sets: 5, reps: 10 },
    { name:'Box-Jump', sets: 10, reps:10},
    { name: 'Sit-ups', sets: 1, reps: 50 },

  ]
)

WorkoutPlan.create!(
  day: 'Saturday',
  workouts_attributes: [
    { name: 'Dips', sets: 5, reps: 10 },
    { name: 'Pull-ups', sets: 2, reps: 5 },
    { name: 'Dips', sets: 5, reps: 10 },
    { name: 'Deadlift', sets: 10, reps: 5}
  ]
)

WorkoutPlan.create!(
  day: 'Friday',
  workouts_attributes: [
    { name: 'Push-ups', sets: 5, reps: 10 },
    { name: 'Dips', sets: 5, reps: 10 },
    { name: 'Curls', sets: 5, reps: 12 },
    { name: 'Shoulder-Press', sets: 5, reps: 20}
  ]
)


WorkoutPlan.create!(
  day: 'Sunday',
  workouts_attributes: [
    { name: 'Squats', sets: 5, reps: 10 },
    { name: 'Sit-ups', sets: 1, reps: 50 },
    {name: 'Weighted-Squats', sets: 8, reps:10},
    {name: 'leg-raises', sets: 10, reps:10}

  ]
)
