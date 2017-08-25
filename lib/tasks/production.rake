# frozen_string_literal: true

require_relative '../../lib/helpers/os'
require_relative '../../lib/helpers/template'
require_relative '../../lib/helpers/process'

namespace :production do
  desc 'Build from Dockerfile, Setup w/ Postgres, and Run for Production'
  task :build, %i[secret_token email_from email_host db_name db_user db_pass db_host db_pool db_port] => :environment do |_task, args|
    raise 'Secret Token Required!' unless args.secret_token
    raise 'Email config Required!' unless args.email_from
    @BUILD = true
    arg_set(args)
    docker
  end

  desc 'Pull from Dockerhub, Setup w/ Postgress, and Run for Production'
  task :pull, %i[version secret_token email_from email_host db_name db_user db_pass db_host db_pool db_port] => :environment do |_task, args|
    raise 'Secret Token Required!' unless args.secret_token
    raise 'Email config Required!' unless args.email_from
    @BUILD = false
    arg_set(args)
    docker
  end

  desc 'Install and Setup Locally w/ Postgress and Run for Production'
  task :local, %i[secret_token email_from email_host db_name db_user db_pass db_host db_pool db_port] => :environment do |_task, args|
    raise 'Secret Token Required!' unless args.secret_token
    raise 'Email config Required!' unless args.email_from
    arg_set(args)
    local
  end

  def arg_set(args)
    @VERSION = args.version || 'latest'
    @ENV = 'prod'
    @VENDOR = true
    @MOUNT = false
    @SECRET_TOKEN = args.secret_token
    @EMAIL_FROM = args.email_from
    @EMAIL_HOST = args.email_host || nil
    @DB_NAME = args.db_name || nil
    @DB_USER = args.db_user || nil
    @DB_PASS = args.db_pass || nil
    @DB_HOST = args.db_host || nil
    @DB_POOL = args.db_pool || nil
    @DB_PORT = args.db_port || nil
  end

  def local
    Rake::Task['setup:local_ps'].invoke(@ENV, @VENDOR, @SECRET_TOKEN, @EMAIL_FROM, @EMAIL_HOST, @DB_NAME, @DB_USER, @DB_PASS, @DB_HOST, @DB_POOL, @DB_PORT)
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    ENV['RACK_ENV'] = 'production'
    ENV['RAILS_ENV'] = ENV['RACK_ENV']
    build_init(true) if OS.linux?
    launch(true) if OS.posix?
    launch(false) unless OS.posix?
  end

  def docker
    Rake::Task['setup:docker'].invoke(@ENV, @MOUNT, @SECRET_TOKEN, @EMAIL_FROM, @EMAIL_HOST, @DB_NAME, @DB_USER, @DB_PASS, @DB_HOST, @DB_POOL, @DB_PORT)
    build_init(false) if OS.linux?
    system('docker build --tag=ensemble_rails ./') if @BUILD
    launch(false) if OS.linux?
    system('docker-compose up -d --force-recreate --no-deps') unless OS.linux?
    ensemble_started = false
    until ensemble_started
      sleep 10
      ensemble_started = `docker ps`.include?('ensemble_rails_1')
    end
    system('docker-compose exec -T rails bundle exec rake db:create')
    system('docker-compose exec -T rails bundle exec rake db:migrate')
  end

  def build_init(local)
    @PROJECT_DIR = Dir.pwd
    if Process.systemd?
      Template.write('docker-systemd.erb', '/etc/systemd/system/ensemble.service') unless local
      Template.write('systemd.erb', '/etc/systemd/system/ensemble.service') if local
      system('systemctl enable ensemble')
    elsif Process.upstart?
      Template.write('docker-upstart.erb', '/etc/init/ensemble.conf') unless local
      Template.write('upstart.erb', '/etc/init/ensemble.conf') if local
      system('initctl reload-configuration')
    end
  end

  def launch(local)
    if Process.systemd?
      system('systemctl start ensemble')
    elsif Process.upstart?
      system('start ensemble')
    else
      system('docker-compose up -d --force-recreate --no-deps') unless local
      system('bundle exec rails s -d') if local
    end
  end
end
