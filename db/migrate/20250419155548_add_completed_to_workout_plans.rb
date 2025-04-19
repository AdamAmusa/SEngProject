class AddCompletedToWorkoutPlans < ActiveRecord::Migration
  def change
    add_column :workout_plans, :completed, :boolean
  end
end
