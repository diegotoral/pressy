require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pressy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Load locales form subdirectories.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
  end
end
