require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CurrencyRate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
		config.active_job.queue_adapter = :sidekiq
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # currency_rate is service name.
    config.logger = Logger.new(Rails.root.join('log', "currency_rate_app-#{Rails.env}.log"))
    config.cache_store = :redis_cache_store, { url: ENV.fetch("REDIS_URL_CACHE") { "redis://localhost:6379/0" } }
  end
end
