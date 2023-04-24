require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = "UTC"

    config.i18n.available_locales = [:en, :pt]
    config.i18n.default_locale = :en


  end
end