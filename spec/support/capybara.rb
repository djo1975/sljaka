# spec/support/capybara.rb

require 'capybara/rspec'
require 'capybara/rails'

Capybara.default_driver = :selenium_chrome # Možete promeniti driver prema potrebi
Capybara.javascript_driver = :selenium_chrome # Ako koristite JavaScript u testovima

RSpec.configure do |config|
  config.include Capybara::DSL
end
