class WorkoutPlansController < ApplicationController
  before_action :force_index_redirect, only: [:index]
  def index
    @workout_plans = WorkoutPlan.with_days(days_list, sort_by)
    @sort_by = sort_by
    @days_to_show_hash = days_hash
    session[:sort_by] = @sort_by
    session[:days] = days_list
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
    @workout_plan.update(workout_plan_params)
    flash[:notice] = "Workout Plan was successfully updated"
    redirect_to workout_plan_path(@workout_plan)
  end

  def destroy
    puts('deleting')
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_plan.destroy
    flash[:notice] = "Workout Plan was successfully deleted"
    redirect_to workout_plans_path
  end

  def create
    puts params.inspect
    @workout_plan = WorkoutPlan.create!(workout_plan_params)
    puts "Saved workout plan: #{@workout_plan.day}"
    flash[:notice] = "Workout Plan was successfully created."
    redirect_to workout_plans_path
  end

  def force_index_redirect
    return unless !params.key?(:sort_by) || !params.key?(:sort_by)

    flash.keep
    url = workout_plans_path(sort_by: sort_by, days: params[:days])
    redirect_to url
  end

  def days_hash
    days_list.to_h { |item| [item, "1"]}
  end

  def days_list 
    params[:days]&.keys || session[:days] || WorkoutPlan.all_days
  end

  def sort_by
    params[:sort_by] || session[:sort_by] || 'id'
  end

  def workout_plan_params
    params.require(:workout_plan).permit(:day, workouts_attributes: [:id, :name, :sets, :reps, :_destroy])
  end

end
