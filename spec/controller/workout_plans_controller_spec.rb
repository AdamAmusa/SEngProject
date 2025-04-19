require 'rails_helper'

describe WorkoutPlansController, type: :controller do
  context 'When user confirms completion' do
    it 'marks the changes as complete and saves to the database' do
      plan_id = "1234"
      plan = double('fake_plan', day: 'Monday', completed: false)
      allow(WorkoutPlan).to receive(:find).with(plan_id).and_return(plan)
      allow(plan).to receive(:workouts).and_return([])
      expect(plan).to receive(:update).with({"completed" =>true}).and_return(true)

      patch :update, id: plan_id, workout_plan:{completed:true}

      expect(response).to redirect_to(workout_plan_path(plan))
      expect(flash[:notice]).to match(/.*Workout Plan was successfully updated/)
    end

    it 'shows an error message when update fails' do
      plan_id = "1234"
      plan = double('fake_plan', day: 'Monday', completed: false)
      allow(WorkoutPlan).to receive(:find).with(plan_id).and_return(plan)
      allow(plan).to receive(:workouts).and_return([])
      expect(plan).to receive(:update).with({"completed" =>true}).and_return(false)

      patch :update, id: plan_id, workout_plan:{completed:true}

      expect(response).to render_template(:edit)
      expect(flash[:alert]).to match(/.*Failed to update Workout Plan/)
    end  
  end
end