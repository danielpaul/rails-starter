require_relative "boot"

require "rails/all"
require_relative "../lib/generators/credentials_generator"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RapidRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.time_zone = "UTC"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end

    # RapidRails generators
    config.autoload_paths << "#{root}/lib/generators"


    # Phlex
    config.autoload_paths << "#{root}/app/views"
    config.autoload_paths << "#{root}/app/views/layouts"
    config.autoload_paths << "#{root}/app/views/components"

    # Custom error pages
    config.exceptions_app = routes

    # Mailer
    config.action_mailer.default_url_options = {host: ENV["HOST"] || 'localhost:3000'}
    config.action_mailer.asset_host = ENV["ASSET_HOST"] || ENV["HOST"] || 'localhost:3000'

    # Active Storage
    config.active_storage.queue = :low_priority
  end
end
