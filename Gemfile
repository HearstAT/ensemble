source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# graphing and charting capabilities
gem 'chartkick', git: 'https://github.com/aaronblythe/chartkick.git', branch: 'add_highstock'
gem 'faker'
gem 'groupdate', github: 'ankane/groupdate', branch: 'sqlite'
gem 'highstock-rails'
gem 'kaminari', '~> 0.17.0'
gem 'will_paginate'
# Use Sidekiq as a background job processor through Active Job
gem 'sidekiq', '~> 4.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Ruby 2.3 is failing when trying to debug, may need to use this version
  # gem 'debase', '>= 0.2.2.beta8'
  gem 'debase', '~>0.2.2.beta10'
  gem 'ruby-debug-ide', '~> 0.6.1.beta4'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
end

gem 'activeadmin', '~> 1.0.0.pre5'
gem 'devise'
gem 'httparty'
# Rails 5 work around
gem 'inherited_resources', '~> 1.7'

gem 'daemons'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'whenever', require: false

# Windows (and alpine linux) do not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'
