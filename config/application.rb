# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ensemble
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_job.queue_adapter = :delayed_job

    # Log to STDOUT because Docker expects all processes to log here. You could
    # then redirect logs to a third party service on your own such as systemd,
    # or a third party host such as Loggly, etc..
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.log_tags  = [:subdomain, :uuid]
    config.logger = ActiveSupport::TaggedLogging.new(logger)

    # Action mailer settings.
    config.action_mailer.delivery_method = :sendmail
    # Defaults to:
    # config.action_mailer.sendmail_settings = {
    #   location: '/usr/sbin/sendmail',
    #   arguments: '-i'
    # }
    # config.action_mailer.smtp_settings = {
    #  address:              ENV['SMTP_ADDRESS'],
    #  port:                 ENV['SMTP_PORT'].to_i,
    #  domain:               ENV['SMTP_DOMAIN'],
    #  user_name:            ENV['SMTP_USERNAME'],
    #  password:             ENV['SMTP_PASSWORD'],
    #  authentication:       ENV['SMTP_AUTH'],
    #  enable_starttls_auto: ENV['SMTP_ENABLE_STARTTLS_AUTO'] == 'true'
    # }

    config.action_mailer.default_url_options = {
      host: ENV['ACTION_MAILER_HOST']
    }
    config.action_mailer.default_options = {
      from: ENV['ACTION_MAILER_DEFAULT_FROM']
    }

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories/'
    end
  end
end
