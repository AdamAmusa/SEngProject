# Submission: Brief Project Description & Reflection
This application is a workout scheduler that allows users to create workout plans for each
day of the week followed by 4 workouts with each their own sets and reps. The relational structure
of the resource is of a WorkoutPlan table with **day** (string) and **completed** (boolean).
The Workout plan has a "has_many" relationship with the Workout table which contains
the **name** (string), **sets** (int), and **reps** (int). The additional feature that I added is a highlighter
that highlights the row of the workout plan which matches the current day, I also added a 
completion feature which greys out the workout plan when it is marked as completed. After writing tests
for all my features, I achieved a code coverage of 100% with cucumber and 88% with rspec. Writing tests
reminded me of the importance of labeling forms to make it visible for test automation. Using
rails made me thoughtful about naming conventions especially when it comes to Models and their associations, 
and abiding by them made understanding my database structure easier.
