class AddWorkoutPlanIdToWorkouts < ActiveRecord::Migration
  def change
    add_reference :workouts, :workout_plan, index: true, foreign_key: true
  end
end
