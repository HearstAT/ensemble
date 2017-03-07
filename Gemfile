source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
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
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# graphing and charting capabilities
gem 'chartkick', :git => 'https://github.com/aaronblythe/chartkick.git', :branch => 'add_highstock'
gem "groupdate", github: "ankane/groupdate", branch: "sqlite"
gem 'faker'
gem 'highstock-rails'
gem 'will_paginate'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Ruby 2.3 is failing when trying to debug, may need to use this version
  #gem 'debase', '>= 0.2.2.beta8'
  gem 'debase', '~>0.2.2.beta10'
  gem 'ruby-debug-ide', '~> 0.6.1.beta4'
end

gem 'httparty'
gem 'devise'
gem 'activeadmin', github: 'activeadmin/activeadmin' 
# Rails 5 work around
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

gem 'daemons'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'whenever', require: false


# Rake 12.0.0 released Dec 6, 2016 https://rubygems.org/gems/rake/
# Getting this error on Docker:
# Bundler::GemNotFound: Your bundle is locked to rake (12.0.0), but that version could not be found in any of the sources listed in your Gemfile. If you haven't changed sources, that means the author of rake (12.0.0) has removed it. You'll need to update your bundle to a different version of rake (12.0.0) that hasn't been removed in order to install
#gem 'rake', '~> 11.3'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
