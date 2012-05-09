ENV["RAILS_ENV"] ||= 'test'

if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start
end

def load_all(*patterns)
  patterns.each { |pattern| Dir[pattern].sort.each { |path| load File.expand_path(path) } }
end

def configure
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'capybara/rails'

  load_all 'spec/support/**/*.rb'

  RSpec.configure do |c|
    c.include Devise::TestHelpers, :type => :controller
    c.include Devise::TestHelpers, :type => :view
    c.include Devise::TestHelpers, :type => :helper
    c.render_views

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
end

if defined?(Spork)
  Spork.prefork  { configure }
  Spork.each_run do
    # FIXME: Reloading lib won't work :(
    # load_all 'lib/**/*.rb', 'config/routes.rb'
  end
else
  configure
end
