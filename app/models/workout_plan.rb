class WorkoutPlan < ActiveRecord::Base
  has_many :workouts
  accepts_nested_attributes_for :workouts, allow_destroy: true
end
