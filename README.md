# ENSEMBLE

Things you may want to cover:

* Ruby version

This has been developed/tested on Ruby 2.3.x

* Running in Docker Compose

    docker-compose up --build
    docker-compose exec website bundle exec bin/rake db:create
    docker-compose exec website bundle exec bin/rake db:migrate

For creating some test data:

    docker-compose exec website bundle exec bin/rake db:seed

Then navigate to http://localhost:3000 and login with the credentials from the db/seeds.rb file

Cleaning up:

    docker-compose stop
    docker-compose rm

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
