Sentry.init do |config|
  config.dsn = Rails.application.credentials.dig(:sentry, :dsn) || ENV["SENTRY_DSN"]

  # Don't enable in development or testing
  config.enabled_environments = %w[production staging]
  config.environment = ENV["NAMESPACE_ENV"] || "development"

  # Logger
  config.breadcrumbs_logger = [:active_support_logger]

  # Release
  config.release = ENV["GIT_SHA"]

  # Sent events asynchronously
  config.async = lambda do |event, hint|
    Sentry::SendEventJob.perform_later(event, hint)
  end

  # Filter Sensitive Data using Rails
  sanitizer = Rails.application.config.filter_parameters
  filter = ActiveSupport::ParameterFilter.new(sanitizer)
  config.before_send = lambda do |event, hint|
    filter.filter(event.to_hash)
  end

  # Allow for UserIP/Cookie/RequestBody data
  config.send_default_pii = true
end
