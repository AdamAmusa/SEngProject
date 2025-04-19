Feature: Workout Plan CRUD and Filtering

Background: workout plans in database

    Given the following workout plans exist:
    | day       | workouts                                                                                    |
    | Wednesday | [{"name": "Push-ups", "sets" : 3, "reps": 2},{"name": "Pull-ups", "sets" : 12, "reps": 10}] |                                                                                   
    | Monday    | [{"name": "Dips", "sets" : 5, "reps": 10},{"name": "Press-ups", "sets" : 12, "reps": 10}]   |
    | Thursday  | [{"name": "Dips", "sets" : 4, "reps": 9},{"name": "Sit-Ups", "sets" : 8, "reps": 10}]       |
    | Tuesday   | [{"name": "Squats", "sets" : 2, "reps": 8},{"name": "Jumping-Jacks", "sets" : 8, "reps": 2}]|
    | Friday    | [{"name": "Squats", "sets" : 8, "reps": 10},{"name": "Pull-ups", "sets" : 12, "reps": 10}]  |

  Scenario: deleting a workout plan
    Given I am on the show page for "Monday"
    When I press "Delete"
    And I should see "Workout Plan was successfully deleted"

  Scenario: creating a workout plan
    Given I am on the home page 
    And I follow "Add new workout plan"  
    When I select "Saturday" from "Day"
    And I fill in "Workout 1 Name" with "Push-ups"
    And I fill in "Workout 1 Sets" with "3"
    And I fill in "Workout 1 Reps" with "15"
    And I fill in "Workout 2 Name" with "Box-Jumps"
    And I fill in "Workout 2 Sets" with "5"
    And I fill in "Workout 2 Reps" with "10"
    And I fill in "Workout 3 Name" with "Deadlift"
    And I fill in "Workout 3 Sets" with "1"
    And I fill in "Workout 3 Reps" with "30"
    And I fill in "Workout 4 Name" with "Bench Press"
    And I fill in "Workout 4 Sets" with "2"
    And I fill in "Workout 4 Reps" with "15"
    And I press "Save Changes"
    Then I should be on the workout plans page
    And I should see "Workout Plan was successfully created."
    
  Scenario: editing a workout plan
    Given I am on the show page for "Friday"
    And I follow "Edit"
    When I select "Sunday" from "Day"
    And I fill in "Workout 1 Name" with "Bench Press"
    And I fill in "Workout 1 Sets" with "5"
    And I fill in "Workout 1 Reps" with "10"
    And I fill in "Workout 2 Name" with "Deadlift"
    And I fill in "Workout 2 Sets" with "6"
    And I fill in "Workout 2 Reps" with "8"
    And I press "Update Workout Info"
    Then I should be on the show page for "Sunday"
    And I should see "Workout Plan was successfully updated"

  Scenario: filtering days
    Given I am on the workout plans page
    When I uncheck the following days: Monday, Tuesday
    And I press "Refresh"
    Then I should not see the following workout plans: Monday, Tuesday

  Scenario: sorting days
    Given I am on the workout plans page
    When I follow "Days"  
    Then I should see "Monday" before "Tuesday"

    

    
