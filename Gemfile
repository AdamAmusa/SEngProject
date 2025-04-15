source 'https://rubygems.org'

gem 'rails', '4.2.11.3'
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'
gem 'bootstrap', '~> 5.2.3'
gem 'sassc-rails'
gem 'bundler', '~> 1.17.3'

# for Heroku deployment
group :development, :test do
  gem 'sqlite3', '~> 1.3.0'
  gem 'byebug'
  gem 'database_cleaner', '1.4.1'
  gem 'capybara', '2.4.4'
  gem 'launchy'
  gem 'rspec-rails', '3.7.2'
  gem 'ZenTest', '4.11.2'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'
  gem 'simplecov', require: false 
end

group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor'
  gem 'ffi', '< 1.17'  
end