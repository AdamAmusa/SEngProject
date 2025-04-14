class WorkoutPlansController < ApplicationController

  def index
    @workout_plans = WorkoutPlan.all
  end


  def show
    @workout_plan = WorkoutPlan.find params[:id]
    @exercises = @workout_plan.workouts
  end


  def edit
    @workout_plan = WorkoutPlan.find params[:id]
    @exercises = @workout_plan.workouts
  end

  def update
    @workout_plan = WorkoutPlan.find params[:id]
    @workout_plan.update!(workout_plan_params)
    redirect_to workout_plan_path(@workout_plan)
  end

  def destroy
    puts('deleting')
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_plan.destroy
    redirect_to workout_plans_path
  end



  def workout_plan_params
    params.require(:workout_plan).permit(:day, workouts_attributes: [:id, :name, :sets, :reps, :_destroy])
  end

end
