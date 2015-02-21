require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Ostbesser
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
  end
end
