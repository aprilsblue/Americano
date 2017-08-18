Rails.application.configure do
  # mailer setting
  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: ENV['MAILGUN_API_KEY'],
    domain: ENV['MAILGUN_DOMAIN']
  }
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # config.action_mailer.perform_deliveries = true
  # Settings specified here will take precedence over those in config/application.rb.

  # Setting for Mailer_devlop mode

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  #config.action_mailer.perform_deliveries = true
  #config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.smtp_settings = {
    #:address => "email-smtp.us-west-2.amazonaws.com",
    #:port => 587,
    #:user_name => ENV["SES_SMTP_USERNAME"], #Your SMTP user
    #:password => ENV["SES_SMTP_PASSWORD"], #Your SMTP password
    #:authentication => :login,
    #:enable_starttls_auto => true
  #}

  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
