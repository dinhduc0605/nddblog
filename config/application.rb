# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DucnojinseiBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Where the I18n library should search for translation files
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}')]

    # Whitelist locales available for the application
    I18n.available_locales = %i[vi ja]

    # Set default locale to something other than :en
    I18n.default_locale = :vi

    # Set auto load path
    config.enable_dependency_loading = true
    config.autoload_paths += %W[#{config.root}/lib]

    config.generators do |g|
      g.test_framework  false
      g.assets  false
      g.helper false
    end
  end
end
