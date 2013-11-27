Refuge::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  config.assets.paths << "#{Rails.root}/app/assets/fonts"

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.action_mailer.default_url_options = { :host => 'serre.com' }

  config.time_zone = 'Paris'

  smtp_config_file = File.join(Rails.root, 'config', 'smtp.rb')
  if File.exists?(smtp_config_file)
    # Let me define here my own private SMTP for dev.
    require smtp_config_file
  else
    SMTP_SETTINGS = { :address => "smtp.host.com", :port => 25, :domain => "domain.com" }
  end

  ActionMailer::Base.smtp_settings = SMTP_SETTINGS

end

