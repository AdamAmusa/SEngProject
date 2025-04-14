class RemoveWorkoutIdsFromWorkoutPlans < ActiveRecord::Migration
  def change
    remove_column :workout_plans, :workout_ids, :text
  end
end
