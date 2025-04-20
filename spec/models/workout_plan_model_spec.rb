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


    it 'returns only completed workout plans' do
      completed_plan = WorkoutPlan.create!(day: 'Monday', completed: true)
      incomplete_plan = WorkoutPlan.create!(day: 'Tuesday', completed: false)

      expect(WorkoutPlan.completed).to include(completed_plan)
      expect(WorkoutPlan.completed).not_to include(incomplete_plan)
    end
  end

  describe 'workout plan creation' do
    it 'saves workout plans to database' do
      plan1 = WorkoutPlan.create!(day: 'Friday', completed: false, workouts_attributes:[{
      name: 'Push-ups', sets: 10, reps:5}
      ])
        
      plan2 = WorkoutPlan.create!(day: 'Saturday', completed: true, workouts_attributes:[{
      name: 'Squats', sets: 6, reps:10}
      ])
      
      
      expect(WorkoutPlan.exists?(plan1.id)).to be true
      expect(WorkoutPlan.exists?(plan2.id)).to be true
    end
  end

  describe 'workout plan deletion' do
    it 'can be deleted on the database' do
      plan = WorkoutPlan.create!(day: 'Friday', completed: false)
      expect(WorkoutPlan.exists?(plan.id)).to be true

      plan.destroy
      expect(WorkoutPlan.exists?(plan.id)).to be false
    end

    it 'deletes associated workouts too' do
      plan = WorkoutPlan.create!(day: 'Friday', completed: false)
      workout1 = plan.workouts.create!(name: 'Push-ups', sets: 10, reps: 5)
      workout2 = plan.workouts.create!(name: 'Press-ups', sets: 12, reps: 1)

      expect(Workout.exists?(workout1.id)).to be true
      expect(Workout.exists?(workout2.id)).to be true

      plan.destroy

      expect(Workout.exists?(workout1.id)).to be false
      expect(Workout.exists?(workout2.id)).to be false
    end
  end
end