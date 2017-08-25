# frozen_string_literal: true

namespace :quickstart do
  desc 'Build from Dockerfile, Setup, and Run with sarter Fake Data'
  task :build, %i[env mount] => :environment do |_task, args|
    args.with_defaults(env: 'dev', mount: false)
    raise '[Error] - This task is only functional for non-prod setups. Please use the production task' if args.env == 'prod'
    @BUILD = true
    quick_docker(args)
  end

  desc 'Pull from Dockerhub, Setup, and Run with starter Fake Data'
  task :pull, %i[env mount] => :environment do |_task, args|
    args.with_defaults(env: 'dev', mount: false)
    raise '[Error] - This task is only functional for non-prod setups. Please use the production task' if args.env == 'prod'
    @BUILD = false
    quick_docker(args)
  end

  desc 'Install, Setup, and Run locally with starter Fake Data'
  task :local, %i[env detached] => :environment do |_task, args|
    args.with_defaults(env: 'dev', detached: true)
    raise '[Error] - This task is only functional for non-prod setups. Please use the production task' if args.env == 'prod'
    @BUILD = false
    quick_local(args)
  end

  def quick_local(args)
    Rake::Task['setup:local'].invoke(args.env, args.mount)
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    ENV['RACK_ENV'] = 'test' if args.env == 'test'
    ENV['RACK_ENV'] = 'production' if args.env == 'prod'
    ENV['RAILS_ENV'] = ENV['RACK_ENV']
    system('bundle exec rails s') unless args.detached
    system('bundle exec rails s -d') if args.detached
  end

  def quick_docker(args)
    Rake::Task['setup:docker'].invoke(args.env, args.mount)
    system('docker-compose up -d --force-recreate --no-deps')
    system('docker-compose exec rails bundle exec rake db:create')
    system('docker-compose exec rails bundle exec rake db:migrate')
    system('docker-compose exec rails bundle exec rake db:seed')
  end
end
