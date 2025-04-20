require 'rails_helper'

describe WorkoutPlansController, type: :controller do
  let(:workout) do
    {
      day: 'Tuesday',
      completed: true,
      workouts_attributes:[
        {
          name: 'Push-ups', sets: 10, reps: 5
        }
      ]
    }
  end
  
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

  context 'In the index page' do
    it 'can sort workout plans by days' do
      plan1_id = "1234"
      plan2_id = "2468"
      plan1 = double('fake_plan1', day: 'Tuesday', completed: true)
      plan2 = double('fake_plan2', day: 'Thursday', completed: false)
      allow(WorkoutPlan).to receive(:with_days).with(['Tuesday', 'Thursday'], 'day').and_return([plan1, plan2])

      get :index, sort_by: 'day', days: {'Tuesday' => '1', 'Thursday' => '2'}

      expect(response).to render_template(:index)
      expect(assigns(:workout_plans)).to eq([plan1, plan2])
      expect(session[:sort_by]).to eq('day')
    end

    it 'can filter workout plans by days' do
      plan1_id = "1234"
      plan2_id = "2468"
      plan1 = double('fake_plan1', day: 'Tuesday', completed: true)
      plan2 = double('fake_plan2', day: 'Thursday', completed: false)
      plan3 = double('fake_plan3', day: 'Friday', completed: false)

      allow(WorkoutPlan).to receive(:with_days).with(['Tuesday', 'Thursday'], 'id').and_return([plan1, plan2])
      get :index, sort_by: 'id', days: {'Tuesday' => '1', 'Thursday' => '1'}

      expect(response).to render_template(:index)
      expect(assigns(:workout_plans)).to match_array([plan1, plan2])
      expect(session[:sort_by]).to eq('id')
    end
  end

  context 'When a user creates a new workout plan' do
    it 'saves a new workout plan and redirects to the index page' do
      post :create, workout_plan:workout
      expect(response).to redirect_to(workout_plans_path)
      expect(flash[:notice]).to eq("Workout Plan was successfully created.")
    end


  end

  context 'When a user deletes a workout plan' do
    it 'deletes the workout plan and redirects to the index page' do
      plan_id = "1234"
      plan = double('fake_plan', day: 'Monday', completed: false)
      allow(WorkoutPlan).to receive(:find).with(plan_id).and_return(plan)
      allow(plan).to receive(:destroy)

      delete :destroy, id: plan_id

      expect(flash[:notice]).to eq("Workout Plan was successfully deleted")
      expect(response).to redirect_to(workout_plans_path)
    end
  end

  context 'a user views a workout plan' do
    it 'renders the show page' do
      plan_id = "1234"
      plan = double("fake_plan", day: 'Monday', completed: false)
      allow(WorkoutPlan).to receive(:find).with(plan_id).and_return(plan)
      allow(plan).to receive(:workouts).and_return([])

      get :show, id: plan_id
      expect(response).to render_template(:show)
      expect(assigns(:workout_plan)).to eq(plan)
    end
  end

  context 'a user edits a workout plan' do
    it 'renders the edit page' do
      plan_id = "1234"
      plan = double("fake_plan", day: 'Monday', completed: false)
      allow(WorkoutPlan).to receive(:find).with(plan_id).and_return(plan)
      allow(plan).to receive(:workouts).and_return([])

      get :edit, id: plan_id

      expect(response).to render_template(:edit)
      expect(assigns(:workout_plan)).to eq(plan)
    end
  end

end