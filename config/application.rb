require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Require settings
require_relative "../lib/core_ext/rails/settings"

# @changeme
# Change `RailsProjectTemplate` to whatever your application name is
module RailsProjectTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Use sidekiq for background jobs
    config.active_job.queue_adapter = :sidekiq

    # Always use redis for cache store
    # https://docs.stimulusreflex.com/deployment
    config.cache_store = :redis_cache_store, {
      driver: :hiredis,
      url: ENV.fetch("REDIS_CACHE_STORE_URL") { "redis://localhost:6379/1" }
    }

    # ActionController Configuration
    config.action_controller.default_url_options = {
      host: ENV.fetch("DOMAIN") { "localhost" },
      port: ENV.fetch("PORT") { 3000 }
    }

    # ActionMailer Configuration
    config.action_mailer.default_url_options = {
      host: ENV.fetch("DOMAIN") { "localhost" },
      port: ENV.fetch("PORT") { 3000 }
    }
  end
end
