require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets'
require 'sprockets/railtie'
require 'jquery/rails'

require 'combustion'
require 'capybara/rspec'

Combustion.initialize! :action_view, :action_controller, :sprockets

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
