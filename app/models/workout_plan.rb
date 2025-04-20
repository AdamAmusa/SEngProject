class WorkoutPlan < ActiveRecord::Base
  has_many :workouts, dependent: :destroy
  accepts_nested_attributes_for :workouts, allow_destroy: true

  def self.all_days
    distinct.pluck(:day)
  end

  def self.completed
    where(completed: true)
  end


  def self.with_days(days, sort_by) 
    day_order = <<-SQL
      CASE day
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
      END  
    SQL
      scope = days ? where(day: days.map(&:capitalize)) : all
      sort_by == 'day' ? scope.order(Arel.sql(day_order)) : scope.order(sort_by)
  end
end
