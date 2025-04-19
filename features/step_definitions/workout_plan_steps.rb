Given(/the following workout plans exist/) do |workout_plans_table|
  workout_plans_table.hashes.each do |workout_plan|
    WorkoutPlan.create!(
      day: workout_plan[:day],
      workouts_attributes: JSON.parse(workout_plan["workouts"])
    )
  end
end

Then(/I should see "(.*)" before "(.*)"/) do |_e1, _e2|
  table = find('table#workout_plans')
  content = table.text
  expect(content.index(_e1)).to be <content.index(_e2)
end


Then(/(.*) row should (not )?be grey/) do |day, _no|
  table = find('table#workout_plans')
  content = table.find('tr', text: day)
  if _no
    expect(content[:class]).not_to include('completed-workout')
  else
    expect(content[:class]).to include('completed-workout')
  end
end
      

Then(/^I should (not )?see the following workout plans: (.*)$/) do |_no, _workout_plan_list| 
  table = find('table#workout_plans')
  content = table.text
  _workout_plan_list.split(',').each do |plan|
    plan.strip!
    if _no
      expect(content).not_to include(plan)
    else
      expect(content).to include(plan)
      end
    end
end

When(/I (un)?check the following days: (.*)/) do |_uncheck, _days_list|
  _days_list.split(',').each do |day|
    day.strip!
    if _uncheck
        steps %Q{
            When I uncheck the "#{day}" checkbox
        }
    else
        steps %Q{
            When I check the "#{day}" checkbox
        }
      end
    end
end