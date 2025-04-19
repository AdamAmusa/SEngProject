require 'spec_helper'

describe WorkoutPlan, type: :model do
  
  describe 'completion feature' do
    it 'can be marked as completed' do
      plan = WorkoutPlan.new(day: 'Monday', completed: false)
      expect(plan.completed).to be false

      plan.completed = true
      expect(plan.completed).to be true
    end


    it 'saves the completed status to the database' do
      plan = WorkoutPlan.create!(day: 'Tuesday', completed: false)
      expect(plan.completed).to be false

      plan.update(completed: true)
      expect(plan.reload.completed).to be true
    end
  end
end