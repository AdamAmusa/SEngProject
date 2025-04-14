Rails.application.routes.draw do
  resources :workout_plans
  root to: redirect('/workout_plans')
end
