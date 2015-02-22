require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Maliinfo
  class Application < Rails::Application
    config.time_zone = 'Europe/Paris'
    config.i18n.default_locale = :fr
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  end
end
