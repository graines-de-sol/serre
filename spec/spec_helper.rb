ENV["RAILS_ENV"] ||= 'test'

if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start
end

def load_all(*patterns)
  patterns.each { |pattern| Dir[pattern].sort.each { |path| load File.expand_path(path) } }
end

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
include Warden::Test::Helpers

load_all 'spec/support/**/*.rb'

#### Poltergeist
#require 'capybara/poltergeist'
#Capybara.javascript_driver = :poltergeist

#### Selenium
require 'selenium-webdriver'
Capybara.default_driver = :selenium

RSpec.configure do |c|
  c.include Devise::TestHelpers, :type => :controller
  c.include Devise::TestHelpers, :type => :view
  c.include Devise::TestHelpers, :type => :helper
  c.render_views

  c.include Capybara::DSL

  c.mock_with :rspec

  c.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  c.before :each do
    DatabaseCleaner.start
  end

  c.after :each do
    DatabaseCleaner.clean
  end
end


