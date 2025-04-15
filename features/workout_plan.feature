Feature: Workout Plan creation and other functionality

Background: workout plans in database

    Given the following workout plans exist:
    | day       | workouts                                                                                    |
    | Monday    | [{"name": "Dips", "sets" : 5, "reps": 10},{"name": "Press-ups", "sets" : 12, "reps": 10}]   |
    | Tuesday   | [{"name": "Squats", "sets" : 2, "reps": 8},{"name": "Jumping-Jacks", "sets" : 8, "reps": 2}]|
    | Wednesday | [{"name": "Push-ups", "sets" : 3, "reps": 2},{"name": "Pull-ups", "sets" : 12, "reps": 10}] |
    | Thursday  | [{"name": "Dips", "sets" : 4, "reps": 9},{"name": "Sit-Ups", "sets" : 8, "reps": 10}]       |
    | Friday    | [{"name": "Squats", "sets" : 8, "reps": 10},{"name": "Pull-ups", "sets" : 12, "reps": 10}]  |

  Scenario: deleting a workout plan
    Given I am on the show page for "Monday"
    When I press "Delete"
