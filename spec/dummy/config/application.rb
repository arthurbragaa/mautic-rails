require_relative 'boot'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)
require "mautic"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.sqlite3&.represent_boolean_as_integer = true
    config.active_record.legacy_connection_handling = false
  end
end

