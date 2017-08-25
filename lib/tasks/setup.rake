# frozen_string_literal: true

require_relative '../../lib/helpers/os'
require_relative '../../lib/helpers/template'
require 'socket'

namespace :setup do
  desc "Setup Ensemble locally, pass setup:local['dev'] to setup as dev (Defaults: env: prod, vendor: true)"
  task :local, %i[env vendor secret_token email_from db_name db_user db_pass db_host db_pool db_port email_host] => :environment do |task, args|
    @TASK = task.to_s.partition(':').last
    args.with_defaults(defaults(@TASK))
    @ARGS = args
    write
  end

  desc "Setup Ensemble locally, pass setup:local['dev'] to setup as dev (Defaults: env: prod, vendor: true)"
  task :local_ps, %i[env vendor secret_token email_from db_name db_user db_pass db_host db_pool db_port email_host] => :environment do |task, args|
    @TASK = task.to_s.partition(':').last
    args.with_defaults(defaults(@TASK))
    @ARGS = args
    @ARGS[:postgres] = true
    write
  end

  desc "Setup Ensemble in a Docker container, pass setup:docker['dev'] to setup as dev. Prod is default"
  task :docker, %i[env mount secret_token email_from db_name db_user db_pass db_host db_pool db_port email_host] => :environment do |task, args|
    @TASK = task.to_s.partition(':').last
    @BUILD = true if args.env == 'dev' && @BUILD.blank?
    args.with_defaults(defaults(@TASK))
    @ARGS = args
    write
    validate
  end

  desc "Setup Ensemble and a Postgres instance in Docker, pass setup:docker_ps['dev'] to setup as dev. Prod is default"
  task :docker_ps, %i[env mount secret_token email_from db_name db_user db_pass db_host db_port db_pool email_host] => :environment do |task, args|
    @TASK = task.to_s.tr('setup:', '')
    @BUILD = true if args.env == 'dev' && @BUILD.blank?
    args.with_defaults(defaults(@TASK))
    @ARGS = args
    @ARGS[:postgres] = true
    write
    validate
  end

  desc 'Command for Dockerfile Creation, creates a database.yml used by docker'
  task :docker_config, %i[env] => :environment do |task, args|
    @TASK = task.to_s.partition(':').last
    args.with_defaults(defaults(@TASK))
    @ARGS = args
    Template.write('database.yml.erb', "#{Dir.pwd}/config/database.yml")
  end

  def defaults(task)
    local_ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
    defaults = {
      env: 'prod',
      email_host: 'localhost:3000',
      email_from: 'test@example.com',
      postgress: false,
      secret_token: '54ef5c6de5808a21e45cc2d18ebfc4a92d3b70662712fea617f1beb2dcf781188497fbaf100cf4ace77d9b2da544dab2a94f33f7f43044467dd2707737c65f7b',
      db_name: 'railstest',
      db_user: 'railstest1',
      db_pass: 'railstest',
      db_host: local_ip,
      db_port: 5432,
      db_pool: 10
    }
    defaults[:mount] = false unless task == 'local'
    defaults[:vendor] = true if task == 'local'
    defaults
  end

  def write
    @PROJECT_DIR = Dir.pwd
    Template.write('database.yml.erb', "#{Dir.pwd}/config/database.yml")
    Template.write('docker-compose.yml.erb', "#{Dir.pwd}/docker-compose.yml") if @TASK.include? 'docker'
    Template.write('env.erb', "#{Dir.pwd}/.docker.env") if @TASK.include? 'docker'
  end

  def validate
    docker_val = system('command -v docker > /dev/null') if OS.posix?
    compose_val = system('command -v docker-compose > /dev/null') if OS.posix?
    docker_val = system('where -v docker') if OS.windows?
    compose_val = system('where docker-compose') if OS.windows?
    raise 'Docker not installed, please see <https://github.com/HearstAT/ensemble/#optional-requirements>' unless docker_val
    raise 'Docker Compose not installed, please see <https://github.com/HearstAT/ensemble/#optional-requirements>' unless compose_val
  end
end
