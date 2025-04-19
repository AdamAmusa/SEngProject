Feature: Workout Plan completion

Background: workout plans in database
    Given the following workout plans exist:
    | day       | workouts                                                                                    |
    | Wednesday | [{"name": "Push-ups", "sets" : 3, "reps": 2},{"name": "Pull-ups", "sets" : 12, "reps": 10}] |                                                                                   
    | Monday    | [{"name": "Dips", "sets" : 5, "reps": 10},{"name": "Press-ups", "sets" : 12, "reps": 10}]   |
    | Thursday  | [{"name": "Dips", "sets" : 4, "reps": 9},{"name": "Sit-Ups", "sets" : 8, "reps": 10}]       |
    | Tuesday   | [{"name": "Squats", "sets" : 2, "reps": 8},{"name": "Jumping-Jacks", "sets" : 8, "reps": 2}]|
    | Friday    | [{"name": "Squats", "sets" : 8, "reps": 10},{"name": "Pull-ups", "sets" : 12, "reps": 10}]  |


  Scenario:User completes a workout plan
    Given I am on the workout plans page
    Given I am on the show page for "Wednesday"
    And I check "Complete Plan"
    And I press "Confirm"
    Then I follow "Back to Schedule"
    Then Wednesday row should be grey

  Scenario: User fails to complete a workout plan
    Given I am on the workout plans page
    Given I am on the workout plans page
    Given I am on the show page for "Wednesday"
    And I check "Complete Plan"
    Then I follow "Back to Schedule"
    Then Wednesday row should not be grey