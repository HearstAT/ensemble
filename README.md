# ENSEMBLE
[![Build Status Master](https://travis-ci.org/HearstAT/ensemble.svg?branch=master)](https://travis-ci.org/HearstAT/ensemble)
[![Code Climate](https://codeclimate.com/github/HearstAT/ensemble/badges/gpa.svg)](https://codeclimate.com/github/HearstAT/ensemble) [![Test Coverage](https://codeclimate.com/github/HearstAT/ensemble/badges/coverage.svg)](https://codeclimate.com/github/HearstAT/ensemble/coverage) [![Issue Count](https://codeclimate.com/github/HearstAT/ensemble/badges/issue_count.svg)](https://codeclimate.com/github/HearstAT/ensemble)

## Requirements

* Ruby Version 2.3.x
* Docker and Docker Compose (Latest)
* Postgresql (tested with 9.5 and 9.6)
* sqlite

### Ruby

Installing Ruby is a personal preference.  [RVM](https://rvm.io/rvm/install) is an option:

```
rvm install ruby-2.3.3
rvm use ruby-2.3.3
rvm gemset create rails
rvm gemset use rails
gem install bundler
```

### Postgresql

To run development or production you will want to install Postgres in some way.  A simple way to do this on a Mac is Homebrew.

```
brew update && brew upgrade
brew install postgresql
# brew update && brew upgrade postgresql
brew services start postgresql
# ps auxwww | grep postgres

# create a user for the database
createuser -P -d -e railstest1
```

NOTE: the user you create will need to match what is in config/database.yml

Other useful commands:

```
brew services list
brew services restart postgresql
brew services stop postgresql
```

### sqlite

While the sqlite that comes with a Mac should be sufficient.  Sqlite is keg-only for homebrew.  Please log an issue if you run into any thing.

## Development

### Preparing the development environment

```
git clone https://github.com/HearstAT/ensemble.git
bundle install
 
# For debugging have to use binstubs, then follow with replacing rails
bundle install --binstubs --path vendor/bundle
bundle exec rails app:update:bin
```

Potentially you can seed the environment with:

```
bundle exec bin/rake db:seed
```

However this falls out of date from time to time and will not have your email address/domain.

To create the first user you will need to use the rails console (like irb for rails) and create the first user.  Note you will want to use an actual email address since it will send an email

```
bundle exec rails c

Domain.create!(domain: 'example.com')
User.create!(email: 'test@example.com', password: 'password', password_confirmation: 'password', admin: true)
```

To use a completely fake account try:

```
bundle exec rails c

Domain.create!(domain: 'example.com')
newuser = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password', admin: true)
newuser.confirm
newuser.save!
```

### Visual Studio Code support as an IDE

There is a .vscode/launch.json provided it will support:

* Attach to Docker
  * There are docker-compose files that launch in debug mode and will not bring the server up fully until you hit the 'Start Debugging' on this setting
* Debug Local File
  * Will attempt to run the file currently open in Visual Studio Code (may not work in many cases)
* Listen for rdebug-ide
  * Will attach debugging session to 127.0.0.1:3000 if there is anything running on it 
* Debug Rails Server 
  * Will launch the Rails server in the context of the Debugger (allowing you to set breakpoints)
* Debug Rails Server 
  * Will launch the Rails server without the debugger but still show the output in the debug console
* RSpec - all
  * Will run `rspec` on all of your specs
* Test - all
  * Will run `rake test` on all of your test (currently only rspec is used for this project)
* RSpec - active spec file only
  * Will run `rspec` only on the current file you have open in Visual Studio Code
* Test - active spec file only
  * Will run `rspec` only on the current file you have open in Visual Studio Code (currently only rspec is used for this project)
* Cucumber
  * Experimental 

### Running from the command line on Mac

```
bundle exec bin/rails s
open localhost:3000
```

### Running in Docker Compose with local postgres

```
docker-compose -f dev-ps-host-docker-compose.yml up --build
docker-compose exec website bundle exec bin/rake db:create
docker-compose exec website bundle exec bin/rake db:migrate
```

For creating some test data:

```
docker-compose exec website bundle exec bin/rake db:seed
```

For creating real data for configured tools use:

```
docker-compose exec website bundle exec bin/rake gather:pagerduty_incidents
docker-compose exec website bundle exec bin/rake gather:new_relic
```


Then navigate to http://localhost:3000 and login with the credentials from the db/seeds.rb file

Cleaning up:

```
docker-compose stop
docker-compose rm
```

### Running in Docker Compose with postgres in docker

```
docker-compose -f dev-docker-compose.yml up --build
docker-compose exec website bundle exec bin/rake db:create
docker-compose exec website bundle exec bin/rake db:migrate
```

### Rails Listen Fork Bomb and how to deal with it

Repeated on a Mac I am running into the [Rails Listen Issue](https://github.com/rails/rails/issues/26158) causing the need to restart.  This can be seen with the repeated error:

```
fsevent_watch[13744] (FSEvents.framework) FSEventStreamStart: register_with_server: ERROR: f2d_register_rpc() => (null) (-21)
```

Currently I am trying:

```
DISABLE_SPRING=1
```

## Configuration

Development should run without changes to configuration.

TODO: explain the configuration for production

## How to run the test suite

```
bundle exec rspec
```

## Administration

All configuration of tool (PagerDuty, NewRelic, Chef, etc.) is done through the ActiveAdmin Console.

Once the application is running and you are logged in as a user then you need to navigate to the /admin page (eg. http://localhost:3000/admin).  You will need to be an admin user and login again.

From these screens you can add Business Units, Pager Duty Configs, New Relic Configs etc.

## Services (job queues, cache servers, search engines, etc.)

Currently a rake task is used to gather all data from the configured tools:

```
bundle exec bin/rails rake -T
bundle exec bin/rake gather:pagerduty_incidents
bundle exec bin/rake gather:new_relic
```

These tasks are idempotent and will only add new data that they find.

TODO: still working on the active job to update this regularly.

## Deployment instructions

This can be easily deployed into AWS using: https://github.com/HearstAT/cfn_ensemble

## License

Copyright 2016, Hearst Automation Team

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
